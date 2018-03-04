 
#include <viso_extractor/VisoManager.hpp>

VisoManager::VisoManager(std::string lTopic,std::string rTopic,VisualOdometryStereo::parameters inParam)
{
  it= new image_transport::ImageTransport(n);
  pose=Matrix::eye(4);
	odom=cv::Ptr<VisualOdometryStereo>(new VisualOdometryStereo(inParam));
  pubOutput=n.advertise<viso_extractor::VisoFrame>(ros::this_node::getName()+"/output",30);
  boost::thread OdomThread(boost::bind(&VisoManager::processOdom,this));
	leftSub=it->subscribe(lTopic, 5, &VisoManager::bufferLeft, this);
  rightSub=it->subscribe(rTopic, 5, &VisoManager::bufferRight, this);
	
}


void VisoManager::bufferLeft(const sensor_msgs::ImageConstPtr& msg)
{
	boost::mutex::scoped_lock lock(mutexLImg);
	bool const was_empty=leftImages.empty();
  leftImages.push((cv_bridge::toCvShare(msg,sensor_msgs::image_encodings::MONO8)->image).clone());
  if(was_empty)
	{
		leftImagesEmpty.notify_one();
	}
  
}

void VisoManager::bufferRight(const sensor_msgs::ImageConstPtr& msg)
{
	boost::mutex::scoped_lock lock(mutexRImg);
	bool const was_empty=rightImages.empty();
  rightImages.push((cv_bridge::toCvShare(msg,sensor_msgs::image_encodings::MONO8)->image).clone());
  if(was_empty)
	{
		rightImagesEmpty.notify_one();
	}
}

void VisoManager::processOdom()
{
  
  while(ros::ok())
	{
    
    cv::Mat leftBuffer,rightBuffer;
		boost::mutex::scoped_lock llock(mutexLImg);
    while(leftImages.empty())
    {
			leftImagesEmpty.wait(llock);
    }
		leftImages.front().copyTo(leftBuffer);
		leftImages.pop();
		llock.unlock();
    
    boost::mutex::scoped_lock rlock(mutexRImg);
    while(rightImages.empty())
    {
			rightImagesEmpty.wait(rlock);
    }
		rightImages.front().copyTo(rightBuffer);
		rightImages.pop();
		rlock.unlock();
    
    std::cout<<"Image Received\n";

    int32_t width = leftBuffer.cols;  
		int32_t height = leftBuffer.rows;

		uint8_t* left_img_data  = leftBuffer.data;
		uint8_t* right_img_data = rightBuffer.data;
		int32_t dims[] = {width,height,width};

    std::cout<<leftBuffer.cols<<","<<leftBuffer.rows<<std::endl;
    std::cout<<rightBuffer.cols<<","<<rightBuffer.rows<<std::endl;
    std::cout<<"-----\n";
    viso_extractor::VisoFrame outMessage;
		if (odom->process(left_img_data,right_img_data,dims)) {
        outMessage.success=true;
				Matrix mot=odom->getMotion();//Eigen matrix ->  (row,column)

        for(int row=0;row<4;row++)
        {
          for(int col=0;col<4;col++)
          {
            outMessage.homography.push_back(mot.val[row][col]);
          }
        }
        outMessage.nMatches.data=odom->getNumberOfMatches();
        outMessage.nInliers.data=odom->getNumberOfInliers();

        std::vector<Matcher::p_match> matches=odom->getMatches();
        for (size_t i = 0; i < matches.size(); ++i)
         {
           viso_extractor::pMatch currentMatch;
           currentMatch.u1p.data=matches[i].u1p;
           currentMatch.v1p.data=matches[i].v1p;
           currentMatch.i1p.data=matches[i].i1p;

           currentMatch.u2p.data=matches[i].u2p;
           currentMatch.v2p.data=matches[i].v2p;
           currentMatch.i2p.data=matches[i].i2p;

           currentMatch.u1c.data=matches[i].u1c;
           currentMatch.v1c.data=matches[i].v1c;
           currentMatch.i1c.data=matches[i].i1c;

           currentMatch.u2c.data=matches[i].u2c;
           currentMatch.v2c.data=matches[i].v2c;
           currentMatch.i2c.data=matches[i].i2c;

           outMessage.matches.push_back(currentMatch);
         }
      } else {
        outMessage.success=false;
        std::cout << " ... failed!" << std::endl;
      }

    pubOutput.publish(outMessage);

  }
}
