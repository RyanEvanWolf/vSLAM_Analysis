 
#include "ros/ros.h"
#include "std_msgs/String.h"

#include <sstream>

#include <iostream>
#include <string>
#include <vector>
#include <stdint.h>

#include <viso_stereo.h>
#include <png++/png.hpp>
#include <viso_extractor/VisoManager.hpp>


int main(int argc, char **argv)
{

  ros::init(argc, argv, "viso_extractor");

  ros::NodeHandle n;


  ros::Rate loop_rate(10);

  VisualOdometryStereo::parameters param;
  
  //Get all the viso parameters
  n.getParam("/viso_config/f",param.calib.f);
  n.getParam("/viso_config/cu",param.calib.cu);
  n.getParam("/viso_config/cv",param.calib.cv);
  n.getParam("/viso_config/baseline",param.base);
  n.getParam("/viso_config/maxFeatures",param.bucket.max_features);
  n.getParam("/viso_config/bucketHeight",param.bucket.bucket_height);
  n.getParam("/viso_config/bucketWidth",param.bucket.bucket_width);
  n.getParam("/viso_config/subPixel",param.match.refinement);
      /*      
              * /viso_config/baseline: 0.12
 * /viso_config/bucketHeight: 50
 * /viso_config/bucketWidth: 50
 * /viso_config/cu: 550.0
 * /viso_config/cv: 444.0
 * /viso_config/f: 850.0
 * /viso_config/maxFeatures: 10
 * /viso_config/subPixel: 2
*/
  
  
  
  VisoManager rosMan("/bumblebee/left/ROI","/bumblebee/right/ROI",param);
  
  ros::spin();
  


  return 0;
}