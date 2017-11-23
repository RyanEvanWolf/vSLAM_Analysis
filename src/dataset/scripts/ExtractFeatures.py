#!/usr/bin/env python
from FeaturesAnalysis import FeaturesAnalysis, drawGraph

import rospy
import sys
import cv2
import pickle
rospy.init_node('ExtractFeaturesNode')
###set a default output directory for the entire script
rospy.set_param("/outputDirectory","/media/ryan/Markov/DetectorOutput")


if(len(sys.argv)!=4):
    print("invalid input configuration")
    print("should be ->")
    print("rosrun dataset ExtractFeatures.py datasetRootDirectory(string) DetectorName(string) Display(bool)")
else:
    if(sys.argv[3]=="True"):
        cv2.namedWindow('Features', cv2.WINDOW_NORMAL)
        DataSetDetector=FeaturesAnalysis(str(sys.argv[1]),str(sys.argv[2]),True)
        cv2.destroyAllWindows()
    else:
        DataSetDetector = FeaturesAnalysis(str(sys.argv[1]), str(sys.argv[2]), False)
    data=DataSetDetector.AnalyzeDataSet()
    pickle.dump(data,open(DataSetDetector.getFullDir()+"/Data.p","wb"))
    print("saved to " +DataSetDetector.getFullDir())
    second =  pickle.load(open(DataSetDetector.getFullDir()+"/Data.p","rb"))
    print("loaded")
    drawGraph(second)
print("finished")