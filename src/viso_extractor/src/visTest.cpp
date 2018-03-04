/*
Copyright 2012. All rights reserved.
Institute of Measurement and Control Systems
Karlsruhe Institute of Technology, Germany

This file is part of libviso2.
Authors: Andreas Geiger

libviso2 is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or any later version.

libviso2 is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
libviso2; if not, write to the Free Software Foundation, Inc., 51 Franklin
Street, Fifth Floor, Boston, MA 02110-1301, USA 
*/

/*
  Documented C++ sample code of stereo visual odometry (modify to your needs)
  To run this demonstration, download the Karlsruhe dataset sequence
  '2010_03_09_drive_0019' from: www.cvlibs.net!
  Usage: ./viso2 path/to/sequence/2010_03_09_drive_0019
*/

#include <iostream>
#include <string>
#include <vector>
#include <stdint.h>

#include <viso_stereo.h>
#include <png++/png.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/features2d.hpp>


#include <opencv2/core/core.hpp>

#include <opencv2/highgui/highgui.hpp>


using namespace std;

int main (int argc, char** argv) {
  
  // set most important visual odometry parameters
  // for a full parameter list, look at: viso_stereo.h
  VisualOdometryStereo::parameters param;
  
  // calibration parameters for sequence 2010_03_09_drive_0019 
  param.calib.f  = 645.24; // focal length in pixels
  param.calib.cu = 635.96; // principal point (u-coordinate) in pixels
  param.calib.cv = 194.13; // principal point (v-coordinate) in pixels
  param.base     = 0.5707; // baseline in meters
  
  // init visual odometry
  VisualOdometryStereo viso(param);
  
  // current pose (this matrix transforms a point from the current
  // frame's camera coordinates to the first frame's camera coordinates)
  Matrix pose = Matrix::eye(4);
    
  // loop through all frames i=0:372
  for (int32_t i=0; i<2; i++) {

      cv::Mat l,r;
      l=cv::imread("/home/ryan/D5_out.png",cv::IMREAD_GRAYSCALE);
      r=cv::imread("/home/ryan/D5_out.png",cv::IMREAD_GRAYSCALE);
      // status
      cout << "Processing: Frame: " << i;
      
        int32_t width = l.cols;  
		  int32_t height = l.rows;

		  uint8_t* left_img_data  = l.data;
		  uint8_t* right_img_data = r.data;
		  int32_t dims[] = {width,height,width};
      if (viso.process(left_img_data,right_img_data,dims)) {
      
        // on success, update current pose
        pose = pose * Matrix::inv(viso.getMotion());
      
        // output some statistics
        double num_matches = viso.getNumberOfMatches();
        double num_inliers = viso.getNumberOfInliers();
        cout << ", Matches: " << num_matches;
        cout << ", Inliers: " << 100.0*num_inliers/num_matches << " %" << ", Current pose: " << endl;
        cout << pose << endl << endl;

      } else {
        cout << " ... failed!" << endl;
      }

      // release uint8_t buffers
      free(left_img_data);
      free(right_img_data);
  }
  
  // output
  cout << "Demo complete! Exiting ..." << endl;

  // exit
  return 0;
}

 
