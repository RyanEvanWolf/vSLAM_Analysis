#!/usr/bin/env python


from FeaturesAnalysis import FeaturesAnalysis, drawGraph

import rospy
import sys
import cv2
import pickle
rospy.init_node('nFeaturesFastNode')

rospy.set_param("/outputDirectory","/media/ryan/Markov/DetectorOutput")

cv2.namedWindow('Features', cv2.WINDOW_NORMAL)

if(len(sys.argv)<3):
    detector="FAST"
else:
    detector=sys.argv[2]

det=FeaturesAnalysis(str(sys.argv[1]),detector)

data=det.AnalyzeDataSet()
pickle.dump(data,open(det.getFullDir()+"/Data.p","wb"))
print("saved to " +det.getFullDir())
second =  pickle.load(open(det.getFullDir()+"/Data.p","rb"))
print("loaded")


drawGraph(second)


cv2.destroyAllWindows()
print("finished")