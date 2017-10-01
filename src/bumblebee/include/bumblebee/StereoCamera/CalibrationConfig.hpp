 
#ifndef CALIBRATION_CONFIGURATION_HEADER_HPP_
#define CALIBRATION_CONFIGURATION_HEADER_HPP_

#include <iostream>
#include <bitset>

#include <opencv2/core.hpp>
#include <opencv2/calib3d.hpp>

#include <algorithm>
#include <vector>
#include <sys/types.h>
#include <dirent.h>
#include <errno.h>
#include <cstdlib>

/*
 * A configuration Class for an individual camera,
 * it specifies where to find the images, where to save them, 
 * and a few other helper functions for the calibration itself.
 Always assum that no prior information is known about the camera i.e.
 no initial guesses*/
namespace stereo
{
std::vector< std::vector< cv::Point3f > > getChessPoints(cv::Size board, double square_size, int n);	
	
class CalibrationConfig{
	private:
	public:
		std::string leftInputImageDir;
		std::string rightInputImageDir;
		std::string filename;  //save file name
		std::string in_directory; //where to look for images
		std::string out_directory;//where to save all the output
		int patternRow;
		int patternCol;
		int squareSize;
		bool debugInfo;//true if printing debug information
		bool robustCheckerBoard;//if true, varies all possible combinations to find checkerBoards
		bool displayFound;//true if each found checkerboard will be displayed in the program
		bool displayUndistorted;//show the undistortion image according to k1 ,k2 etc
		bool displayMapping;//if show undistorted, also shows the mapping of points from old to new
		/*Calibration flags for a single camera configuration*/
		bool cal_adaptive;
		bool cal_normalize;
		bool cal_filter;
		std::string distortionModel;
		void write(cv::FileStorage& fs) const;
		void read(const cv::FileNode& node);
		void print();
		cv::Size getBoard();
		cv::Size calibrationSize;
		int getCalibrationFlags();//produces the enumeration over all the calibration flags set
		std::vector<cv::Point3f> genBoardCoordinate();//generates the coordiantes of the checkerboard relative to the top left with z=0
		std::vector< std::vector<cv::Point3f> >  genSetBoardCoordinate(int image_total);
		std::vector<std::string> maskImagesRemoved_;
		//opencv requires a set of checkerboard to be passed, image total is the number of found images
		CalibrationConfig();
		void createDirectories();

};

//These write and read functions must be defined for the serialization in FileStorage to work

static void read(const cv::FileNode& node, stereo::CalibrationConfig& x, const stereo::CalibrationConfig& default_value = stereo::CalibrationConfig()){
    if(node.empty())
	{
        x = default_value;
	}
    else
	{
        x.read(node);
	}
}



static void write(cv::FileStorage& fs, const std::string&, const stereo::CalibrationConfig& x)
{
    x.write(fs);
}



	
}


#endif