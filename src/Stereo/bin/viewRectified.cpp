//#include "groundTruth/Calibration/SingleCalibrator.hpp"

#include "vSLAM_Analysis/Stereo/Utilities.hpp"
//#include <bitset>

/*
 * Binary executable that takes an XML input directory to a single camera,
 *and estimates the calibration given the parameters specified in the XML*/

int main(int argc, char * argv[])
{
	using namespace stereo;
	if(argc!=4)
	{
		std::cout<<"Error!\nincorrect number of arguments, expects a single directory to a configuration file xml\n";
		std::cout<<"viewRectified [StereoRect.xml] [leftImageDirectory] [rightImageDirectory]\n";
		return 1;
	}
	std::string stereoDir(argv[1]);
	std::string limgDir(argv[2]);
	std::string rimgDir(argv[3]);
	
	cv::FileStorage c(stereoDir,cv::FileStorage::READ);
	
	if(!c.isOpened())
	{
		std::cout<<"Stereo Configuration file not found\n";
		return -1;
	}
	StereoRect stereoConfig;
	c["StereoRect"]>>stereoConfig;
	c.release();
	
	
	
	
	cv::Mat lorig,rorig;
	cv::Mat orig;
	
	lorig=cv::imread(limgDir,cv::IMREAD_GRAYSCALE);
	rorig=cv::imread(rimgDir,cv::IMREAD_GRAYSCALE);
	cv::cvtColor(lorig,lorig,cv::COLOR_GRAY2BGR);
	

	
	
	cv::Mat lrect,rrect;
	cv::Mat rect;
	

	
	rectifyImageF(lorig,lrect,stereoConfig,true);
	cv::Mat roi=lrect(stereoConfig.l_ROI_);
	
	drawROI(lrect,lrect,stereoConfig,true);
	drawEpiLines(roi,roi);
	
	
	
	cv::namedWindow("out",CV_WINDOW_NORMAL);
	cv::imshow("out",lrect);
	cv::waitKey(0);
	
	cv::destroyAllWindows();

	
	return 0;
}

 
