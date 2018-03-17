#!/usr/bin/env python
import os
import cv2
import sys

import time

from datetime import datetime 

import matplotlib.pyplot as plt
from cv_bridge import CvBridge

###common ros messages and imports
import rospy
import copy
import argparse

import rosbag

cvb=CvBridge()

class singleFrame:
    def __init__(self,lmsg,rmsg,vmsg,frameN):
        self.left=cvb.imgmsg_to_cv2(lmsg)
        self.right=cvb.imgmsg_to_cv2(rmsg)
        self.viso=copy.deepcopy(vmsg)
        self.nNumber=frameN
    def drawTracks(self,Left=True):
        currentMatches=[]
        previousMatches=[]
        if(Left):
            pass
        else:
            pass
        return 0

    


inputBag=rosbag.Bag('/home/ryan/DataSets/raw/complex/output/visoBag.bag')

leftImages=[]
rightImages=[]
outputData=[]




for topic,msg,t in inputBag.read_messages(topics=['/viso_extractor/output','/bumblebee/left/ROI','/bumblebee/right/ROI']):
    if(topic=="/viso_extractor/output"):
        outputData.append(msg)
    if(topic=="/bumblebee/left/ROI"):
        leftImages.append(msg)
    if(topic=="/bumblebee/right/ROI"):
        rightImages.append(msg)


for i in range(0,len(leftImages)):
    a=singleFrame(leftImages[i],rightImages[i],outputData[i],i)
    print(a.nNumber)
    cv2.imshow("a",a.left)
    cv2.waitKey(1)
inputBag.close()

