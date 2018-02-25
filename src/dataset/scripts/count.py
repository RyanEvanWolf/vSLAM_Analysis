#!/usr/bin/env python
from sensor_msgs.msg import Image
import sys
import rospy
import cv2
from cv_bridge import CvBridge
import copy
import numpy as np
from front_end.msg import StereoFrame,FrameTracks,Window
from std_msgs.msg import Bool
import time
import imageio
from viso2_ros.msg import VisoInfo
global count
count=0

def callback(message):
    global count
    count=count+1
    print(count)

rospy.init_node("countMes")
imgSub=rospy.Subscriber("/lib_viso/info",VisoInfo,callback)
cvb = CvBridge()


rospy.spin()