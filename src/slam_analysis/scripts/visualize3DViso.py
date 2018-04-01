#!/usr/bin/env python
import os
import cv2
import sys

import time

from math import pi

from datetime import datetime 

import matplotlib.pyplot as plt
from cv_bridge import CvBridge
import numpy as np

###common ros messages and imports
import rospy
import copy
import argparse

from geometry_msgs.msg import PoseStamped,PoseArray,Quaternion,Point,Pose
import tf

import rosbag
import numpy as np

from visualization_msgs.msg import Marker
from std_msgs.msg import ColorRGBA


cvb=CvBridge()


def convertHomographyToMsg(homography):
    msg=Pose()
    quat=tf.transformations.quaternion_from_matrix(homography).reshape(1,4)
    msg.orientation=Quaternion(quat[0,0],quat[0,1],quat[0,2],quat[0,3])
    msg.position.x=homography[0,3]
    msg.position.y=homography[1,3]
    msg.position.z=homography[2,3]
    return msg

# def convertHomographyToMsg(homography,TFName="/world"):
#     latestMsg=PoseStamped()
#     quat=tf.transformations.quaternion_from_matrix(homography).reshape(1,4)
#     latestMsg.pose.orientation=Quaternion(quat[0,0],quat[0,1],quat[0,2],quat[0,3])
#     latestMsg.pose.position.x=homography[0,3]
#     latestMsg.pose.position.y=homography[1,3]
#     latestMsg.pose.position.z=homography[2,3]
#     latestMsg.header.frame_id=TFName
#     return latestMsg


def deserialHomography(arrayIn):
    outHomography=np.zeros((4,4),dtype=np.float64)
    row=0
    col=0
    for row in range(0,4):
        for col in range(0,4):
            outHomography[row,col]=arrayIn[row*4+col]
    return outHomography

def getMotion(visoList):
    homographies=[]
    currentPosition=np.eye(4,dtype=np.float64)
    Poses=[]
    fails=[]
    for index in range(1,len(visoList)):
        if(visoList[index].success):
            homographies.append(np.linalg.inv(deserialHomography(visoList[index].homography)))
            fails.append(True)
        else:
            homographies.append(homographies[-1])
            fails.append(False)
        currentPosition=currentPosition.dot(homographies[-1])
        Poses.append(currentPosition)
    print(len(homographies),len(Poses),len(fails))
    return (homographies,Poses,fails)

class singleFrame:
    def __init__(self,lmsg,rmsg,vmsg,frameN):
        self.left=cvb.imgmsg_to_cv2(lmsg)
        self.right=cvb.imgmsg_to_cv2(rmsg)
        self.viso=copy.deepcopy(vmsg)
        self.nNumber=frameN
    def getHomography(self):
        return deserialHomography(self.viso.homography)

  
inDir=sys.argv[1]

print("Reading from "+inDir)

inputBag=rosbag.Bag(inDir)

leftImages=[]
rightImages=[]
outputData=[]


print("extracting Topic Data")

for topic,msg,t in inputBag.read_messages(topics=['/viso_extractor/output','/bumblebee/left/ROI','/bumblebee/right/ROI']):
    if(topic=="/viso_extractor/output"):
        outputData.append(msg)
        print(len(outputData))
    if(topic=="/bumblebee/left/ROI"):
        leftImages.append(msg)
    if(topic=="/bumblebee/right/ROI"):
        rightImages.append(msg)

##only start from the second frame (once a motion was calculated)

CurrentPose=np.eye(4,dtype=np.float64)
previousMotion=np.eye(4,dtype=np.float64)
displayArray=PoseArray()
displayArray.header.frame_id='world'



outmarker=Marker()

outmarker.type=Marker.LINE_STRIP
outmarker.action=0
outmarker.header.frame_id="world"
outmarker.scale.x=0.05
outmarker.pose.position.x=0
outmarker.pose.position.y=0
outmarker.pose.position.z=0
outmarker.pose.orientation.x=0
outmarker.pose.orientation.y=0
outmarker.pose.orientation.z=0
outmarker.pose.orientation.w=1
outmarker.id=1
outmarker.ns=""
outmarker.points=[]



print("calculating Motion")
for index in range(1,len(leftImages)):
    print(index)
    latestFrame=singleFrame(leftImages[index],rightImages[index],outputData[index],index)
    if(latestFrame.viso.success):
        latestMotion=np.linalg.inv(latestFrame.getHomography())
        CurrentPose=CurrentPose.dot(latestMotion)
        previousMotion=latestMotion
    else:
        CurrentPose=CurrentPose.dot(previousMotion)
    displayArray.poses.append(convertHomographyToMsg(CurrentPose))
    outmarker.points.append(Point(displayArray.poses[-1].position.x,displayArray.poses[-1].position.y,0))
    outmarker.colors.append(ColorRGBA(1, 0, 0, 1))


rospy.init_node("display")

pub=rospy.Publisher("/poses_array",PoseArray,latch=True,queue_size=2)
pub.publish(displayArray)
pub2=rospy.Publisher("myMarker",Marker,latch=True,queue_size=2)
pub2.publish(outmarker)
print("published!")


rospy.spin()
print("Completed")