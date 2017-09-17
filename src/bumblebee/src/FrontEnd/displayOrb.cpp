#include <ros/ros.h>
#include "bumblebee/DirectoryUtilities.hpp"
#include "Structures/vSLAM/StereoFeatures.hpp"
#include <fstream>
#include <std_msgs/Int32.h>
#include <std_msgs/Float32.h>


//Stereo visual display features 
#include "Structures/DataSet/BumbleDataSet.hpp"
#define DEFAULT_RECT "/home/ryan/git/groundTruth/gt/output/Stereo4/RectifiedBumble4.xml"
#include "vSLAM_FrontEnd/Detection/OrbDetector.hpp"
#include "vSLAM_FrontEnd/StereoFront/StereoCamera.hpp"
#include "vSLAM_FrontEnd/StereoFront/Matching.hpp"
#include <opencv2/highgui.hpp>

bool Paused=false;
double PlayHz=1000/15;
bool exitPlayback=false;

void playBackUpdate(const std_msgs::Int32::ConstPtr& msg)
{
	if(msg->data==32)
	{
		Paused = !Paused;
	}
	if(msg->data==113)
	{
		exitPlayback=true;
	}
	if(msg->data==259)
	{
		//increase speed
	}
}

int main(int argc, char** argv)
{
	
	ros::init(argc, argv, "displayOrb");
	if(argc!=4)
	{
		std::cerr << std::endl << "Incorrect Number of Parameters -example usage -->" << std::endl;
	    std::cerr <<"displayOrb [inputDataSetName] [outputDirectory] [DetectorName]" << std::endl;
	    std::cerr <<"displayOrb D1 ~/out ORB" << std::endl;
        return 1;
	}
	//Create the various Parameters 
	
	int nmax=10000;//want to retain as many features as possible
	int firstVect=0;
	std::vector<float> scale_vect;
	std::vector<int> level_vect;
	std::vector<int> edge_vect;
	std::vector<int> wta_vect;
	std::vector<int> score_vect;
	std::vector<int> patch_vect;
	
	for(int index=1; index<2;index++)
	{
		scale_vect.push_back(0.05*index);
	}
	for(int index=1;index<2;index++)
	{
		level_vect.push_back(index);
	}
	for(int index=1;index<2;index++)
	{
		edge_vect.push_back(index);
	}
	for(int index=2;index<5;index++)
	{
		wta_vect.push_back(index);
	}
	
	score_vect.push_back(cv::ORB::kBytes);
	score_vect.push_back(cv::ORB::HARRIS_SCORE);
	score_vect.push_back(cv::ORB::FAST_SCORE);
	
	for(int index=2;index<3;index++)
	{
		patch_vect.push_back(index);
	}
	
	///initialize ros and the dataset
	
	
	ros::NodeHandle n;
	SaveDirectoryInfo outConfig=getInfo(argc,argv);
	using namespace stereo;
	
	//initialize the BumbleBee dataset and camera
	BumbleDataSet bumbleData(outConfig.directory[DirectoryNames::inputDirectory]);
	
	cv::namedWindow("leftImage",cv::WINDOW_NORMAL);
	cv::namedWindow("rightImage",cv::WINDOW_NORMAL);
	cv::namedWindow("match",cv::WINDOW_NORMAL);
	
	
	ros::Subscriber keySub = n.subscribe("/keyPress", 15, playBackUpdate);
	ros::Publisher leftF=n.advertise<std_msgs::Int32>("leftFeatures",2);
	ros::Publisher rightF=n.advertise<std_msgs::Int32>("rightFeatures",2);
	ros::Publisher inlierPub=n.advertise<std_msgs::Float32>("inlier",2);
	//begin loop ...Transform broadcasts + image updates

	
	
	//setup frontEnd configuration
	
	cv::Ptr<DetectorSettings> leftDetection= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	cv::Ptr<DetectorSettings>  rightDetection= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	cv::Ptr<DetectorSettings>  leftDescriptor= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	cv::Ptr<DetectorSettings>  rightDescriptor= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	DetectorSettings *CurrentDetector_;
   
	StereoCamera Cam(leftDetection,rightDetection,
					leftDescriptor,rightDescriptor,
					DEFAULT_RECT);
	std::cout<<"newOrb sequence beginning"<<std::endl;
								
	Matching m;
   
	while(!exitPlayback)
	{
		
		if(Paused)
		{
			//increment and decrementFrames
		}
		else
		{
			StereoFrame out;
			Cam.extractStereoFrame(bumbleData.getCurrentLeft(),bumbleData.getCurrentRight(),out);
	
			cv::Mat lP,rP,mm;
			cv::drawKeypoints(Cam.lroi_,out.leftFeatures_,lP);
			cv::drawKeypoints(Cam.rroi_,out.rightFeatures_,rP);
								
			exitPlayback=!bumbleData.incrementFrame();
			std::cout<<bumbleData.getCurrentName()<<std::endl;
			
			std_msgs::Int32 totalLeft,totalRight;
			totalLeft.data=out.leftFeatures_.size();
			totalRight.data=out.rightFeatures_.size();
		
			leftF.publish(totalLeft);
			rightF.publish(totalRight);
			
			std::vector<std::vector<cv::DMatch> > initial_;

			m.knnMatch(out,initial_);
			
			m.filterLoweRatio(initial_,out.inliersMask_,out.matches_);

			cv::drawMatches(Cam.lroi_,out.leftFeatures_,
								Cam.rroi_,out.rightFeatures_,
								out.matches_,mm);//,
								//cv::Scalar::all(-1),cv::Scalar::all(-1),out.inliersMask_);
							
			std_msgs::Float32 r;
			r.data=float(out.matches_.size())/(float(initial_.size()));
			
			inlierPub.publish(r);

			
			//cv::imshow("leftImage",lP);
			//cv::imshow("rightImage",rP);
			cv::imshow("match",mm);
			cv::waitKey(PlayHz);
		}
		
		
	/*  if(buttonPressed==65362)
		  {
			  //increase the frameRate
			  if(frameRate-1000/120>=0)
			  {
				  frameRate-=1000/120;
				  ROS_INFO_STREAM("New Frame delay ="<<frameRate);
			  }
			  else
			  {
				  ROS_INFO_STREAM("Frame delay is already as low as possible = "<<frameRate<<"ms");
			  }
		  }
		  if(buttonPressed==65364)
		  {
			  frameRate+=1000/120;
			  std::cout<<"Frame Delay incrased = "<<frameRate<<"ms"<<std::endl;
		  }
*/
	/*	 
		  else
		  {
			if(buttonPressed==32)
		    {
			  ROS_INFO_STREAM("Unpaused");
			  paused=false;
		    }
		    if(buttonPressed==65361)
			{
				bumbleData.decrementFrame();
				std::cout<<bumbleData.getCurrent()<<std::endl;
			}
			if(buttonPressed==65363)
			{
				bumbleData.incrementFrame();
				std::cout<<bumbleData.getCurrent()<<std::endl;
			}
		    cv::imshow("leftImage",bumbleData.getCurrentLeft());
		    cv::imshow("rightImage",bumbleData.getCurrentRight());
		  }
		  
	  }*/
	  ros::spinOnce();
  }
  
  
  
 /*DetectorSettings *CurrentDetector_;
	

for(int scaleindex=0;scaleindex<scale_vect.size();scaleindex++)
	{
		for(int levelindex=0;levelindex<level_vect.size();levelindex++)
		{
			for(int edgeindex=0;edgeindex<edge_vect.size();edgeindex++)
			{
				for(int wtaindex=0;wtaindex<wta_vect.size();wtaindex++)
				{
					for(int scoreindex=0;scoreindex<score_vect.size();scoreindex++)
					{
						for(int patchindex=0;patchindex<patch_vect.size();patchindex++)
						{
							cv::Ptr<DetectorSettings> leftDetection= new OrbDetector(nmax,scale_vect.at(scaleindex),level_vect.at(levelindex),
																	edge_vect.at(edgeindex),firstVect,wta_vect.at(wtaindex),
																	score_vect.at(scoreindex),patch_vect.at(patchindex));
							cv::Ptr<DetectorSettings>  rightDetection= new OrbDetector(nmax,scale_vect.at(scaleindex),level_vect.at(levelindex),
																	edge_vect.at(edgeindex),firstVect,wta_vect.at(wtaindex),
																	score_vect.at(scoreindex),patch_vect.at(patchindex));
							cv::Ptr<DetectorSettings>  leftDescriptor= new OrbDetector(nmax,scale_vect.at(scaleindex),level_vect.at(levelindex),
																	edge_vect.at(edgeindex),firstVect,wta_vect.at(wtaindex),
																	score_vect.at(scoreindex),patch_vect.at(patchindex));
							cv::Ptr<DetectorSettings>  rightDescriptor= new OrbDetector(nmax,scale_vect.at(scaleindex),level_vect.at(levelindex),
																	edge_vect.at(edgeindex),firstVect,wta_vect.at(wtaindex),
																	score_vect.at(scoreindex),patch_vect.at(patchindex));
							StereoCamera Cam(leftDetection,rightDetection,
											 leftDescriptor,rightDescriptor,
											 DEFAULT_RECT);
							std::cout<<"newOrb sequence beginning"<<std::endl;
								
							outConfig.directory[DirectoryNames::DetectorSettings_]=leftDetection->getName();
							makeFullPath(outConfig);
				
							//loop through the Dataset
							bool end=false;
							int im=0;

							while(!end)
							{
								StereoFrame out;
								double tframe=(1000/15)*im;
								Cam.extractStereoFrame(bumbleData.getCurrentLeft(),bumbleData.getCurrentRight(),out);

								cv::imshow("l",Cam.lroi_);
								cv::imshow("r",Cam.rroi_);
								cv::waitKey(1);
								std::string outputName;
								outputName=getFullOutPath(outConfig);
								outputName+="/";
								outputName+=bumbleData.getCurrentName().erase(bumbleData.getCurrentName().length()-4);
								outputName+=".xml";
					
								out.frameData_=bumbleData.getCurrentMeta();
						
								std::cout<<outputName<<std::endl;
								cv::FileStorage a(outputName.c_str(),cv::FileStorage::WRITE);
								a<<"features"<<out;
								a.release();
									
								end= !bumbleData.incrementFrame();
								im++;
								std::cout<<"["<<im<<"/"<<bumbleData.getTotalImages()<<"]"<<std::endl;
							}
							std::cout<<"ResetSequence"<<std::endl;
							bumbleData.resetCurrent();
						}
					}
				}
			}
		}
	}
	std::cout<<"Finished Dataset"<<std::endl;
	cv::destroyAllWindows();
	
	
	
	*/
	
	
	
	/*ros::NodeHandle n;
	
	ros::Publisher leftF=n.advertise<std_msgs::Int32>("leftFeatures",1000);
	ros::Publisher rightF=n.advertise<std_msgs::Int32>("rightFeatures",1000);

	std::string inputDir="/home/ryan/git/vSLAM_FrontEnd/output/D1_mini/ORB/ORB_10000_0.05_1_1_0_2_32_2/";
	std::vector<std::string> readFiles=getList(inputDir);
	
	std::ofstream outFileCSV;
	std::stringstream command;
	outFileCSV.open("/home/ryan/temp.csv");

	
	for(int index=0;index<readFiles.size();index++)
	{
		std::string fullDir=inputDir;
		fullDir+="/";
		fullDir+=readFiles.at(index);
		cv::FileStorage current(fullDir,cv::FileStorage::READ);
		
		stereo::StereoFeatures now;
		current["features"]>>now;
		
		current.release();
		outFileCSV<<now.frameData_.fileName_<<","<<now.leftFeatures.size()<<","<<now.rightFeatures.size()<<std::endl;
	//	std::cout<<now.frameData_.fileName_<<"\t"<<fullDir<<std::endl;
		std_msgs::Int32 totalLeft,totalRight;
		totalLeft.data=now.leftFeatures.size();
		totalRight.data=now.rightFeatures.size();
		
		leftF.publish(totalLeft);
		rightF.publish(totalRight);
		ros::spinOnce();
	}
	outFileCSV.close();*/
	cv::destroyAllWindows();
	return 0;
  
} 
