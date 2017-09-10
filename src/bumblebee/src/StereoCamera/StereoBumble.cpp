#include "bumblebee/StereoCamera/StereoBumble.hpp"

namespace Analysis {
	
StereoBumble::StereoBumble(std::string RectifiedDirectory)
{
	cv::FileStorage inputFile(RectifiedDirectory,cv::FileStorage::READ);
	
	inputFile["StereoRect"]>>bumbleBee_;
	l2R=convert2Message(bumbleBee_.rIso_);
	l2rectL=convert2Message(bumbleBee_.lrectIso_);
	r2rectr=convert2Message(bumbleBee_.rrectIso_);
	
	inputFile.release();
}


	
}
