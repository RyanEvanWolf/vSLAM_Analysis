#include "dataset/extractManager.hpp"

namespace stereo {
	
extractManager::extractManager()
{
	extractServ=n.advertiseService("extract",&extractManager::extract,this);
	
	updateServ=n.advertiseService("extract/settings",&extractManager::update,this);
	rectServ=n.advertiseService("extract/rectified",&extractManager::updateRect,this);
	stereoServ=n.advertiseService("extract/stereo",&extractManager::stereoExtract,this);
	extractFASTserv=n.advertiseService("extract/FAST",&extractManager::extractFAST,this);
	extractSIFTserv=n.advertiseService("extract/SIFT",&extractManager::extractSIFT,this);
}

bool extractManager::extractSIFT(dataset::extractSIFT::Request& req, dataset::extractSIFT::Response& res)
{
	//create a fast detector object
	//int thresh=int(req.config.thresh.data);
	//bool suppr=bool(req.config.suppression.data);
	//int type=int(req.config.type.data);
	
	
	int n=int(req.config.maxFeatures.data);
	int oct=int(req.config.nOctave.data);
	double contrast=double(req.config.contrastThresh.data);
	double edge=double(req.config.edgeThresh.data);
	double sigma=double(req.config.sigma.data);
	
	
	//cv::SIFT sift;
	//sift(src, src, keypoints, descriptors, false);
	//cv::SiftFeatureDetector a=cv::SiftFeatureDetector(n,oct,contrast,edge,sigma);
	
	cv::SIFT a1= cv::SIFT(n,oct,contrast,edge,sigma);
	
	//get the input images
	
		cv::Mat leftImage,rightImage;
	bumble.getImage(std::string(req.imageDir.data),leftImage,true);
	bumble.getImage(std::string(req.imageDir.data),rightImage,false);
	
	//undistort images
	cv::Mat leftundist,rightundist;
	bumble.undistort(leftImage,leftundist,true);
	bumble.undistort(rightImage,rightundist,false);
	//get ROI images
	cv::Mat lr,rr;
	bumble.getROIimage(leftundist,lr,true);
	bumble.getROIimage(rightundist,rr,false);
	
	double average=0;
	for(int index=0;index<5;index++)
	{
		std::vector<cv::KeyPoint> lf;
		auto start=std::chrono::steady_clock::now();
		a1(lr,cv::Mat(),lf);
		auto end=std::chrono::steady_clock::now();
		average+= std::chrono::duration<double,std::nano>(end-start).count();
	}
	

	average= average/5.0;
	//extractfeatures
	std::vector<cv::KeyPoint> leftF,rightF;
	a1(lr,cv::Mat(),leftF);
//	bumble.leftDetection->detect(lr,leftF);
//	bumble.rightDetection->detect(rr,rightF);
//	//draw features onto image, and save it to a directory
	
	cv::Mat featl,featr;
	cv::drawKeypoints(lr,leftF,featl);
	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/featLeft.ppm",featl);
	
	
	
	res.nleft.data=leftF.size();
	res.leftFoundDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/featLeft.ppm";
	res.averageTime.data=average;
	return true;
}


bool extractManager::extractFAST(dataset::extractFAST::Request& req, dataset::extractFAST::Response& res)
{
	//create a fast detector object
	int thresh=int(req.config.thresh.data);
	bool suppr=bool(req.config.suppression.data);
	int type=int(req.config.type.data);
	
	
	bumble.leftDetection.release();
	bumble.rightDetection.release();
	
	bumble.leftDetection=cv::Ptr<DetectorSettings>(new FastDetector(thresh,suppr,type));
	bumble.rightDetection=cv::Ptr<DetectorSettings>(new FastDetector(thresh,suppr,type));
	
	//get the input images
	
	
	
	cv::Mat leftImage,rightImage;
	bumble.getImage(std::string(req.imageDir.data),leftImage,true);
	bumble.getImage(std::string(req.imageDir.data),rightImage,false);
	
	//undistort images
	cv::Mat leftundist,rightundist;
	bumble.undistort(leftImage,leftundist,true);
	bumble.undistort(rightImage,rightundist,false);
	//get ROI images
	cv::Mat lr,rr;
	bumble.getROIimage(leftundist,lr,true);
	bumble.getROIimage(rightundist,rr,false);
	
	double average=0;
	for(int index=0;index<5;index++)
	{
		//extractfeatures
		std::vector<cv::KeyPoint> lf;
		auto start=std::chrono::steady_clock::now();
		bumble.leftDetection->detect(lr,lf);
		auto end=std::chrono::steady_clock::now();
		average+= std::chrono::duration<double,std::nano>(end-start).count();
	}

		
	average= average/5.0;
	//extractfeatures
	std::vector<cv::KeyPoint> leftF;
	bumble.leftDetection->detect(lr,leftF);
	//draw features onto image, and save it to a directory
	
	cv::Mat featl;
	cv::drawKeypoints(lr,leftF,featl);
	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/featLeft.ppm",featl);
	
	
	
	res.nleft.data=leftF.size();
	res.leftFoundDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/featLeft.ppm";
	res.averageTime.data=average;
	return true;
}




bool extractManager::update(dataset::updateSettings::Request& req, dataset::updateSettings::Response& res)
{
	bumble.updateDetDesc(req.newSett);
	return true;
}

bool extractManager::updateRect(dataset::rectifiedSettings::Request& req, dataset::rectifiedSettings::Response& res)
{
	cv::FileStorage in(std::string(req.RectifiedXMLdir.data),cv::FileStorage::READ);
	in["StereoRect"]>>bumble.currentCam;
	in.release();
	return true;
}


bool extractManager::extract(dataset::extractFeatures::Request& req, dataset::extractFeatures::Response& res)
{
	//get input images
	cv::Mat leftImage,rightImage;
	bumble.getImage(std::string(req.imageDir.data),leftImage,true);
	bumble.getImage(std::string(req.imageDir.data),rightImage,false);
	
	//undistort images
	cv::Mat leftundist,rightundist;
	bumble.undistort(leftImage,leftundist,true);
	bumble.undistort(rightImage,rightundist,false);
	//get ROI images
	cv::Mat lr,rr;
	bumble.getROIimage(leftundist,lr,true);
	bumble.getROIimage(rightundist,rr,false);
	
	//extractfeatures
	std::vector<cv::KeyPoint> leftF,rightF;
	bumble.leftDetection->detect(lr,leftF);
	bumble.rightDetection->detect(rr,rightF);
	//populate response
	res.nleft.data=leftF.size();
	res.nright.data=rightF.size();
	res.leftROIDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/leftROI.ppm";
	res.rightROIDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/rightROI.ppm";
	res.leftFoundDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/featLeft.ppm";
	res.rightFoundDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/featRight.ppm";
	//make ROI image 
	cv::Mat outROIl,outROIr;
	bumble.drawROI(leftundist,outROIl,true);
	bumble.drawROI(rightundist,outROIr,false);
	//make features image 
	cv::Mat featl,featr;
	cv::drawKeypoints(lr,leftF,featl);
	cv::drawKeypoints(rr,rightF,featr);
	//save them
		//make file names 
	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/leftROI.ppm",outROIl);
	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/rightROI.ppm",outROIr);
	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/featLeft.ppm",featl);
	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/featRight.ppm",featr);
	

	return true;
}

bool extractManager::stereoExtract(dataset::stereoInliers::Request& req, dataset::stereoInliers::Response& res)
{
		//get input images
	cv::Mat leftImage,rightImage;
	bumble.getImage(std::string(req.imageDir.data),leftImage,true);
	bumble.getImage(std::string(req.imageDir.data),rightImage,false);
	
	//undistort images
	cv::Mat leftundist,rightundist;
	bumble.undistort(leftImage,leftundist,true);
	bumble.undistort(rightImage,rightundist,false);
	//get ROI images
	cv::Mat lr,rr;
	bumble.getROIimage(leftundist,lr,true);
	bumble.getROIimage(rightundist,rr,false);
	
	//extractfeatures
	std::vector<cv::KeyPoint> leftF,rightF;
	bumble.leftDetection->detect(lr,leftF);
	bumble.rightDetection->detect(rr,rightF);
	
	res.nleft.data=leftF.size();
	res.nright.data=rightF.size();
	

	
	cv::Mat leftD,rightD;
	bumble.leftDescriptor->extract(lr,leftF,leftD);
	bumble.rightDescriptor->extract(rr,rightF,rightD);
	
	cv::Mat distances=bumble.getEpiDistanceMat(leftF,rightF);
	cv::Mat epiMask=bumble.getEpiMask(leftF,rightF,distances);
	std::vector<std::vector<cv::DMatch>> out;
	
	
	
	cv::BFMatcher m(cv::NORM_HAMMING,false);
	m.knnMatch(leftD, rightD,out,2,epiMask);
	
	std::vector<cv::DMatch> good;
	for(int index=0;index<out.size();index++)
	{
		if(out.at(index).size()>=2)
		{
			if(out.at(index).at(0).distance<0.8*out.at(index).at(1).distance)
			{
				good.push_back(out.at(index).at(0));
			}
		}
		else
		{
			if(out.at(index).size()==1)
			{
				good.push_back(out.at(index).at(0));
			}
		}
		
	}

	
	cv::Mat ff;
	
	cv::drawMatches(lr,leftF, rr, rightF,good,ff,cv::Scalar::all(-1),cv::Scalar::all(-1),std::vector<char>(),2);
	
	res.nInliers.data=good.size();

	cv::imwrite(std::string(DEFAULT_SAVE_DIRECTORY)+"/matchedImage.ppm",ff);
	res.matchedDir.data=std::string(DEFAULT_SAVE_DIRECTORY)+"/matchedImage.ppm";
	
	return true;
}



	
}
