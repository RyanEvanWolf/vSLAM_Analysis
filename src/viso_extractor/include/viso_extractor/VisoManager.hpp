 
#ifndef VISO_EXTRACTOR_MANAGER_HEADER_HPP
#define VISO_EXTRACTOR_MANAGER_HEADER_HPP


#include <ros/console.h>
#include <ros/ros.h> 

#include <opencv2/core/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <boost/bind.hpp>
#include <boost/thread.hpp>



#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>


///ROS INCLUDES
#include <tf2_ros/transform_broadcaster.h>
#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/TransformStamped.h>

#include <geometry_msgs/Vector3.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <viso_extractor/VisoFrame.h>
#include <viso_extractor/pMatch.h>


#include <chrono>

#include <unistd.h>

#include <queue>

#include <string.h>
#include <viso_stereo.h>
class VisoManager 
{
  public:
    VisoManager(std::string lTopic,std::string rTopic,VisualOdometryStereo::parameters inParam);
    ros::NodeHandle n;
  private:
    Matrix pose;
    cv::Ptr<VisualOdometryStereo> odom;
    std::queue<cv::Mat> leftImages,rightImages;
    boost::mutex mutexLImg,mutexRImg;
    boost::condition_variable leftImagesEmpty,rightImagesEmpty;
    image_transport::ImageTransport *it;
    image_transport::Subscriber leftSub;
		image_transport::Subscriber rightSub;
    ros::Publisher pubOutput;
    void bufferLeft(const sensor_msgs::ImageConstPtr& msg);
    void bufferRight(const sensor_msgs::ImageConstPtr& msg);
    void processOdom();
    //Subscriber functions
};

#endif