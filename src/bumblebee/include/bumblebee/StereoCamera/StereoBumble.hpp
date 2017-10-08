#ifndef ANALYSIS_STEREO_CAMERA_HEADER_HPP
#define ANALYSIS_STEREO_CAMERA_HEADER_HPP

#include <string>
#include "Structures/CameraInfo/StereoRect.hpp"
#include "bumblebee/StereoCamera/StereoUtilities.hpp"


#include <opencv2/core.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/highgui.hpp>
#include "Structures/vSLAM/StereoFrame.hpp"


#define DEFAULT_FRAME_LEFT leftCamera
#define DEFAULT_RECTIFIED_FRAME_LEFT RectifiedLeftCamera
#define DEFAULT_FRAME_RIGHT rightCamera
#define DEFAULT_RECTIFIED_FRAME_RIGHT RectifiedRightCamera
#include <opencv2/imgproc.hpp>

namespace Analysis 
{

class StereoBumble
{
	public:
		geometry_msgs::Transform l2R,l2rectL,r2rectr;
		stereo::StereoRect bumbleBee_;
		StereoBumble(std::string RectifiedDirectory);
		void unDistort(cv::Mat &in,cv::Mat &outImage,bool left,bool f=true);
		void drawROI(cv::Mat &in,cv::Mat &outImage,bool left);
		void drawEpiLines(cv::Mat &in,cv::Mat &outImage,cv::Scalar col=cv::Scalar(-1));
		void getSideSideRect(cv::Mat limg, cv::Mat rimg, cv::Mat& out);
		void draw(cv::Mat limg,cv::Mat rimg, cv::Mat &outImage,stereo::StereoFrame in);
		void draw(cv::Mat limg,cv::Mat rimg,cv::Mat &outImage,stereo::StereoFrame in,cv::Scalar colour,std::vector<char> mask=std::vector<char>());

		
};
	
	
}

#endif