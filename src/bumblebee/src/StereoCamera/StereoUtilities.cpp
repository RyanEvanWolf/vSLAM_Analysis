 
#include "bumblebee/StereoCamera/StereoUtilities.hpp"


namespace Analysis {
	

geometry_msgs::Transform convert2Message(stereo::Isometry& in)
{
	geometry_msgs::Transform output;
	
	geometry_msgs::Vector3 _point;
	_point.x=in.invert().getT().at<double>(0,0);
	_point.y=in.invert().getT().at<double>(1,0);
	_point.z=in.invert().getT().at<double>(2,0);
	  
	tf2::Matrix3x3 rotation;
	rotation.setValue(in.invert().getR().at<double>(0,0),in.invert().getR().at<double>(0,1),
				in.invert().getR().at<double>(0,2),in.invert().getR().at<double>(1,0),
				in.invert().getR().at<double>(1,1),in.invert().getR().at<double>(1,2),
				in.invert().getR().at<double>(2,0),in.invert().getR().at<double>(2,1),
				in.invert().getR().at<double>(2,2));

	tf2::Quaternion quat;
	  
	rotation.getRotation(quat);
	  
	  
	  
	geometry_msgs::TransformStamped current;
	geometry_msgs::Quaternion msg;
	  
	output.rotation.x=quat.x();
	output.rotation.y=quat.y();
	output.rotation.z=quat.z();
	output.rotation.w=quat.w();
	  
	  
	output.translation=_point;
	return output;
}
	
	
}
