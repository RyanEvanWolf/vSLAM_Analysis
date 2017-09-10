  /*
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <Structures/vSLAM/InterStereoFrame.hpp>


int main( int argc, char** argv )
{
  ros::init(argc, argv, "basic_shapes");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
  
  tf2_ros::TransformBroadcaster br;
  geometry_msgs::TransformStamped transformStamped;
     
  transformStamped.header.stamp = ros::Time::now();
  transformStamped.header.frame_id = "world";
  transformStamped.child_frame_id = "my_frame";
  transformStamped.transform.translation.x = 0.0;
  transformStamped.transform.translation.y =0.0;
  transformStamped.transform.translation.z = 0.0;
  tf2::Quaternion q;
  q.setRPY(0, 0, 0);
  transformStamped.transform.rotation.x = q.x();
  transformStamped.transform.rotation.y = q.y();
  transformStamped.transform.rotation.z = q.z();
  transformStamped.transform.rotation.w = q.w();
  br.sendTransform(transformStamped);
  
  

  // Set our initial shape type to be a cube
  uint32_t shape = visualization_msgs::Marker::CUBE;
  stereo::InterStereoFrame abc;
  abc.endFrame="afas";
  std::cout<<abc.endFrame<<std::endl;
  while (ros::ok())
  {
    visualization_msgs::Marker marker;
    // Set the frame ID and timestamp.  See the TF tutorials for information on these.
    marker.header.frame_id = "my_frame";
    marker.header.stamp = ros::Time::now();

    // Set the namespace and id for this marker.  This serves to create a unique ID
    // Any marker sent with the same namespace and id will overwrite the old one
    marker.ns = "basic_shapes";
    marker.id = 0;

    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
    marker.type = shape;

    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    marker.action = visualization_msgs::Marker::ADD;

    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    marker.pose.position.x = 0;
    marker.pose.position.y = 0;
    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    marker.scale.x = 1.0;
    marker.scale.y = 1.0;
    marker.scale.z = 1.0;

    // Set the color -- be sure to set alpha to something non-zero!
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;

    marker.lifetime = ros::Duration();

    // Publish the marker
    while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return 0;
      }
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }
    marker_pub.publish(marker);
	br.sendTransform(transformStamped);

    // Cycle between different shapes
    switch (shape)
    {
    case visualization_msgs::Marker::CUBE:
      shape = visualization_msgs::Marker::SPHERE;
      break;
    case visualization_msgs::Marker::SPHERE:
      shape = visualization_msgs::Marker::ARROW;
      break;
    case visualization_msgs::Marker::ARROW:
      shape = visualization_msgs::Marker::CYLINDER;
      break;
    case visualization_msgs::Marker::CYLINDER:
      shape = visualization_msgs::Marker::CUBE;
      break;
    }

    r.sleep();
  }
}*/

#include <unistd.h>
#define defaultIN "/home/ryan/git/groundTruth/gt/build/bin/viso2/libVisoOut.xml"
#include <ros/console.h>
#include <ros/ros.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2/convert.h>
#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Vector3.h>
#include <tf2/LinearMath/Matrix3x3.h>

#include <visualization_msgs/Marker.h>
#include "Structures/vSLAM/InterStereoFrame.hpp"
#include <fstream>

int main(int argc, char** argv){
  ros::init(argc, argv, "displayViso");
  
  //
  //Load viso xml
  //
  
  cv::FileStorage inputXML(defaultIN,cv::FileStorage::READ);
  std::vector<geometry_msgs::TransformStamped> relativePoses;
  
  cv::FileNodeIterator meas_it,meas_end;
  meas_it=inputXML["InterFrame"].begin();
  meas_end=inputXML["InterFrame"].end();
  
  //save useful data to a csv format for python graphing
  std::ofstream outCSV;
  outCSV.open("/home/ryan/D5.csv");
  outCSV<<"Timestamp,X,Y,Z,Roll,Pitch,Yaw,Matches,Inliers\n";
  
  for(;meas_it!=meas_end;++meas_it)
  {
	  stereo::InterStereoFrame buffer;
	  (*meas_it)>>buffer;
	  
	  geometry_msgs::Vector3 _point;
	  _point.x=buffer.interMotion.getT().at<double>(0,0);
	  _point.y=buffer.interMotion.getT().at<double>(1,0);
	  _point.z=buffer.interMotion.getT().at<double>(2,0);
	  
	  tf2::Matrix3x3 rotation;
	  rotation.setValue(buffer.interMotion.getR().at<double>(0,0),buffer.interMotion.getR().at<double>(0,1),
						buffer.interMotion.getR().at<double>(0,2),buffer.interMotion.getR().at<double>(1,0),
						buffer.interMotion.getR().at<double>(1,1),buffer.interMotion.getR().at<double>(1,2),
						buffer.interMotion.getR().at<double>(2,0),buffer.interMotion.getR().at<double>(2,1),
						buffer.interMotion.getR().at<double>(2,2));

	  double roll,pitch,yaw;
	  
	  rotation.getRPY(roll,pitch,yaw);
	  
	  tf2::Quaternion quat;
	  
	  rotation.getRotation(quat);
	  
	  
	  
	  
	  geometry_msgs::TransformStamped current;
	  geometry_msgs::Quaternion msg;
	  
	  current.transform.rotation.x=quat.x();
	  current.transform.rotation.y=quat.y();
	  current.transform.rotation.z=quat.z();
	  current.transform.rotation.w=quat.w();
	  
	  
	  current.transform.translation=_point;
	  current.child_frame_id="leftCamera";
	  current.header.frame_id="world";
	  
	  relativePoses.push_back(current);
	  std::cout<<"PosesSize={"<<relativePoses.size()<<"}"<<std::endl;
	  outCSV<<buffer.endFrame;
	  outCSV<<","<<_point.x<<","<<_point.y<<","<<_point.z;
	  outCSV<<","<<roll<<","<<pitch<<","<<yaw;
	  outCSV<<","<<buffer.totalMatches<<","<<buffer.totalInliers<<std::endl;
	  
  }
  
  inputXML.release();
  outCSV.close();
  //create the visualization messages, markers, and transforms
  tf2_ros::TransformBroadcaster LeftCameraBc_;
  //tf2
  
  std::cout <<"Beginning Transform broadcasts"<<std::endl;
  
  for(int frameIndex=0;frameIndex<relativePoses.size();frameIndex++)
  {
	  relativePoses.at(frameIndex).header.stamp=ros::Time::now();
	  LeftCameraBc_.sendTransform(relativePoses.at(frameIndex));
	  ros::spinOnce();
	  usleep(1000*1000/15);
	  ros::spinOnce();
	  std::cout<<frameIndex<<std::endl;
  }
  
  //delay(1000/15);
  
  /*tf2_ros::TransformBroadcaster LeftCameraBc_;
  geometry_msgs::TransformStamped LeftCameraTF_;
  
  std::string world_ref="world";
  std::string cam="leftCam";

  static tf2_ros::StaticTransformBroadcaster static_broadcaster;
  geometry_msgs::TransformStamped static_transformStamped;

  static_transformStamped.header.stamp = ros::Time::now();
  static_transformStamped.header.frame_id = "world";
  static_transformStamped.child_frame_id = static_turtle_name;
  static_transformStamped.transform.translation.x = atof(argv[2]);
  static_transformStamped.transform.translation.y = atof(argv[3]);
  static_transformStamped.transform.translation.z = atof(argv[4]);
  tf2::Quaternion quat;
  quat.setRPY(atof(argv[5]), atof(argv[6]), atof(argv[7]));
  static_transformStamped.transform.rotation.x = quat.x();
  static_transformStamped.transform.rotation.y = quat.y();
  static_transformStamped.transform.rotation.z = quat.z();
  static_transformStamped.transform.rotation.w = quat.w();
  static_broadcaster.sendTransform(static_transformStamped);
  ROS_INFO("Spinning until killed publishing %s to world", static_turtle_name.c_str());
  ros::spin();*/
  std::cout<<"finished"<<std::endl;
  return 0;
};
