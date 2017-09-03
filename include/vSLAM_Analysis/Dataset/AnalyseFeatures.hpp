#ifndef ANALYSE_FEATURES_HEADER_HPP
#define ANALYSE_FEATURES_HEADER_HPP

#include "Structures/vSLAM/StereoFeatures.hpp"

namespace stereo 
{
class AnalyseFeatures 
{
	public:
		AnalyseFeatures();
		int getTotalLeftPoints(StereoFeatures &in);
		int getTotalRightPoints(StereoFeatures &in);
};
	
	
}


#endif