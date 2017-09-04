

#include "vSLAM_Analysis/Dataset/AnalyseDetector.hpp"

#define DEFAULT_DIRECTORY "/home/ryan/git/vSLAM_FrontEnd/output/CLOUDY/FAST/FAST_0_0_5/"
 
 int main(int argc, char *argv [])
 {
	 using namespace stereo;
	 AnalyseDetector stats("/home/ryan/git/vSLAM_FrontEnd/output/CLOUDY/FAST/FAST_0_0_5");
	 stats.Analyse("./","FAST_0_0_5");
	 std::cout<<"exit";
	 return 0;
 }