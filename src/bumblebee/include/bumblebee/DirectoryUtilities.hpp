 
#include <string>
#include <iostream>
#include <stdlib.h>
#include <dirent.h>

#include <algorithm>

std::vector<std::string> getList(std::string readDir)
{
	std::vector<std::string> outList;
	DIR *dir;
	struct dirent *ent;
	if ((dir = opendir (readDir.c_str())) != NULL)
	{
		/* print all the files and directories within directory */
		while ((ent = readdir (dir)) != NULL) {
			std::string current(ent->d_name);
			if(current.compare(".")!=0 &&  current.compare("..")!=0)
			{
				outList.push_back(current);
			}
		}
		closedir (dir);
	}
	else
	{
		std::cout<<"Error, directoryRead Failed"<<std::endl;
	}
	std::sort(outList.begin(),outList.end());
	return outList;
}