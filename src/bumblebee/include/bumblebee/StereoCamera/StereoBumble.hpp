#ifndef ANALYSIS_STEREO_CAMERA_HEADER_HPP
#define ANALYSIS_STEREO_CAMERA_HEADER_HPP

#include <string>
#include "Structures/CameraInfo/StereoRect.hpp"
#include "bumblebee/StereoCamera/StereoUtilities.hpp"


#define DEFAULT_FRAME_LEFT leftCamera
#define DEFAULT_RECTIFIED_FRAME_LEFT RectifiedLeftCamera
#define DEFAULT_FRAME_RIGHT rightCamera
#define DEFAULT_RECTIFIED_FRAME_RIGHT RectifiedRightCamera



namespace Analysis 
{

class StereoBumble
{
	public:
		geometry_msgs::Transform l2R,l2rectL,r2rectr;
		stereo::StereoRect bumbleBee_;
		StereoBumble(std::string RectifiedDirectory);
	
};
	
	
}

#endif