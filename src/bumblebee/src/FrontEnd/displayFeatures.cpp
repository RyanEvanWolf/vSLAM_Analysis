#include <ros/ros.h>
#include "bumblebee/DirectoryUtilities.hpp"
#include "Structures/vSLAM/StereoFeatures.hpp"
#include <fstream>
#include <std_msgs/Int32.h>


//Stereo visual display features 
#include "Structures/DataSet/BumbleDataSet.hpp"
#define DEFAULT_RECT "/home/ryan/git/groundTruth/gt/output/Stereo4/RectifiedBumble4.xml"
#include "vSLAM_FrontEnd/Detection/OrbDetector.hpp"
#include "vSLAM_FrontEnd/StereoFront/StereoCamera.hpp"

int main(int argc, char** argv)
{
	ros::init(argc, argv, "displayFeatures");
	
	
	ros::NodeHandle n;
	
	ros::Publisher leftF=n.advertise<std_msgs::Int32>("leftFeatures",1000);
	ros::Publisher rightF=n.advertise<std_msgs::Int32>("rightFeatures",1000);

	std::string inputDir="/home/ryan/git/vSLAM_FrontEnd/output/D1_mini/ORB/ORB_10000_0.05_1_1_0_2_32_2/";
	std::vector<std::string> readFiles=getList(inputDir);
	
	std::ofstream outFileCSV;
	std::stringstream command;
	outFileCSV.open("/home/ryan/temp.csv");

	
	/*for(int index=0;index<readFiles.size();index++)
	{
		std::string fullDir=inputDir;
		fullDir+="/";
		fullDir+=readFiles.at(index);
		cv::FileStorage current(fullDir,cv::FileStorage::READ);
		
		stereo::StereoFeatures now;
		current["features"]>>now;
		
		current.release();
		outFileCSV<<now.frameData_.fileName_<<","<<now.leftFeatures.size()<<","<<now.rightFeatures.size()<<std::endl;
		std::cout<<now.frameData_.fileName_<<"\t"<<fullDir<<std::endl;
		std_msgs::Int32 totalLeft,totalRight;
		totalLeft.data=now.leftFeatures.size();
		totalRight.data=now.rightFeatures.size();
		
		leftF.publish(totalLeft);
		rightF.publish(totalRight);
		ros::spinOnce();
	}
	outFileCSV.close();*/
	
	return 0;
  
}