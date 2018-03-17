#!/usr/bin/env python
import os
import cv2
import sys

import time

from datetime import datetime 

import matplotlib.pyplot as plt
from cv_bridge import CvBridge
import numpy as np

###common ros messages and imports
import rospy
import copy
import argparse

from geometry_msgs.msg import PoseStamped,PoseArray,Quaternion
import tf

import rosbag

cvb=CvBridge()

def convertHomographyToMsg(homography,TFName="/world"):
    latestMsg=PoseStamped()
    quat=tf.transformations.quaternion_from_matrix(homography).reshape(1,4)
    latestMsg.pose.orientation=Quaternion(quat[0,0],quat[0,1],quat[0,2],quat[0,3])
    latestMsg.pose.position.x=homography[0,3]
    latestMsg.pose.position.y=homography[1,3]
    latestMsg.pose.position.z=homography[2,3]
    latestMsg.header.frame_id=TFName
    return latestMsg


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
            homographies.append(deserialHomography(visoList[index].homography))
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

  


inputBag=rosbag.Bag('/home/ryan/DataSets/raw/complex/output/visoBag.bag')

leftImages=[]
rightImages=[]
outputData=[]


print("extracting Topic Data")

for topic,msg,t in inputBag.read_messages(topics=['/viso_extractor/output','/bumblebee/left/ROI','/bumblebee/right/ROI']):
    if(topic=="/viso_extractor/output"):
        outputData.append(msg)
    if(topic=="/bumblebee/left/ROI"):
        leftImages.append(msg)
    if(topic=="/bumblebee/right/ROI"):
        rightImages.append(msg)

print("topic data extracted")
MotionData=getMotion(outputData)

print(np.eye(4,dtype=np.float64))
print(np.eye(4,dtype=np.float64).shape)
a=tf.transformations.quaternion_from_matrix(np.eye(4,dtype=np.float64))


poses=PoseArray()
poses.header.frame_id="/world"

print(a)
for i in MotionData[1]:
    poses.poses.append(convertHomographyToMsg(i).pose)

inputBag.close()


rospy.init_node("display")

pub=rospy.Publisher("/poses_array",PoseArray,latch=True,queue_size=2)
pub.publish(poses)


rospy.spin()


'''
import rospy
import rosbag
from geometry_msgs.msg import PoseArray,Transform,TransformStamped,Point

from std_msgs.msg import String,Int32
from viso2_ros.msg import VisoInfo
import time
import tf
import math

from visualization_msgs.msg import Marker

rospy.init_node("analyze")
inBag=rosbag.Bag('/home/ryan/git/Output/visoBag.bag','r')




test=PoseArray()
test.header.frame_id="cv"

m=Marker()
mp=Marker()

pointLocations=[]

topCount=0
for topic, msg, t in inBag.read_messages():
    if(topic=="/lib_viso/pose"):
        test.poses.append(msg.pose)
        m.points.append(msg.pose.position)#.x,msg.pose.translation.y,msg.pose.translation.z))
        mp.points.append(msg.pose.position)
print(len(test.poses))
a=rospy.Publisher("set",PoseArray,queue_size=10)


br=tf.TransformBroadcaster()

toWorld=TransformStamped()
toWorld.header.frame_id="world"
toWorld.child_frame_id="cv"

toWorld.transform.translation.x=0
toWorld.transform.translation.y=0
toWorld.transform.translation.z=0

toWorld.transform.rotation= tf.transformations.quaternion_from_euler(math.radians(90),math.radians(90),0)


m.type=4
m.action=0
m.header.frame_id="world"


m.scale.x=0.01
m.scale.y=0.01
m.scale.z=0.01
m.color.g=1.0
m.pose.orientation.w=0
m.color.a=1

mp.type=6
mp.action=0
mp.header.frame_id="world"


mp.scale.x=0.01
mp.scale.y=0.01
mp.scale.z=0.01
mp.color.r=1.0
mp.pose.orientation.w=0
mp.color.a=1


p=rospy.Publisher("mark",Marker,queue_size=10)
pp=rospy.Publisher("marker2",Marker,queue_size=10)
p.publish(m)
pp.publish(mp)




while(not  rospy.is_shutdown()):
    time.sleep(0.5)
    m.header.stamp=rospy.Time.now()
    mp.header.stamp=rospy.Time.now()
    p.publish(m)
    pp.publish(mp)
#    toWorld.header.stamp=rospy.Time.now()
#    test.header.stamp=rospy.Time.now()
##    br.sendTransform((0,0,0),toWorld.transform.rotation,toWorld.header.stamp,toWorld.child_frame_id,toWorld.header.frame_id)
#    a.publish(test)


rospy.spin()
'''