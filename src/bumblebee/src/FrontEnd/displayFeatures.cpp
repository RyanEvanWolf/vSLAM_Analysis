#include <ros/ros.h>
#include "bumblebee/DirectoryUtilities.hpp"
#include "Structures/vSLAM/StereoFeatures.hpp"

int main(int argc, char** argv)
{
	ros::init(argc, argv, "displayFeatures");

	std::string inputDir="/home/ryan/git/vSLAM_FrontEnd/output/D1_mini/ORB/ORB_10000_0.05_1_1_0_2_32_2/";
	std::vector<std::string> readFiles=getList(inputDir);
	
	for(int index=0;index<readFiles.size();index++)
	{
		std::string fullDir=inputDir;
		fullDir+="/";
		fullDir+=readFiles.at(index);
		cv::FileStorage current(fullDir,cv::FileStorage::READ);
		
		stereo::StereoFeatures now;
		current["features"]>>now;
		
		current.release();
		
		std::cout<<now.frameData_.fileName_<<"\t"<<fullDir<<std::endl;
	}
	
	ros::spinOnce();
	return 0;
  
}