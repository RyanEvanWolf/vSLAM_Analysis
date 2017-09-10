#include <ros/console.h>
#include <ros/ros.h> 
#include <tf2_ros/transform_listener.h>
#include "bumblebee/StereoCamera/StereoBumble.hpp"

#define DEFAULT_RECTIFIED_INPUT "/home/ryan/git/groundTruth/gt/output/Stereo8/RectifiedBumble8.xml"

int main(int argc, char** argv){
  ros::init(argc, argv, "StereoCoordinateNode");
  
  Analysis::StereoBumble myCam(DEFAULT_RECTIFIED_INPUT);
  tf2_ros::TransformBroadcaster l2r_bc,l2rect_bc,r2rect_bc;
  
  geometry_msgs::TransformStamped l2r,l2rect,r2rect;
  
  l2r.transform=myCam.l2R;
  l2r.header.frame_id="LeftCamera";
  l2r.child_frame_id="RightCamera";
  
  l2rect.transform=myCam.l2rectL;
  l2rect.header.frame_id="LeftCamera";
  l2rect.child_frame_id="RectLeft";
  
  r2rect.transform=myCam.r2rectr;
  r2rect.header.frame_id="RightCamera";
  r2rect.child_frame_id="RectRight";
  
  l2r.header.stamp=ros::Time::now();
  l2rect.header.stamp=ros::Time::now();
  r2rect.header.stamp=ros::Time::now();
  tf2_ros::Buffer tfBuffer;
  tf2_ros::TransformListener tfListener(tfBuffer);
  
  ros::Rate r(1);
  while(ros::ok())
  {
	l2r.header.stamp=ros::Time::now();
	l2rect.header.stamp=ros::Time::now();
	r2rect.header.stamp=ros::Time::now();
	l2r_bc.sendTransform(l2r);
	l2rect_bc.sendTransform(l2rect);
	r2rect_bc.sendTransform(r2rect);
    ros::spinOnce();
	r.sleep();
  }
  
  
  ros::spin();
  
  return 0;
}