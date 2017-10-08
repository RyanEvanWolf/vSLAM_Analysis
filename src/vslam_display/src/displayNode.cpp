#include <ros/console.h>
#include <ros/ros.h> 

#include <stdio.h>

#include <geometry_msgs/TransformStamped.h>
#include <std_msgs/Int64.h>


int main(int argc, char **argv)
{
	ros::init(argc, argv, "vslam");
	
	ros::NodeHandle n;
	
	geometry_msgs::Transform mess;
	std_msgs::Int64 d;
	
	while(ros::ok())
	{
		ros::spinOnce();
	}

	return 0;

}