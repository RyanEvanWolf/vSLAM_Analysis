#include "vSLAM_Analysis/Dataset/AnalyseFeatures.hpp"

namespace stereo {


AnalyseFeatures::AnalyseFeatures()
{
	
}

int AnalyseFeatures::getTotalLeftPoints(StereoFeatures &in)
{
	return in.leftFeatures.size();
}


int AnalyseFeatures::getTotalRightPoints(StereoFeatures &in)
{
	return in.rightFeatures.size();
}

	
	
}
