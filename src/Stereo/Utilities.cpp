#include "vSLAM_Analysis/Stereo/Utilities.hpp"

namespace stereo {

void rectifyImageF(cv::Mat in, cv::Mat& out, StereoRect config, bool left)
{
	if(left)
	{
		out=cv::Mat(config.L_fMapx_.size(),in.type());
		cv::remap(in,out,config.L_fMapx_,config.L_fMapy_,cv::INTER_LINEAR);
	}
	else
	{
		out=cv::Mat(config.R_fMapx_.size(),in.type());
		cv::remap(in,out,config.R_fMapx_,config.R_fMapy_,cv::INTER_LINEAR);
	}
}

void rectifyImageInt(cv::Mat in, cv::Mat& out, StereoRect config, bool left)
{
	if(left)
	{
		out=cv::Mat(config.L_iMapx_.size(),in.type());
		cv::remap(in,out,config.L_iMapx_,config.L_iMapy_,cv::INTER_LINEAR);
	}
	else
	{
		out=cv::Mat(config.R_iMapx_.size(),in.type());
		cv::remap(in,out,config.R_iMapx_,config.R_iMapy_,cv::INTER_LINEAR);
	}
	
}

void getSidebySide(cv::Mat left, cv::Mat right, cv::Mat& out)
{
	//always assumes the images are the same size
	out=cv::Mat(cv::Size(left.size().width+right.size().width,left.size().height),left.type());
	cv::Mat lroi(out,cv::Rect(0,0,left.size().width,left.size().height));
	cv::Mat rroi(out,cv::Rect(left.size().width,0,right.size().width,right.size().height));
	
	left.copyTo(lroi);
	right.copyTo(rroi);
	
}

void drawROI(cv::Mat in, cv::Mat& out, StereoRect config, bool left)
{
	//assumes cv::Mat is colour 
	in.copyTo(out);
	if(left)
	{
		rectangle(out,config.l_ROI_,cv::Scalar(0,0,255,100),2);//, int thickness=1, int lineType=8, int shift=0)¶
	}
	else
	{
		rectangle(out,config.r_ROI_,cv::Scalar(0,0,255,100),2);
	}	
}


void drawEpiLines(cv::Mat in, cv::Mat& out)
{
	int totalLines=25;
	for(int index=0;index<=totalLines;index++)
	{
		int step=in.size().height/double(totalLines);
		cv::Point2f leftP(0,index*step);
		cv::Point2f rightP(in.size().width+in.size().width-1,index*step);
		cv::line(out,leftP,rightP,cv::Scalar(0,255,0),1);
	}
}


	
	
	
}