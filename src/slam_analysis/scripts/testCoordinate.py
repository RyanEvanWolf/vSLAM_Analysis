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
from std_msgs.msg import ColorRGBA
import rosbag
import numpy as np

from visualization_msgs.msg import Marker


rospy.init_node("display")
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

motion=[]
poses=[]

Pose=np.zeros((4,4),dtype=np.float64)
Pose[3,3]=1
Pose[0,0]=1
Pose[1,1]=1
Pose[2,2]=1

arr=PoseArray()

arr.header.frame_id="world"

arr2=PoseArray()
arr2.header.frame_id="new"

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

for i in range(0,25):
    outHomography=np.zeros((4,4),dtype=np.float64)
    outHomography[2,3]=1
    outHomography[3,3]=1
    outHomography[0,0]=1
    outHomography[1,1]=1
    outHomography[2,2]=1
    motion.append(outHomography)
    Pose=np.dot(Pose,outHomography)
    a=convertHomographyToMsg(Pose)
    arr.poses.append(a.pose)
    arr2.poses.append(a.pose)
    outmarker.points.append(a.pose.position)
    outmarker.colors.append(ColorRGBA(1, 0, 0, 1))
print(motion[-1])
print(Pose)

arr2.header.frame_id="new"


pub=rospy.Publisher("/poses_array",PoseArray,latch=True,queue_size=2)
pub2=rospy.Publisher("myMarker",Marker,latch=True,queue_size=2)
pub.publish(arr)
pub2.publish(outmarker)
print("published!")

# pub_line_min_dist = rospy.Publisher('~line_min_dist', Marker,latch=True,queue_size=1)

# marker = Marker()
# marker.header.frame_id = "/my_fixed_frame"
# marker.type = marker.LINE_STRIP
# marker.action = marker.ADD

# # marker scale
# marker.scale.x = 0.03
# marker.scale.y = 0.03
# marker.scale.z = 0.03

#     # marker color
# marker.color.a = 1.0
# marker.color.r = 1.0
# marker.color.g = 1.0
# marker.color.b = 0.0
# # marker orientaiton
# marker.pose.orientation.x = 0.0
# marker.pose.orientation.y = 0.0
# marker.pose.orientation.z = 0.0
# marker.pose.orientation.w = 1.0

# # marker position
# marker.pose.position.x = 0.0
# marker.pose.position.y = 0.0
# marker.pose.position.z = 0.0

# # marker line points
# marker.points = []
# # first point
# first_line_point = Point()
# first_line_point.x = 0.0
# first_line_point.y = 0.0
# first_line_point.z = 0.0
# marker.points.append(first_line_point)
# # second point
# second_line_point = Point()
# second_line_point.x = 1.0
# second_line_point.y = 1.0
# second_line_point.z = 0.0
# marker.points.append(second_line_point)
# # Publish the Marker
# pub_line_min_dist.publish(marker)


########
#######













rospy.spin()
