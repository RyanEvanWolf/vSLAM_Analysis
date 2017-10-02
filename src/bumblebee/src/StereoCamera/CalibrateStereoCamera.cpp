#include <ros/console.h>
#include <ros/ros.h> 
#include <tf2_ros/transform_listener.h>
#include "bumblebee/StereoCamera/StereoBumble.hpp"
#include <Structures/CameraInfo/StereoRect.hpp>
#include <Structures/CameraInfo/Single.hpp>

#include "bumblebee/StereoCamera/CalibrationConfig.hpp"

bool genImageList(std::string inputDir,std::vector<std::string> &outFileNames);
void findCorners(std::vector<std::string> &leftIn,std::vector<std::string> &rightIn,std::vector< std::vector<cv::Point2f> > &leftFound,std::vector< std::vector<cv::Point2f> > &rightFound,stereo::CalibrationConfig &conf);
bool robustCheckerBoard(cv::Mat &inImage,std::vector<cv::Point2f> &pts,stereo::CalibrationConfig &conf);
std::vector< int > genAllPossibleChess();

int main(int argc, char** argv){
  ros::init(argc, argv, "StereoCoordinateNode");
  
  if(argc!=2)
  {
	  ROS_ERROR_STREAM("Incorrect number of arguments");
	  ROS_ERROR_STREAM("Expected ---  configuration.xml");
	  return -1;
  }
  std::string configDir=argv[1];
  
  stereo::CalibrationConfig config;
  
  cv::FileStorage inNode(configDir,cv::FileStorage::READ);
  
  if(inNode.isOpened())
  {
	  inNode["Calibration"]>>config;
  }
  else
  {
	  ROS_ERROR_STREAM("Failed to open configuration File "<<configDir);
	  return -1;
  }
  inNode.release();
  
  config.createDirectories();
  ROS_INFO_STREAM("XML configuration Loaded");
  std::vector<std::string> leftInputImageFiles,rightInputImageFiles;
  genImageList(config.leftInputImageDir,leftInputImageFiles);
  genImageList(config.rightInputImageDir,rightInputImageFiles);
  
  std::vector< std::vector<cv::Point2f> > leftPts,rightPts;
  
  

  ROS_INFO_STREAM("Searching for Corners");
  findCorners(leftInputImageFiles,rightInputImageFiles,leftPts,rightPts,config);
  //calibrate individual cameras
  //begin camera calibration 	
	std::vector<cv::Mat> tempR,tempT;//dummy variables, not interested in the rotation and translation of the checkerboard
	cv::Mat tempk,tempd;

	double rms_left,rms_right;
	cv::Mat leftK,rightK;
	cv::Mat leftD,rightD;
	ROS_INFO_STREAM("Calibrating Left Camera");
	rms_left=cv::calibrateCamera(config.genSetBoardCoordinate(leftPts.size()),
								leftPts,config.calibrationSize,
								leftK,leftD,tempR,tempT,
								config.getCalibrationFlags());
	ROS_INFO_STREAM("RMS ERROR:\t"<<rms_left);
	
	ROS_INFO_STREAM("Calibrating Right Camera");
	rms_right=cv::calibrateCamera(config.genSetBoardCoordinate(rightPts.size()),
								rightPts,config.calibrationSize,
								rightK,rightD,tempR,tempT,
								config.getCalibrationFlags());
	ROS_INFO_STREAM("RMS ERROR:\t"<<rms_right);
	ROS_INFO_STREAM("Beginning Stereo Calibration");
	//get vector of board coordinates
	std::vector< std::vector< cv::Point3f > > board_;
	for(int index=0;index<leftPts.size();index++)
	{
		board_.push_back(config.genBoardCoordinate());
	}
	double stereoRMS;
	cv::Mat stR,stT,stE,stF;

	if(config.distortionModel.compare("ParameterFour")==0)
	{
		//use the five parameter model
		std::cout<<"4 Parameter Model Detected\n";
		stereoRMS=cv::stereoCalibrate(board_,
										  leftPts,rightPts,
										  leftK,leftD,
										  rightK,rightD,
										  config.calibrationSize,
										  stR,stT,stE,stF,
										  cv::TermCriteria(cv::TermCriteria::COUNT||cv::TermCriteria::EPS,1e-06,5000),
										  CV_CALIB_USE_INTRINSIC_GUESS);
	}
	else if(config.distortionModel.compare("ParameterEight")==0)
	{
		std::cout<<"8 Parameter Model Detected\n";
		//use the four parameter model
		stereoRMS=cv::stereoCalibrate(board_,
										  leftPts,rightPts,
										  leftK,leftD,
										  rightK,rightD,
										  config.calibrationSize,
										  stR,stT,stE,stF,
										  cv::TermCriteria(cv::TermCriteria::COUNT||cv::TermCriteria::EPS,1e-06,5000),
											CV_CALIB_USE_INTRINSIC_GUESS|CV_CALIB_FIX_K3);
	}
	else
	{
		std::cout<<"5 Parameter Model Detected\n";
		stereoRMS=cv::stereoCalibrate(board_,
										  leftPts,rightPts,
										  leftK,leftD,
										  rightK,rightD,
										  config.calibrationSize,
										  stR,stT,stE,stF,
										  cv::TermCriteria(cv::TermCriteria::COUNT||cv::TermCriteria::EPS,1e-06,5000),
											CV_CALIB_USE_INTRINSIC_GUESS|CV_CALIB_RATIONAL_MODEL);
	}
	ROS_INFO_STREAM("Stereo RMS\t"<<stereoRMS);
	//rectify parameters
	
	stereo::StereoRect finalStereo;
	cv::Mat rectRl,rectRr;
	cv::Mat pl,pr;
	cv::Mat Q;
	cv::Rect lROI,rROI;
	cv::Size newSize;
	
	ROS_INFO_STREAM("Beginning StereoRectification");
	cv::Rect t1,t2;
    cv::stereoRectify(leftK,leftD, rightK,rightD,config.calibrationSize,
                      stR,stT,rectRl,rectRr,pl,pr,Q,
                      cv::CALIB_ZERO_DISPARITY,1,newSize,&lROI,&rROI);
	
	cv::Mat IdealCamera=pl(cv::Rect(0,0,3,3));
	//compute rectification maps
	cv::initUndistortRectifyMap(leftK,leftD,rectRl,
								IdealCamera,config.calibrationSize,CV_32FC1,
								finalStereo.L_fMapx_,finalStereo.L_fMapy_);
	
	cv::initUndistortRectifyMap(rightK,rightD,rectRr,
								IdealCamera,config.calibrationSize,CV_32FC1,
								finalStereo.R_fMapx_,finalStereo.R_fMapy_);
	cv::initUndistortRectifyMap(leftK,leftD,rectRl,
								IdealCamera,config.calibrationSize,CV_16SC2,
								finalStereo.L_iMapx_,finalStereo.L_iMapy_);
	
	cv::initUndistortRectifyMap(rightK,rightD,rectRr,
								IdealCamera,config.calibrationSize,CV_16SC2 ,
								finalStereo.R_iMapx_,finalStereo.R_iMapy_);
	//
	//compute Isometries//
	stereo::Isometry lefti,leftRecti;
	stereo::Isometry righti,rightRecti;
	stereo::Isometry fullBaseline;
	//left Camera as Origin
	lefti.setIdentity();
	leftRecti.setRT(rectRl,cv::Mat::zeros(3,1,CV_64FC1));
	//		
	righti.setRT(stR,stT);
	rightRecti.setRT(rectRr,cv::Mat::zeros(3,1,CV_64FC1));
		

	
	//populate outputFiles
	finalStereo.l_ROI_=lROI;
	finalStereo.r_ROI_=rROI;
	Q.copyTo(finalStereo.Qmap_);
	pl.copyTo(finalStereo.P_l_);
	pr.copyTo(finalStereo.P_r_);
	stR.copyTo(finalStereo.R_);
	stT.copyTo(finalStereo.T_);
	stE.copyTo(finalStereo.E_);
	stF.copyTo(finalStereo.F_);
	
	
	
	finalStereo.lIso_=lefti;
	finalStereo.lrectIso_=leftRecti;
	finalStereo.rIso_=righti;
	finalStereo.rrectIso_=rightRecti;
	
	cv::FileStorage ff(config.getStereoFile(),cv::FileStorage::WRITE);
	ff<<"leftRMS"<<rms_left;
	ff<<"rightRMS"<<rms_right;
	//ff<<"found"<<leftPts.size();
	//ff<<"rejected"<<config.maskImagesRemoved_.size();
	ff<<"StereoRMS"<<stereoRMS;
	ff<<"StereoRect"<<finalStereo;
	ff.release();
	
	Analysis::StereoBumble myCam(config.getStereoFile());

	//display Stereo Output
	//get test images
	
	
	for(int index=0;index<leftPts.size();index++)
	{
		std::string leftFullDir,rightFullDir;
		leftFullDir=config.leftInputImageDir;
		leftFullDir+="/";
		leftFullDir+=leftInputImageFiles.at(index);
		
		rightFullDir=config.rightInputImageDir;
		rightFullDir+="/";
		rightFullDir+=rightInputImageFiles.at(index);

		
		cv::Mat inLeft,inRight;
		inLeft=cv::imread(leftFullDir,cv::IMREAD_GRAYSCALE);
		inRight=cv::imread(rightFullDir,cv::IMREAD_GRAYSCALE);
  
		cv::Mat roiL,roiR;
		cv::Mat zoomedl,zoomedr;
	
	
		myCam.unDistort(inLeft,zoomedl,true);
		myCam.unDistort(inRight,zoomedr,false);
	
		
		myCam.drawROI(zoomedl,roiL,true);
		myCam.drawROI(zoomedr,roiR,false);
	
	
		cv::Mat sidenormal,sideEpi;
		stereo::getSideSideRect(roiL,roiR,sidenormal);
	
		cv::imshow("t",sidenormal);
		myCam.drawEpiLines(sidenormal,sideEpi);
	//cv::imshow("aa",sidenormal);
		cv::imshow("a",sideEpi);
	
//	cv::Mat lll,rrr;
	
//	lll=zoomedl(myCam.bumbleBee_.l_ROI_);
//	rrr=zoomedr(myCam.bumbleBee_.r_ROI_);
	
	/*cv::Mat l,rr;
	cv::Mat roiL,roiR;
	cv::Mat outside,epi,ss;
  
	myCam.unDistort(inLeft,l,true);
	myCam.unDistort(inRight,rr,true);
  
  
	roiL=l(myCam.bumbleBee_.l_ROI_);
	roiR=rr(myCam.bumbleBee_.r_ROI_);
  
	stereo::getSideSideRect(roiL,roiR,outside);
  
  
	cv::namedWindow("original",cv::WINDOW_NORMAL);
	cv::namedWindow("und",cv::WINDOW_NORMAL);
	cv::namedWindow("aa",cv::WINDOW_NORMAL);
 
  
	myCam.drawEpiLines(outside,epi);
	myCam.drawROI(roiL,ss,true);
	cv::imshow("aa",epi);
	cv::imshow("und",ss);

	*/
		cv::waitKey(100);
	}

  ROS_INFO_STREAM("Saving Config to File");
  inNode.open(configDir,cv::FileStorage::WRITE);
  
  inNode<<"Calibration"<<config;

  return 0;
} 


 
 
 bool genImageList(std::string inputDir,std::vector<std::string> &outFileNames)
{
	///
	// reads all the file names provided by the input arguments
	bool Success=false;
	DIR *dp;
	struct dirent *dirp;
	if((dp=opendir(inputDir.c_str())) == NULL)//if unable to open
	{
		//std::cerr << "Error(" << errno << ") opening " <<inputDir.c_str()< std::endl;
		Success=false;
	}
	else
	{
		ROS_INFO_STREAM("Reading Images from : "<<inputDir);
		while( (dirp=readdir(dp))!= NULL) //while there are still files to be read
			{
				std::string readname(dirp->d_name); //read a single file
				bool reject=false; //reject the file
				if((readname.compare("..")==0)||(readname.compare(".")==0))
				{
					//removes the directories inherent to linux of "." and ".."
					reject=true;
				}
			
				if(!reject)//gets rid of the .  and .. directories
				{
					outFileNames.push_back(readname);
				}
				else
				{
					ROS_WARN_STREAM("file rejected "<<readname);
				}

			}
		closedir(dp);
		std::sort(outFileNames.begin(),outFileNames.end());//sort in alphabetical i.e first to last taken
		Success=true;
	}
	return Success;
}

void findCorners(std::vector<std::string> &leftIn,std::vector<std::string> &rightIn,std::vector< std::vector<cv::Point2f> > &leftFound,std::vector< std::vector<cv::Point2f> >&rightFound,stereo::CalibrationConfig &conf)
{
	std::vector<std::string>::iterator it,end,begin;
	begin=leftIn.begin();
	end=leftIn.end();
	it=leftIn.begin();
	for(it;it!=end;++it)
	{
		ROS_INFO_STREAM("Searching Matches\t"<<*it<<"\t"<<rightIn.at(std::distance(begin,it))<<"\t["<<std::distance(begin,it)<<"/"<<(std::distance(begin,end)-1)<<"]");
		if(std::find(conf.maskImagesRemoved_.begin(),conf.maskImagesRemoved_.end(),*it)==conf.maskImagesRemoved_.end())
		{
			
		
			std::vector<cv::Point2f> tempLeft,tempRight;
			cv::Mat leftImage,rightImage;
			std::string leftFullDir,rightFullDir;
			leftFullDir=conf.leftInputImageDir;
			leftFullDir+="/";
			leftFullDir+=*it;
		
			rightFullDir=conf.rightInputImageDir;
			rightFullDir+="/";
			rightFullDir+=rightIn.at(std::distance(begin,it));
		
		
			leftImage=cv::imread(leftFullDir,cv::IMREAD_GRAYSCALE);
			rightImage=cv::imread(rightFullDir,cv::IMREAD_GRAYSCALE);
		
			if(robustCheckerBoard(leftImage,tempLeft,conf)&&robustCheckerBoard(rightImage,tempRight,conf))
			{
				cv::Mat out;
				ROS_INFO_STREAM("FOUND On "<<*it);
				//refine matches further
				cv::cornerSubPix(leftImage, tempLeft, cv::Size(5, 5), cv::Size(-1, -1),
								cv::TermCriteria(CV_TERMCRIT_EPS | CV_TERMCRIT_ITER, 30, 0.1));
				cv::cornerSubPix(rightImage, tempRight, cv::Size(5, 5), cv::Size(-1, -1),
								cv::TermCriteria(CV_TERMCRIT_EPS | CV_TERMCRIT_ITER, 30, 0.1));
				leftFound.push_back(tempLeft);
				rightFound.push_back(tempRight);
				cv::cvtColor(leftImage,out,cv::COLOR_GRAY2BGR);
				cv::drawChessboardCorners(out,conf.getBoard(),tempLeft,true);
				cv::imshow("found",out);
				cv::waitKey(100);
				conf.calibrationSize=leftImage.size();
				cv::imwrite(conf.out_directory+"/found/"+conf.distortionModel+"_"+(*it),out);
			}
			else
			{
				conf.maskImagesRemoved_.push_back(*it);
				ROS_INFO_STREAM("NotFound On "<<*it);
			}
		}
		else
		{
			ROS_INFO_STREAM("ImageMask--Removed--"<<*it);
		}
		
		
	}
	cv::destroyAllWindows();	
}

bool robustCheckerBoard(cv::Mat &inImage,std::vector<cv::Point2f> &pts,stereo::CalibrationConfig &conf)
{
	
	bool found=false;
	int index=0;
	while((!found)&&(index<genAllPossibleChess().size()))
	{
		pts.clear();
		found=cv::findChessboardCorners(inImage,conf.getBoard(),pts,
										genAllPossibleChess().at(index));
		index++;
	}
	return found;
	
}

std::vector< int > genAllPossibleChess()
{
	std::vector<int> Ans;
	Ans.push_back(CV_CALIB_CB_NORMALIZE_IMAGE);
	Ans.push_back(CV_CALIB_CB_FILTER_QUADS);
	Ans.push_back(CV_CALIB_CB_ADAPTIVE_THRESH);	
	Ans.push_back(CV_CALIB_CB_NORMALIZE_IMAGE|CV_CALIB_CB_FILTER_QUADS);
	Ans.push_back(CV_CALIB_CB_NORMALIZE_IMAGE|CV_CALIB_CB_ADAPTIVE_THRESH);
	Ans.push_back(CV_CALIB_CB_FILTER_QUADS|CV_CALIB_CB_ADAPTIVE_THRESH);
	Ans.push_back(CV_CALIB_CB_NORMALIZE_IMAGE|CV_CALIB_CB_FILTER_QUADS|CV_CALIB_CB_ADAPTIVE_THRESH);

	return Ans;
}