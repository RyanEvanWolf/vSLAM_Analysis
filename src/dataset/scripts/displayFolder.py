#!/usr/bin/env python

import rospy
import cv2
from bumbleDataSet import bumbleDataSet
from displayImages import imageWindow
import sys


rospy.init_node('View')

inData=bumbleDataSet()
inData.loadFiles(sys.argv[1])

cv2.namedWindow("image",cv2.WINDOW_NORMAL)

count=0
for i in inData.filesList:
    print(count)
    cv2.imshow("image",cv2.cvtColor(cv2.imread(i,cv2.IMREAD_GRAYSCALE),cv2.COLOR_BAYER_BG2RGB))
    cv2.waitKey(10)
    count=count+1
