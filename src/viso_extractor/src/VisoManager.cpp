 
#include <viso_extractor/VisoManager.hpp>

VisoManager::VisoManager(std::string lTopic,std::string rTopic,std::string bumblebeeConfig)
{
  it= new image_transport::ImageTransport(n);
  
  boost::thread OdomThread(boost::bind(&VisoManager::processOdom,this));

	leftSub=it->subscribe(lTopic, 5, &VisoManager::bufferLeft, this);
  rightSub=it->subscribe(rTopic, 5, &VisoManager::bufferRight, this);
}


void VisoManager::bufferLeft(const sensor_msgs::ImageConstPtr& msg)
{
	boost::mutex::scoped_lock lock(mutexLImg);
	bool const was_empty=leftImages.empty();
  leftImages.push((cv_bridge::toCvShare(msg, "8UC1")->image).clone());
  if(was_empty)
	{
		leftImagesEmpty.notify_one();
	}
  
}

void VisoManager::bufferRight(const sensor_msgs::ImageConstPtr& msg)
{
	boost::mutex::scoped_lock lock(mutexRImg);
	bool const was_empty=rightImages.empty();
  rightImages.push((cv_bridge::toCvShare(msg, "8UC1")->image).clone());
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
  }
}