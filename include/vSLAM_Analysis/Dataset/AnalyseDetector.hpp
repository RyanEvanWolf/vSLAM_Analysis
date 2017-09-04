 
#ifndef ANALYSE_DETECTOR_HEADER_HPP
#define ANALYSE_DETECTOR_HEADER_HPP

#include "Structures/vSLAM/StereoFeatures.hpp"
#include <dirent.h>
namespace stereo 
{
class AnalyseDetector 
{
	std::string detectorBaseDir_;
	std::vector<std::string> frameXML_;
	public:
		AnalyseDetector(std::string inputDirectory);
		void Analyse(std::string outdir,std::string prefix);
};
	
	
}


#endif