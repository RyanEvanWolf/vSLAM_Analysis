#!/usr/bin/env python


from FeaturesAnalysis import FeaturesAnalysis

import rospy
import sys
import cv2
rospy.init_node('nFeaturesFastNode')

cv2.namedWindow('Features', cv2.WINDOW_NORMAL)

if(len(sys.argv)<3):
    detector="FAST"
else:
    detector=sys.argv[2]

det=FeaturesAnalysis(str(sys.argv[1]),detector)
det.AnalyzeDataSet().drawGraph()
cv2.destroyAllWindows()
print("finished")