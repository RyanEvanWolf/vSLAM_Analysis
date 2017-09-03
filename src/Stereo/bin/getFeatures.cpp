//#include "groundTruth/Calibration/SingleCalibrator.hpp"

#include "vSLAM_Analysis/Stereo/Utilities.hpp"
#include "vSLAM_FrontEnd/Detection/FastDetector.hpp"
#include "vSLAM_FrontEnd/Description/BriskDescription.hpp"
#include <opencv2/highgui.hpp>
//#include <bitset>

/*
 * Binary executable that takes an XML input directory to a single camera,
 *and estimates the calibration given the parameters specified in the XML*/

int main(int argc, char * argv[])
{
	using namespace stereo;
	FastDetector abc(10,true,cv::FastFeatureDetector::TYPE_5_8);
	DetectorSettings *ptr;
	ptr = &abc;
	

	BriskDescription ann(10);
	
	cv::Mat lorig=cv::imread("ll.ppm",cv::IMREAD_GRAYSCALE);
	
	
	std::vector<cv::KeyPoint> test;
	ann.extract(lorig,lorig);
	
	ptr->detect(lorig,test);
	
	cv::drawKeypoints(lorig,test,lorig);
	cv::namedWindow("a",cv::WINDOW_AUTOSIZE);
	cv::imshow("a",lorig);
	cv::waitKey(0);
	cv::destroyAllWindows();

	return 0;
}

 
 
