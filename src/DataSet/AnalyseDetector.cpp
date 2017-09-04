#include "vSLAM_Analysis/Dataset/AnalyseDetector.hpp"

namespace stereo {


AnalyseDetector::AnalyseDetector(std::string inputDirectory)
{
	DIR *dir;
	struct dirent *ent;
	if ((dir = opendir (inputDirectory.c_str())) != NULL) {
	/* print all the files and directories within directory */
	while ((ent = readdir (dir)) != NULL) {
		std::string current(ent->d_name);
		if(current.compare(".")!=0 &&  current.compare("..")!=0)
		{
			frameXML_.push_back(current);
		}
	}
	closedir (dir);
	detectorBaseDir_=inputDirectory;
	} else {
	std::cout<<"Error, directoryRead Failed"<<std::endl;
	}
}


void AnalyseDetector::Analyse(std::string outdir,std::string prefix)
{
	if(frameXML_.size()>0)
	{
		std::string outputFileName;
		outputFileName=outdir;
		outputFileName+="/";
		outputFileName+=prefix;
		outputFileName+=".csv";
		std::ofstream myfile;
		myfile.open(outputFileName);
		myfile<<"Timestamp,totalLeft,totalRight\n";
		for(int index=0;index<frameXML_.size();index++)
		{
			//if there is actually something in the folder
			//build the name of the xml file
			std::string fullXMLName;
			fullXMLName=detectorBaseDir_;
			fullXMLName+="/";
			fullXMLName+=frameXML_.at(index);
			
			
			StereoFeatures currentFeatures;
			
			//load xml file into memory
			cv::FileStorage currentFile(fullXMLName,cv::FileStorage::READ);
			currentFile["features"]>>currentFeatures;
			currentFile.release();
			
			std::cout<<currentFeatures.frameData_.fileName_.erase(currentFeatures.frameData_.fileName_.size()-4);
			myfile<<currentFeatures.frameData_.fileName_.erase(currentFeatures.frameData_.fileName_.size()-4);
			myfile<<","<<currentFeatures.leftFeatures.size();
			myfile<<","<<currentFeatures.rightFeatures.size();
			myfile<<"\n";
			std::cout<<"\t"<<currentFeatures.leftFeatures.size();
			std::cout<<"\t"<<currentFeatures.rightFeatures.size()<<std::endl;
		}
		myfile.close();
	}
}




	
}
 
