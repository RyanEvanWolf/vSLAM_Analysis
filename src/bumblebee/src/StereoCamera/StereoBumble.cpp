#include "bumblebee/StereoCamera/StereoBumble.hpp"

namespace Analysis {
	
StereoBumble::StereoBumble(std::string RectifiedDirectory)
{
	cv::FileStorage inputFile(RectifiedDirectory,cv::FileStorage::READ);
	
	inputFile["StereoRect"]>>bumbleBee_;
	l2R=convert2Message(bumbleBee_.rIso_);
	l2rectL=convert2Message(bumbleBee_.lrectIso_);
	r2rectr=convert2Message(bumbleBee_.rrectIso_);
	
	inputFile.release();
}

void StereoBumble::unDistort(cv::Mat &in,cv::Mat &outImage,bool left,bool f)
{
	if(left)
	{
		if(f)
		{
			outImage=cv::Mat(bumbleBee_.L_fMapx_.size(),CV_8UC1);
			cv::remap(in,outImage,bumbleBee_.L_fMapx_,bumbleBee_.L_fMapy_,cv::INTER_LINEAR);
		}
		else
		{
			outImage=cv::Mat(bumbleBee_.L_iMapx_.size(),CV_8UC1);
			cv::remap(in,outImage,bumbleBee_.L_iMapx_,bumbleBee_.L_iMapy_,cv::INTER_LINEAR);
		}
	}
	else
	{
		if(f)
		{
			outImage=cv::Mat(bumbleBee_.R_fMapx_.size(),CV_8UC1);
			cv::remap(in,outImage,bumbleBee_.R_fMapx_,bumbleBee_.R_fMapy_,cv::INTER_LINEAR);
		}
		else
		{
			outImage=cv::Mat(bumbleBee_.R_iMapx_.size(),CV_8UC1);
			cv::remap(in,outImage,bumbleBee_.R_iMapx_,bumbleBee_.R_iMapy_,cv::INTER_LINEAR);
		}
	}

}

void StereoBumble::drawROI(cv::Mat& in, cv::Mat& outImage, bool left)
{
	cv::cvtColor(in,outImage,cv::COLOR_GRAY2BGR);
	if(left)
	{
		cv::rectangle(outImage,bumbleBee_.l_ROI_,cv::Scalar(0,0,255));
	}
	else
	{
		cv::rectangle(outImage,bumbleBee_.r_ROI_,cv::Scalar(0,0,255));
	}

}

void StereoBumble::drawEpiLines(cv::Mat& in, cv::Mat& outImage, cv::Scalar col)
{
	cv::cvtColor(in,outImage,cv::COLOR_GRAY2BGR);
	
	for(int index=0;index<25;index++)
	{
		int step=in.size().height/25.0;
		cv::Point2f leftP(0,index*step);
		cv::Point2f rightP(in.size().width,index*step);
		cv::line(outImage,leftP,rightP,cv::Scalar(0,255,0));
	}
	
}





	
}
