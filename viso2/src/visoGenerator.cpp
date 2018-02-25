#include "viso2/visoGenerator.hpp"


	
visoGenerator::visoGenerator()
{
	serv_=n.advertiseService("viso_extract",&visoGenerator::extract,this);
}

visoGenerator::visoGenerator(std::string dataset, std::string rect)
{
	//todo add other type of input
}


bool visoGenerator::extract(viso2::NextFrame::Request& req, viso2::NextFrame::Response& res)
{
	cv::Mat leftin,rightin;
	cv::Mat leftUndist,rightUndist;
	
	res.startImageDir.data= dataSet->getCurrentMeta().fullDir_;
	
	if(bool(req.Forward.data))
	{
		if(dataSet->incrementFrame())
		{
			leftin=dataSet->getCurrentLeft();
			rightin=dataSet->getCurrentRight();
			myCam->unDistort(leftin,leftUndist,true,true);
			myCam->unDistort(rightin,rightUndist,false,true);
			cv::imshow("original",leftin);
			cv::waitKey(1);
			
			int32_t width = leftUndist.cols;  
			int32_t height = leftUndist.rows;
		
			uint8_t* left_img_data  = leftUndist.data;
			uint8_t* right_img_data = rightUndist.data;
			int32_t dims[] = {width,height,width};
			
			
			if (viso_->process(left_img_data,right_img_data,dims))
			{
				Matrix temp(viso_->getMotion()); //holds a copy of the libViso2 matrix structure
				double motionTransform[16];//buffer for the 4x4 matrix
				temp.getData(motionTransform);//copy libviso matrix into an array
			
				cv::Mat opncv_mat=cv::Mat(4,4,CV_64F,motionTransform);//create an opencv object from the array
				//current.interMotion.setH(opncv_mat);
				res.nInliers.data=viso_->getNumberOfInliers();
				res.nMatches.data=viso_->getNumberOfMatches();
				
				//convert to a geometry_Msgs format
				
				geometry_msgs::Vector3 _point;
				tf2::Matrix3x3 rotation;
				
				_point.x=opncv_mat.at<double>(0,3);
				_point.y=opncv_mat.at<double>(1,3);
				_point.z=opncv_mat.at<double>(2,3);
				
				rotation.setValue(opncv_mat.at<double>(0,0),opncv_mat.at<double>(0,1),opncv_mat.at<double>(0,2),
								  opncv_mat.at<double>(1,0),opncv_mat.at<double>(1,1),opncv_mat.at<double>(1,2),
								  opncv_mat.at<double>(2,0),opncv_mat.at<double>(2,1),opncv_mat.at<double>(2,2));
				
				tf2::Quaternion quat;
				rotation.getRotation(quat);

				
				res.delta.translation=_point;
				res.delta.rotation.x=quat.x();
				res.delta.rotation.y=quat.y();
				res.delta.rotation.z=quat.z();
				res.delta.rotation.w=quat.w();
				
				res.Failed.data=false;

			}
			else
			{
				res.Failed.data=true;
				ROS_INFO_STREAM("failed at "<<dataSet->getCurrentMeta().fullDir_);
			}
		}
	}
	if(!bool(req.Forward.data))
	{
		if(dataSet->decrementFrame())
		{
			leftin=dataSet->getCurrentLeft();
			rightin=dataSet->getCurrentRight();
			myCam->unDistort(leftin,leftUndist,true,true);
			myCam->unDistort(rightin,rightUndist,false,true);
			cv::imshow("original",leftin);
			cv::waitKey(1);
		}
	}
	res.endImageDir.data= dataSet->getCurrentMeta().fullDir_;
	return true;
}


	

