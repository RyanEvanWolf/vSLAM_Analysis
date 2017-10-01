#include <ros/console.h>
#include <ros/ros.h> 
#include <tf2_ros/transform_listener.h>
#include "bumblebee/StereoCamera/StereoBumble.hpp"
#include <Structures/CameraInfo/StereoRect.hpp>

#define DEFAULT_RECTIFIED_INPUT "/home/ryan/git/groundTruth/gt/output/Stereo4/RectifiedBumble4.xml"
#define DEFAULT_LEFT_IMAGE "/home/ryan/Masters/calibration/fullLeft/l_1487062206.ppm"
#define DEFAULT_RIGHT_IMAGE "/home/ryan/Masters/calibration/fullRight/r_1487062206.ppm"


int main(int argc, char** argv){
  ros::init(argc, argv, "StereoCoordinateNode");
  
  Analysis::StereoBumble myCam(DEFAULT_RECTIFIED_INPUT); 
  tf2_ros::TransformBroadcaster l2r_bc,l2rect_bc,r2rect_bc;
  

  cv::Mat inLeft,inRight;
  inLeft=cv::imread(DEFAULT_LEFT_IMAGE,cv::IMREAD_GRAYSCALE);
  inRight=cv::imread(DEFAULT_RIGHT_IMAGE,cv::IMREAD_GRAYSCALE);
  

  cv::Mat l,rr;
  cv::Mat roiL,roiR;
  cv::Mat outside,epi,ss;
  
  myCam.unDistort(inLeft,l,true);
  myCam.unDistort(inRight,rr,true);
  
  
  roiL=l(myCam.bumbleBee_.l_ROI_);
  roiR=rr(myCam.bumbleBee_.r_ROI_);
  
  stereo::getSideSideRect(roiL,roiR,outside);
  
  
  cv::namedWindow("original",cv::WINDOW_NORMAL);
  cv::namedWindow("und",cv::WINDOW_NORMAL);
  cv::namedWindow("aa",cv::WINDOW_NORMAL);
 
  
  myCam.drawEpiLines(outside,epi);
  myCam.drawROI(roiL,ss,true);
  
  cv::imshow("original",outside);
  cv::imshow("und",epi);
  cv::imshow("aa",ss);
  
  cv::waitKey(0);
 // ros::Rate r(1);
 // while(ros::ok())
  //{
   // ros::spinOnce();
	//r.sleep();
  //}
  
  cv::destroyAllWindows();
  return 0;
} 
