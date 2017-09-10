#include <unistd.h>
#define defaultIN "/home/ryan/git/groundTruth/gt/build/bin/viso2/libVisoOut.xml"
#include <ros/console.h>
#include <ros/ros.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2/convert.h>
#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Vector3.h>
#include <tf2/LinearMath/Matrix3x3.h>

#include <visualization_msgs/Marker.h>
#include "Structures/vSLAM/InterStereoFrame.hpp"
#include "Structures/DataSet/BumbleDataSet.hpp"
#include <fstream> 



int main(int argc, char** argv){
  ros::init(argc, argv, "displayNode");
  
  
  if(argc!=4)
  {
	  ROS_ERROR("Incorrect Number of parameters...expects [inputDatasetFolder] [pathOutputXML] [outputDirectory]");
	  return -1;
  }
  
  std::string datasetDir(argv[1]);
  std::string trajDir(argv[2]);
  std::string outcsv(argv[3]);
  
  bool close=false;
  
  //create the cv windows
  
  cv::namedWindow("leftImage",cv::WINDOW_NORMAL);
  cv::namedWindow("rightImage",cv::WINDOW_NORMAL);
  
  //get BumbleDataSet data 
  stereo::BumbleDataSet bumbleData(datasetDir);
  double frameRate=1000/15;
  //process the output pathOutputXML
  std::ofstream outCSV;
  cv::FileStorage inputXML(trajDir,cv::FileStorage::READ); 
  std::vector<geometry_msgs::TransformStamped> relativePoses;
  
  cv::FileNodeIterator meas_it,meas_end;
  meas_it=inputXML["InterFrame"].begin();
  meas_end=inputXML["InterFrame"].end();
  
  //save useful data to a csv format for python graphing
  outCSV.open(outcsv);
  outCSV<<"Timestamp,X,Y,Z,Roll,Pitch,Yaw,Matches,Inliers\n";
  
  for(;meas_it!=meas_end;++meas_it)
  {
	  stereo::InterStereoFrame buffer;
	  (*meas_it)>>buffer;
	  
	  geometry_msgs::Vector3 _point;
	  _point.x=buffer.interMotion.getT().at<double>(0,0);
	  _point.y=buffer.interMotion.getT().at<double>(1,0);
	  _point.z=buffer.interMotion.getT().at<double>(2,0);
	  
	  tf2::Matrix3x3 rotation;
	  rotation.setValue(buffer.interMotion.getR().at<double>(0,0),buffer.interMotion.getR().at<double>(0,1),
						buffer.interMotion.getR().at<double>(0,2),buffer.interMotion.getR().at<double>(1,0),
						buffer.interMotion.getR().at<double>(1,1),buffer.interMotion.getR().at<double>(1,2),
						buffer.interMotion.getR().at<double>(2,0),buffer.interMotion.getR().at<double>(2,1),
						buffer.interMotion.getR().at<double>(2,2));

	  double roll,pitch,yaw;
	  
	  rotation.getRPY(roll,pitch,yaw);
	  
	  tf2::Quaternion quat;
	  
	  rotation.getRotation(quat);
	  
	  
	  
	  
	  geometry_msgs::TransformStamped current;
	  geometry_msgs::Quaternion msg;
	  
	  current.transform.rotation.x=quat.x();
	  current.transform.rotation.y=quat.y();
	  current.transform.rotation.z=quat.z();
	  current.transform.rotation.w=quat.w();
	  
	  
	  current.transform.translation=_point;
	  current.child_frame_id="leftCamera";
	  current.header.frame_id="world";
	  
	  relativePoses.push_back(current);
	  std::cout<<"PosesSize={"<<relativePoses.size()<<"}"<<std::endl;
	  outCSV<<buffer.endFrame;
	  outCSV<<","<<_point.x<<","<<_point.y<<","<<_point.z;
	  outCSV<<","<<roll<<","<<pitch<<","<<yaw;
	  outCSV<<","<<buffer.totalMatches<<","<<buffer.totalInliers<<std::endl;
	  
  }
  inputXML.release();
  outCSV.close();
  
  
  
  
  //begin loop ...Transform broadcasts + image updates
  bool paused=false;
  int buttonPressed;
  
  int transformIndex=-1;
  while(!close)
  {
	  if(paused)
	  {
		  buttonPressed=cv::waitKey(0);
	  }
	  else
	  {
		  buttonPressed=cv::waitKey(frameRate);
	  }

	  if(buttonPressed=='q')
	  {
		  //if button 'q' is pressed, close the program
		  close=true;
	  }
	  else
	  {
		  //update the state of the playback
		  if(buttonPressed==65362)
		  {
			  //increase the frameRate
			  if(frameRate-1000/120>=0)
			  {
				  frameRate-=1000/120;
				  ROS_INFO_STREAM("New Frame delay ="<<frameRate);
			  }
			  else
			  {
				  ROS_INFO_STREAM("Frame delay is already as low as possible = "<<frameRate<<"ms");
			  }
		  }
		  if(buttonPressed==65364)
		  {
			  frameRate+=1000/120;
			  std::cout<<"Frame Delay incrased = "<<frameRate<<"ms"<<std::endl;
		  }

		  if(!paused)
		  {
			if(buttonPressed==32)
		    {
			  ROS_INFO_STREAM("Paused");
			  paused=true;
		    }
		    cv::imshow("leftImage",bumbleData.getCurrentLeft());
		    cv::imshow("rightImage",bumbleData.getCurrentRight());
			close=!bumbleData.incrementFrame();
			std::cout<<bumbleData.getCurrent()<<std::endl;
			if(transformIndex!=relativePoses.size()-1)
			{
				transformIndex++;
			}
		  }
		  else
		  {
			if(buttonPressed==32)
		    {
			  ROS_INFO_STREAM("Unpaused");
			  paused=false;
		    }
		    if(buttonPressed==65361)
			{
				if(transformIndex!=relativePoses.size()-1)
				{
					transformIndex++;
				}
				bumbleData.decrementFrame();
				std::cout<<bumbleData.getCurrent()<<std::endl;
			}
			if(buttonPressed==65363)
			{
				if(transformIndex!=relativePoses.size()-1)
				{
					transformIndex++;
				}
				bumbleData.incrementFrame();
				std::cout<<bumbleData.getCurrent()<<std::endl;
			}
		    cv::imshow("leftImage",bumbleData.getCurrentLeft());
		    cv::imshow("rightImage",bumbleData.getCurrentRight());
		  }
		  
	  }
	  ros::spinOnce();
  }
  
  cv::destroyAllWindows();
  return 0;
}