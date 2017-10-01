#ifndef VSLAM_ANALYSIS_STEREO_DRAWING_HEADER_
#define VSLAM_ANALYSIS_STEREO_DRAWING_HEADER_

#include <opencv2/core.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/highgui.hpp>
#include "Structures/vSLAM/StereoFrame.hpp"

namespace stereo
{

	
void getSideSideRect(cv::Mat limg, cv::Mat rimg, cv::Mat& out)
{
	//rectifies a left and right image, and returns the two side by side
	out=cv::Mat(cv::Size(limg.size().width+rimg.size().width,limg.size().height),limg.type());
	cv::Mat lroi(out,cv::Rect(0,0,limg.size().width,limg.size().height));
	cv::Mat rroi(out,cv::Rect(limg.size().width,0,rimg.size().width,rimg.size().height));
	
	limg.copyTo(lroi);
	rimg.copyTo(rroi);
}

void draw(cv::Mat limg,cv::Mat rimg, cv::Mat &outImage,StereoFrame in)
{
	cv::drawMatches(limg,in.leftFeatures_,
					rimg,in.rightFeatures_,
					in.matches_,outImage,cv::Scalar::all(-1),
					cv::Scalar::all(-1),in.inliersMask_,
					cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
}

void draw(cv::Mat limg,cv::Mat rimg,cv::Mat &outImage,StereoFrame in,cv::Scalar colour,std::vector<char> mask=std::vector<char>())
{
		cv::drawMatches(limg,in.leftFeatures_,
						rimg,in.rightFeatures_,
						in.matches_,outImage,colour,
						colour,mask,
						cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
}

	
	
	/*
StereoDrawing::StereoDrawing(Stereo con)
{
	config_=con;
}

StereoDrawing::StereoDrawing()
{

}

StereoDrawing::StereoDrawing(std::string dir)
{
	cv::FileStorage fs("/media/ubuntu/SD_CARD/ConfigurationFiles/BumbleBeeConfig.xml",cv::FileStorage::READ);
	
	if(fs.isOpened())
	{	
		fs["stereocalibration"]>>config_;
		fs.release();
	}
	else
	{
		std::cout<<"Could not open file specefied at "<<dir<<std::endl;
	}
}


void StereoDrawing::drawEpiLine()
{

}

void StereoDrawing::stereoRectify(cv::Mat input, cv::Mat& output,bool leftImage, bool includeDistortion)
{
	//TODO error checking
	if(leftImage)
	{
		if(includeDistortion)
		{
			output=cv::Mat(config_.cam_left_.rect_mapx_dist_.size(),input.type());
			
			
			//full rectification
			cv::remap(input,output,
								config_.cam_left_.rect_mapx_dist_,config_.cam_left_.rect_mapy_dist_,
								cv::INTER_LINEAR,cv::BORDER_TRANSPARENT);

			
		}
		else
		{
			output=cv::Mat(config_.cam_left_.rect_mapx_.size(),input.type());
			//rectification post undistortion
			
				cv::remap(input,output,
								config_.cam_left_.rect_mapx_,config_.cam_left_.rect_mapy_,
								cv::INTER_LINEAR,cv::BORDER_TRANSPARENT);
		}
	}
	else
	{
		if(includeDistortion)
		{
			output=cv::Mat(config_.cam_right_.rect_mapx_dist_.size(),input.type());
			
			
			//full rectification
			cv::remap(input,output,
								config_.cam_right_.rect_mapx_dist_,config_.cam_right_.rect_mapy_dist_,
								cv::INTER_LINEAR,cv::BORDER_TRANSPARENT);

			
		}
		else
		{
			output=cv::Mat(config_.cam_right_.rect_mapx_.size(),input.type());
			//rectification post undistortion
			
				cv::remap(input,output,
								config_.cam_right_.rect_mapx_,config_.cam_right_.rect_mapy_,
								cv::INTER_LINEAR,cv::BORDER_TRANSPARENT);
		}
		
	}
}


void StereoDrawing::drawROI(cv::Mat input, bool left, bool includeDistortion)
{
	cv::Mat output;
	cv::cvtColor(input,output,cv::COLOR_GRAY2BGR);
	
	if(left)
	{
		if(includeDistortion)
		{
			cv::rectangle(output,config_.cam_left_.ROI_wD_,cv::Scalar(0,0,255));
		}
		else
		{
			cv::rectangle(output,config_.cam_left_.ROI_,cv::Scalar(0,0,255));
		}
	}
	else
	{
		if(includeDistortion)
		{
			cv::rectangle(output,config_.cam_right_.ROI_wD_,cv::Scalar(255,0,255));
		}
		else
		{
			cv::rectangle(output,config_.cam_right_.ROI_,cv::Scalar(255,0,255));
		}
	}

	cv::namedWindow("ROI_Interest",cv::WINDOW_NORMAL);
	cv::imshow("ROI_Interest",output);
	cv::waitKey(0);
	cv::destroyWindow("ROI_Interest");
	
}


void StereoDrawing::drawROI(cv::Mat input, cv::Mat& output, bool display, bool left, bool includeDistortion)
{
	cv::cvtColor(input,output,cv::COLOR_GRAY2BGR);
	
	if(left)
	{
		if(includeDistortion)
		{
			cv::rectangle(output,config_.cam_left_.ROI_wD_,cv::Scalar(0,0,255));
		}
		else
		{
			cv::rectangle(output,config_.cam_left_.ROI_,cv::Scalar(0,0,255));
		}
	}
	else
	{
		if(includeDistortion)
		{
			cv::rectangle(output,config_.cam_right_.ROI_wD_,cv::Scalar(255,0,255));
		}
		else
		{
			cv::rectangle(output,config_.cam_right_.ROI_,cv::Scalar(255,0,255));
		}
	}

	if(display)
	{
		cv::namedWindow("ROI_Interest",cv::WINDOW_NORMAL);
		cv::imshow("ROI_Interest",output);
		cv::waitKey(0);
		cv::destroyWindow("ROI_Interest");
	}
}
*/


	
	
}


#endif
