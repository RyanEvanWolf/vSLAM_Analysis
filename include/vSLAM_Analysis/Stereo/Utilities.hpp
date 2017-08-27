#ifndef vSLAM_ANALYSIS_UTILITIES_HEADER_HPP
#define vSLAM_ANALYSIS_UTILITIES_HEADER_HPP

#include "Structures/CameraInfo/StereoRect.hpp"
#include <opencv2/highgui.hpp>

#include <opencv2/calib3d.hpp>
#include <opencv2/imgproc.hpp>

namespace stereo
{

void rectifyImageInt(cv::Mat in, cv::Mat &out,StereoRect config,bool left);
void rectifyImageF(cv::Mat in,cv::Mat &out,StereoRect config,bool left);
void drawROI(cv::Mat in,cv::Mat &out,StereoRect config,bool left);
void drawEpiLines(cv::Mat in,cv::Mat &out);
void getSidebySide(cv::Mat left,cv::Mat right, cv::Mat &out);

	
	
}

#endif