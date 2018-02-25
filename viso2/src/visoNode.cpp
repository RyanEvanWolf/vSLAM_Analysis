 
/**
* This file is part of ORB-SLAM2.
*
* Copyright (C) 2014-2016 Raúl Mur-Artal <raulmur at unizar dot es> (University of Zaragoza)
* For more information see <https://github.com/raulmur/ORB_SLAM2>
*
* ORB-SLAM2 is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* ORB-SLAM2 is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with ORB-SLAM2. If not, see <http://www.gnu.org/licenses/>.
*/



//#include <iostream>
//#include <algorithm>
//#include <fstream>
//#include <iomanip>
//#include <chrono>

#include "viso2/visoGenerator.hpp"

//#include <boost/bind.hpp>

//#include <opencv2/core/core.hpp>
#define DEFAULT_LEFT_IMAGE "/home/ryan/Masters/calibration/fullLeft/l_1487062206.ppm"


using namespace std;




/*bool extract(viso2::NextFrame::Request  &req,
			 viso2::NextFrame::Response &res,
			 VisualOdometryStereo &viso
			 )
{
	ROS_INFO_STREAM(req);
	if(req.Forward.data)
	{
		ROS_INFO_STREAM("Forward");
	}
	else
	{
		ROS_INFO_STREAM("Past");
	}
  //res.sum = req.a + req.b;
  //ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
  //ROS_INFO("sending back response: [%ld]", (long int)res.sum);
  return true;
}*/


//void LoadImages(const string &strPathLeft, const string &strPathRight, const string &strPathTimes,
//                vector<string> &vstrImageLeft, vector<string> &vstrImageRight, vector<double> &vTimeStamps);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "viso_node");
	ros::NodeHandle n;
	std::string inputDataSetDir;
	std::string inputRectificationFile;
	
	visoGenerator vis;
//	/Dataset
//  /RectifiedXML
	//std::string aaa;
	//n.getParam("/RectifiedXML",aaa);
	//std::cout<<aaa<<std::endl;
	std::string RectifiedDir;
	std::string DataDir;
	
	ros::param::get("/RectifiedXML",RectifiedDir);
	ros::param::get("/Dataset",DataDir);
	
	vis.myCam= cv::Ptr<Analysis::StereoBumble>(new Analysis::StereoBumble(RectifiedDir));
	vis.dataSet=cv::Ptr<stereo::BumbleDataSet>(new stereo::BumbleDataSet(DataDir));
	
 /*   if(argc==1)
	{
		//use default values
		vis.myCam= cv::Ptr<Analysis::StereoBumble>(new Analysis::StereoBumble(DEFAULT_RECT));
		vis.dataSet=cv::Ptr<stereo::BumbleDataSet>(new stereo::BumbleDataSet(DEFAULT_DATASET));
		
	}
	else if(argc==3)
	{
		//use the command line arguments
		vis.myCam= cv::Ptr<Analysis::StereoBumble>(new Analysis::StereoBumble(std::string(argv[2])));
		vis.dataSet=cv::Ptr<stereo::BumbleDataSet>(new stereo::BumbleDataSet(std::string(argv[1])));
	}
	else
	{
		std::cerr << endl << "Incorrect Number of Parameters -example usage -->" << endl;
	    std::cerr <<"./vis_exec  [dataSetDir] [rectification.xml]"<< endl;
	    std::cerr <<"./vis_exec" << endl;
        return 1;
	}*/
	
	vis.param.calib.f=vis.myCam->bumbleBee_.P_l_.at<double>(0,0);
	vis.param.calib.cu = vis.myCam->bumbleBee_.P_l_.at<double>(0,2); // principal point (u-coordinate) in pixels
	vis.param.calib.cv = vis.myCam->bumbleBee_.P_l_.at<double>(1,2); // principal point (v-coordinate) in pixels
	vis.param.base     = ((-1*vis.myCam->bumbleBee_.T_.at<double>(0,0))*(0.1*0.1*0.1)); // baseline in meters
	vis.param.ransac_iters=8000;
		
	vis.viso_=cv::Ptr<VisualOdometryStereo>(new VisualOdometryStereo(vis.param));
	/*

	
	//initialize the BumbleBee dataset and camera
	BumbleDataSet bumbleData(inputDataSetDir);
	
	cv::FileStorage c(inputRectificationFile,cv::FileStorage::READ);
	
	if(!c.isOpened())
	{
		std::cout<<"Stereo Configuration file not found\n";
		return -1;
	}
	StereoRect bumbleBee_;
	c["StereoRect"]>>bumbleBee_;
	c.release();
	
	bool end=false;
	
	cv::Mat leftUndistorted=cv::Mat(bumbleBee_.L_fMapx_.size(),bumbleData.getCurrentLeft().type());
	cv::Mat rightUndistorted=cv::Mat(bumbleBee_.L_fMapx_.size(),bumbleData.getCurrentLeft().type());
	
	cv::Mat leftIN=leftUndistorted(bumbleBee_.l_ROI_);
	cv::Mat rightIN=rightUndistorted(bumbleBee_.r_ROI_);
	cv::Mat leftimg_,rightimg_;
	
	int im=0;
	param.calib.f=bumbleBee_.P_l_.at<double>(0,0);
	param.calib.cu = bumbleBee_.P_l_.at<double>(0,2); // principal point (u-coordinate) in pixels
	param.calib.cv = bumbleBee_.P_l_.at<double>(1,2); // principal point (v-coordinate) in pixels
	param.base     = ((-1*bumbleBee_.T_.at<double>(0,0))*(0.1*0.1*0.1)); // baseline in meters
	param.ransac_iters=8000;
	
	ROS_INFO_STREAM(bumbleBee_.T_);
	ROS_INFO_STREAM(bumbleBee_.P_l_);
	ROS_INFO_STREAM(bumbleBee_.P_r_);
	VisualOdometryStereo viso(param);

	Matrix pose = Matrix::eye(4);
	//ros::ServiceServer service = n.advertiseService("visoExtract", extract);
	
	visoGenerator abc;
	
	ros::ServiceServer service;
	
	service=n.advertiseService("visoExtract",&visoGenerator::extract,&abc);
//	ros::ServiceServer service = n.advertiseService<viso2::NextFrame::Request, viso2::NextFrame::Response>("visoExtract",&stereo::visoGenerator,&abc);																										   &viso2::NextFrame::Request,

//cv::FileStorage outputFile("libVisoOut.xml",cv::FileStorage::WRITE);
	
	//outputFile<<"InterFrame"<<"[";
	InterStereoFrame current;
	current.startingFrame="start";*/
	/*while(!end)
	{
		
		double tframe=(1000/15)*im;
		//undistort each image, and set them to the region of interest
		//cv::Mat inputLeft=bumbleData.getCurrentLeft()
		cv::remap(bumbleData.getCurrentLeft(),leftUndistorted,bumbleBee_.L_fMapx_,bumbleBee_.L_fMapy_,cv::INTER_LINEAR);
		cv::remap(bumbleData.getCurrentRight(),rightUndistorted,bumbleBee_.R_fMapx_,bumbleBee_.R_fMapy_,cv::INTER_LINEAR);
		
		int32_t width = leftUndistorted.cols;  
        int32_t height = leftUndistorted.rows;
		
		uint8_t* left_img_data  = leftUndistorted.data;
        uint8_t* right_img_data = rightUndistorted.data;
		int32_t dims[] = {width,height,width};
		current.endFrame=bumbleData.getCurrentName();
		
		if (viso.process(left_img_data,right_img_data,dims)) {
			Matrix temp(viso.getMotion()); //holds a copy of the libViso2 matrix structure
			
			double motionTransform[16];//buffer for the 4x4 matrix
			
			temp.getData(motionTransform);//copy libviso matrix into an array
			
			cv::Mat opncv_mat=cv::Mat(4,4,CV_64F,motionTransform);//create an opencv object from the array
			
			
			current.interMotion.setH(opncv_mat);
			current.totalInliers=viso.getNumberOfInliers();
			current.totalMatches=viso.getNumberOfMatches();
			}
			else
			{
				std::cout << " ... failed!" << endl;
			}
		
		//outputFile<<current;
		current.startingFrame=current.endFrame;
		end= !bumbleData.incrementFrame();
		im++;
		std::cout<<"image number : {"<<im<<"}"<<std::endl;
		ros::spinOnce();
	}*/
	//outputFile<<"]";
	//outputFile.release();
	ros::spin();
	return 0;

}
