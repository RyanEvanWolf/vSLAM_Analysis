#include "bumblebee/StereoCamera/CalibrationConfig.hpp"
#include "Structures/CameraInfo/Single.hpp"

namespace stereo
{

CalibrationConfig::CalibrationConfig()
{
	out_directory="/home/ryan/Masters/calibration";
	patternCol=10;
	patternRow=12;
	squareSize=37;
	debugInfo=true;
	robustCheckerBoard=true;
	distortionModel="5Parameter";
	leftCamFile=out_directory+"/left_"+distortionModel+".xml";
	rightCamFile=out_directory+"/right_"+distortionModel+".xml";
	stereoCamFile=out_directory+"/Stereo_"+distortionModel+".xml";
	displayMapping=false;
	displayUndistorted=false;
	displayFound=false;
}

void CalibrationConfig::write(cv::FileStorage& fs) const
{	
	/*write to XML */
	fs<<"{";
	fs<<"leftInputDir"<<leftInputImageDir;
	fs<<"rightInputDir"<<rightInputImageDir;
	fs<<"leftCameraOutFile"<<leftCamFile;
	fs<<"rightCameraOutFile"<<rightCamFile;
	fs<<"stereoOutFile"<<stereoCamFile;
	fs<<"outDirectory"<<out_directory;
	fs<<"row"<<patternRow;
	fs<<"col"<<patternCol;
	fs<<"squareSize"<<squareSize;
	fs<<"debugInfo"<<debugInfo;
	fs<<"robustCheckerBoard"<<robustCheckerBoard;
	fs<<"displayFound"<<displayFound;
	fs<<"displayUndistorted"<<displayUndistorted;
	fs<<"displayMapping"<<displayMapping;
	fs<<"DistortionModel"<<distortionModel;
	fs<<"ImageMask"<<"[";
	for(int index=0;index<maskImagesRemoved_.size();index++)
	{
		fs<<maskImagesRemoved_.at(index);
		
	}
	fs<<"]";
	fs<<"}";

}


void CalibrationConfig::read(const cv::FileNode& node)
{
	maskImagesRemoved_.clear();
	int temp;
	node["outDirectory"]>>out_directory;
	node["leftInputDir"]>>leftInputImageDir;
	node["rightInputDir"]>>rightInputImageDir;
	node["leftCameraOutFile"]>>leftCamFile;
	node["rightCameraOutFile"]>>rightCamFile;
	node["stereoOutFile"]>>stereoCamFile;
	node["row"]>>patternRow;
	node["col"]>>patternCol;
	node["squareSize"]>>squareSize;
	node["debugInfo"]>>debugInfo;
	node["robustCheckerBoard"]>>robustCheckerBoard;
	node["displayFound"]>>displayFound;
	node["displayUndistorted"]>>displayUndistorted;
	node["displayMapping"]>>displayMapping;
	node["DistortionModel"]>>distortionModel;
	//distortionModel=std::string(node["DistortionModel"]);
	
	cv::FileNodeIterator meas_it,meas_end;
	meas_it=node["ImageMask"].begin();
	meas_end=node["ImageMask"].end();
	
	for(;meas_it!=meas_end;++meas_it)
	{
		maskImagesRemoved_.push_back(std::string(*(meas_it)));
	}
	
}

void CalibrationConfig::print()
{
	/*Small print out function for debug purposes*/
	std::cout<<"OutputDirectory\t"<<out_directory<<std::endl;
	std::cout<<"patternRow\t"<<patternRow<<std::endl;
	std::cout<<"patternCol\t"<<patternCol<<std::endl;
	std::cout<<"patternSize\t"<<squareSize<<std::endl;	
	std::cout<<"Debug info\t"<<debugInfo<<std::endl;
	std::cout<<"displayUndistort\t"<<displayUndistorted<<std::endl;
	std::cout<<"displayMap\t"<<displayMapping<<std::endl;
	std::cout<<"robustCheckerBoard\t"<<robustCheckerBoard<<std::endl;
	std::cout<<"displayFound\t"<<displayFound<<std::endl;
	std::cout<<"DistortionModel\t"<<distortionModel<<std::endl;
	std::cout<<"Images Removed \t[";
	for(int index=0;index<maskImagesRemoved_.size();index++)
	{
		std::cout<<maskImagesRemoved_.at(index);
		if(index==maskImagesRemoved_.size()-1)
		{
		}
		else
		{
			std::cout<<",";
		}
	}
	std::cout<<"]"<<std::endl;
	
}

cv::Size CalibrationConfig::getBoard()
{
	/*returns the inner board size of the checkerboard*/
	return cv::Size(patternRow-1,patternCol-1);
}

int CalibrationConfig::getCalibrationFlags()
{
	/*combines all the calibration flags into one single number to be 
	 * passed to opencv calibrate function*/
	int flags= 0;
	if(distortionModel.compare("ParameterFour")==0)
	{
		//FORCE the fifth distortion model, to be zero
		flags|=CV_CALIB_FIX_K3;
	}
	if(distortionModel.compare("ParameterEight")==0)
	{
		flags|=CV_CALIB_RATIONAL_MODEL;
	}
	
	
	if((distortionModel!="ParameterFour")&&(distortionModel!="ParameterEight"))
	{
		std::cout<<"ERROR ! DISTORTION MODEL NOT SPECIFIED -flag - "<<distortionModel<<std::endl;
		std::cout<<"Using 5 parameter model"<<std::endl;
	}
	
	return flags;
}

std::vector< cv::Point3f > CalibrationConfig::genBoardCoordinate()
{
	return getChessPoints(getBoard(),squareSize,1).at(0);
}


std::vector< std::vector< cv::Point3f > > CalibrationConfig::genSetBoardCoordinate(int image_total)
{
	
	return getChessPoints(getBoard(),squareSize,image_total);

}


std::vector< std::vector< cv::Point3f > > getChessPoints(cv::Size board, double square_size, int n)
{
	/*produces a vector of chesspoints relative to the checkerboard, requires the size of the inner board,
	 * the physical dimensions of the squares used in the calibration,
	 * and the total number of copies n to be made*/
	std::vector< std::vector< cv::Point3f > > Ans;
	
	for(int pattern=0;pattern<n;pattern++)
	{
		std::vector< cv::Point3f > singleBoard;
		for(int row=0;row<board.height;row++)
		{
			for(int col=0;col<board.width;col++)
			{
				cv::Point3f tempPoint;
				tempPoint.x=col*square_size;
				tempPoint.y=row*square_size;
				tempPoint.z=0;
				singleBoard.push_back(tempPoint);
			}
		}
		Ans.push_back(singleBoard);
	}
	return Ans;

}

std::string CalibrationConfig::getLeftFile()
{
	return out_directory+"/"+leftCamFile+distortionModel+".xml";
}

std::string CalibrationConfig::getRightFile()
{
	return out_directory+"/"+rightCamFile+distortionModel+".xml";
}

std::string CalibrationConfig::getStereoFile()
{
	return out_directory+"/"+stereoCamFile+distortionModel+".xml";
}


void CalibrationConfig::createDirectories()
{
	std::stringstream command;
	command<<"mkdir -pv "<<out_directory<<"/found";
	std::system(command.str().c_str());
}















}
