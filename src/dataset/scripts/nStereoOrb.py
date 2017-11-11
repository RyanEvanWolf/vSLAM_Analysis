#!/usr/bin/env python
from bumbleDataSet import bumbleDataSetNode
from FeaturesResults import FrameFeatures, DataSetFeatures

import pandas as pd

import rospy
import sys
import time
from std_msgs.msg import Int32, Bool, Int8, Float64,String
from dataset.srv import nextFrame, nextFrameResponse, nextFrameRequest

from dataset.srv import stereoInliers, stereoInliersResponse, stereoInliersRequest
from dataset.srv import updateSettings, updateSettingsResponse, updateSettingsRequest
from dataset.srv import rectifiedSettings,rectifiedSettingsResponse,rectifiedSettingsRequest
from dataset.msg import ORB, extractSettings

import cv2

import numpy as np

import matplotlib.pyplot as plt

rospy.init_node('nFeatures')
input = String(sys.argv[1])
rospy.set_param("/bumbledataset/rootDirectory", sys.argv[1])
pubFolder = rospy.Publisher("dataset/root", String, latch=True, queue_size=10)
pubFolder.publish(input)
time.sleep(0.2)  ##waitfor server to setup
dataNode = bumbleDataSetNode()

##establish ros connections

global datasetS
global extractService
global extractSettings
global extractRectification

try:
    rospy.wait_for_service('dataset/command', 4)
    print("Connected to dataset/command")
    datasetS = rospy.ServiceProxy("dataset/command", nextFrame)
except rospy.ServiceException as exc:
    print("Service did not process request: " + str(exc))
try:
    rospy.wait_for_service("extract/stereo", 4)
    print("Connected to extract")
    extractService = rospy.ServiceProxy("extract/stereo", stereoInliers)
except rospy.ServiceException as exc:
    print("Service did not process request: " + str(exc))
try:
    rospy.wait_for_service("extract/settings", 4)
    print("Connected to extract/settings")
    extractSettings = rospy.ServiceProxy("extract/settings", updateSettings)
except rospy.ServiceException as exc:
    print("Service did not process request: " + str(exc))
try:
    rospy.wait_for_service("extract/rectified", 4)
    print("Connected to extract/rectified")
    extractRectification = rospy.ServiceProxy("extract/rectified", rectifiedSettings)
except rospy.ServiceException as exc:
    print("Service did not process request: " + str(exc))

def singleImageAnalyze():
    OrbObj = FrameFeatures()
    OrbReq = OrbObj.getOrbParameters()
    OrbObj.settingsMessages=OrbReq
    currentMessage = 0
    for messages in OrbObj.settingsMessages:
        print(len(OrbObj.settingsMessages))
        print("[" + str(currentMessage) + "/" + str(len(OrbObj.settingsMessages)) + "]")
        extractSettings(messages)
        a = stereoInliersRequest()
        a.imageDir.data = dataNode.data.getCurrentDir()
        OrbObj.imageFileName.append(dataNode.data.getCurrentDir())
        reply = extractService(a)
        OrbObj.responses.append(reply)
        img = cv2.imread(reply.matchedDir.data, cv2.IMREAD_COLOR)
        cv2.imshow('matches', img)
        cv2.waitKey(1)
        currentMessage += 1
    return OrbObj

def dataSetAnalyze():
    out=DataSetFeatures()
    fin=False
    i=0
    while(not fin):
        command = nextFrameRequest()
        command.Forward = True
        if(dataNode.updateFrame(command).Status.data=="End"):
            fin=True
        else:
            print(str(i) + "/"+str(len(dataNode.data.filesList)))
            print(dataNode.data.getCurrentDir())
            out.frames.append(singleImageAnalyze())
            command = nextFrameRequest()
            command.Forward = True
            dataNode.updateFrame(command)
            i+=1
    out.drawGraph()


##set xml File
rectFile = rectifiedSettingsRequest()
rectFile.RectifiedXMLdir.data = "/home/ryan/git/Output/Calibration/stereo_ParameterFour.xml"
print(extractRectification(rectFile))
print("setXMl Rectification Parameters")


cv2.namedWindow('matches', cv2.WINDOW_NORMAL)

dataSetAnalyze()

cv2.destroyAllWindows()