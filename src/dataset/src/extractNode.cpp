 
#include <ros/console.h>
#include <ros/ros.h> 

#include "dataset/extractManager.hpp"
 
 int main(int argc, char **argv)
{
	using namespace stereo;
	ros::init(argc, argv, "extractNode");
	
	/*
	
	int nmax=10000;//want to retain as many features as possible
	int firstVect=0;
	std::vector<float> scale_vect;
	std::vector<int> level_vect;
	std::vector<int> edge_vect;
	std::vector<int> wta_vect;
	std::vector<int> score_vect;
	std::vector<int> patch_vect;
	
	for(int index=1; index<2;index++)
	{
		scale_vect.push_back(0.05*index);
	}
	for(int index=1;index<2;index++)
	{
		level_vect.push_back(index);
	}
	for(int index=1;index<2;index++)
	{
		edge_vect.push_back(index);
	}
	for(int index=2;index<5;index++)
	{
		wta_vect.push_back(index);
	}
	
	score_vect.push_back(cv::ORB::kBytes);
	score_vect.push_back(cv::ORB::HARRIS_SCORE);
	score_vect.push_back(cv::ORB::FAST_SCORE);
	
	for(int index=2;index<3;index++)
	{
		patch_vect.push_back(index);
	}
	
	
	
	cv::Ptr<DetectorSettings> leftDetection= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	cv::Ptr<DetectorSettings>  rightDetection= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	cv::Ptr<DetectorSettings>  leftDescriptor= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	cv::Ptr<DetectorSettings>  rightDescriptor= new OrbDetector(nmax,scale_vect.at(0),level_vect.at(0),
															edge_vect.at(0),firstVect,wta_vect.at(0),
																	score_vect.at(0),patch_vect.at(0));
	DetectorSettings *CurrentDetector_;
	*/
	extractManager nodeMan;
	
	ros::spin();
	
	return 0;
}