#ifndef VISO_GENERATOR_HEADER_HPP
#define VISO_GENERATOR_HEADER_HPP
#include <ros/console.h>
#include <ros/ros.h> 


#define DEFAULT_DATASET "/home/ryan/DataSets/SortedDataSets/D5"
#define DEFAULT_RECT "/home/ryan/git/Output/Calibration/stereo_ParameterFour.xml"

#include <viso_stereo.h>

 #include <thread>

#include <opencv2/core/core.hpp>
#include <Structures/DataSet/BumbleDataSet.hpp>
#include <Structures/vSLAM/InterStereoFrame.hpp>

#include <viso2/NextFrame.h>
#include <bumblebee/StereoCamera/StereoBumble.hpp>
#include <boost/bind.hpp>
#include <std_msgs/Bool.h>


#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>

///ROS INCLUDES
#include <tf2_ros/transform_broadcaster.h>
#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/TransformStamped.h>

#include <geometry_msgs/Vector3.h>
#include <tf2/LinearMath/Matrix3x3.h>

class visoGenerator
{
	private:
		cv::Mat displayImage;
	public:
		cv::Ptr<Analysis::StereoBumble> myCam;
		ros::NodeHandle n;
		VisualOdometryStereo::parameters param;
		cv::Ptr<stereo::BumbleDataSet> dataSet;
		cv::Ptr<VisualOdometryStereo> viso_;
		ros::ServiceServer serv_;
		visoGenerator(std::string dataset,std::string rect);
		visoGenerator();
		bool extract(viso2::NextFrame::Request  &req,
			 viso2::NextFrame::Response &res);
};

	


#endif
