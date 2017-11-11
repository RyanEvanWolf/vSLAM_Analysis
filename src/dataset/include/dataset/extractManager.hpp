#ifndef EXTRACT_MANAGER_HEADER_HPP
#define EXTRACT_MANAGER_HEADER_HPP

 
#include <ros/console.h>
#include <ros/ros.h> 

#include "vSLAM_FrontEnd/StereoFront/StereoCamera.hpp"
#include "vSLAM_FrontEnd/Detection/OrbDetector.hpp"
#include "vSLAM_FrontEnd/Detection/FastDetector.hpp"

#include "vSLAM_FrontEnd/StereoFront/Matching.hpp"
#include <std_msgs/String.h>

#include <dataset/extractFeatures.h>
#include <dataset/updateSettings.h>
#include <dataset/rectifiedSettings.h>
#include <dataset/stereoInliers.h>
#include <dataset/extractFAST.h>
#include <dataset/extractSIFT.h>

#include <dataset/simpleCamera.hpp>

#define DEFAULT_SAVE_DIRECTORY "/home/ryan/git/Output"

namespace stereo
{

class extractManager
{
	private:
		ros::ServiceServer extractServ;
		ros::ServiceServer updateServ;
		ros::ServiceServer rectServ;
		ros::ServiceServer stereoServ;
		ros::ServiceServer extractFASTserv;
		ros::ServiceServer extractSIFTserv;
	public:
		ros::NodeHandle n;
		simpleCamera bumble;
		std::string outDirectory,algMatch;
		extractManager();
		bool extractFAST(dataset::extractFAST::Request &req,dataset::extractFAST::Response &res);
		bool extractSIFT(dataset::extractSIFT::Request &req,dataset::extractSIFT::Response &res);
		bool extract(dataset::extractFeatures::Request &req,dataset::extractFeatures::Response &res);	
		bool stereoExtract(dataset::stereoInliers::Request &req,dataset::stereoInliers::Response &res);
		bool update(dataset::updateSettings::Request &req,dataset::updateSettings::Response &res);
		bool updateRect(dataset::rectifiedSettings::Request &req,dataset::rectifiedSettings::Response &res);
};

}

#endif