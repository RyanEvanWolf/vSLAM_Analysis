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
	if(in.channels()==1)
	{
		cv::cvtColor(in,outImage,cv::COLOR_GRAY2BGR);
	}
	else
	{
		in.copyTo(outImage);
	}
	
	for(int index=0;index<25;index++)
	{
		int step=in.size().height/25.0;
		cv::Point2f leftP(0,index*step);
		cv::Point2f rightP(in.size().width,index*step);
		cv::line(outImage,leftP,rightP,cv::Scalar(0,255,0));
	}
	
}


void StereoBumble::getSideSideRect(cv::Mat limg, cv::Mat rimg, cv::Mat& out)
{
	//rectifies a left and right image, and returns the two side by side
	out=cv::Mat(cv::Size(limg.size().width+rimg.size().width,limg.size().height),limg.type());
	cv::Mat lroi(out,cv::Rect(0,0,limg.size().width,limg.size().height));
	cv::Mat rroi(out,cv::Rect(limg.size().width,0,rimg.size().width,rimg.size().height));
	
	limg.copyTo(lroi);
	rimg.copyTo(rroi);
}

void StereoBumble::draw(cv::Mat limg,cv::Mat rimg, cv::Mat &outImage,stereo::StereoFrame in)
{
	cv::drawMatches(limg,in.leftFeatures_,
					rimg,in.rightFeatures_,
					in.matches_,outImage,cv::Scalar::all(-1),
					cv::Scalar::all(-1),in.inliersMask_,
					cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
}

void StereoBumble::draw(cv::Mat limg,cv::Mat rimg,cv::Mat &outImage,stereo::StereoFrame in,cv::Scalar colour,std::vector<char> mask)
{
		cv::drawMatches(limg,in.leftFeatures_,
						rimg,in.rightFeatures_,
						in.matches_,outImage,colour,
						colour,mask,
						cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
}




	
}
