#!/usr/bin/env python
from bumbleDataSet import bumbleDataSetNode

import pandas as pd

import rospy
import sys
import time
from std_msgs.msg import Int32, Bool, Int8, Float64,String
from dataset.srv import nextFrame, nextFrameResponse, nextFrameRequest

from dataset.srv import extractFeatures, extractFeaturesResponse, extractFeaturesRequest
from dataset.srv import updateSettings, updateSettingsResponse, updateSettingsRequest
from dataset.srv import rectifiedSettings,rectifiedSettingsResponse,rectifiedSettingsRequest
from dataset.msg import ORB, extractSettings

import cv2

import numpy as np

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
    rospy.wait_for_service("extract", 4)
    print("Connected to extract")
    extractService = rospy.ServiceProxy("extract", extractFeatures)
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


def singleImage(image=None):

    ##set xml File
    rectFile = rectifiedSettingsRequest()
    rectFile.RectifiedXMLdir.data = "/home/ryan/git/Output/Calibration/stereo_ParameterFour.xml"
    print(extractRectification(rectFile))
    print("setXMl Rectification Parameters")
    ##create orb parameters
    scaleVect=np.linspace(0.8,1.2,3,endpoint=True)
    edgeVect=np.arange(5,20,1)
    levelVect=np.arange(2,6,1)
    wtaVect=np.arange(2,4,1)
    scoreVect=[cv2.ORB_HARRIS_SCORE,cv2.ORB_FAST_SCORE]
    patchVect=np.arange(20,21,1)

    #cv2.namedWindow('foundLeft', cv2.WINDOW_NORMAL)
    #cv2.namedWindow('foundRight', cv2.WINDOW_NORMAL)
    #cv2.waitKey(100)

    for sc in scaleVect:
        for ed in edgeVect:
            for l in levelVect:
                for wt in wtaVect:
                    for scor  in scoreVect:
                        for pat in patchVect:
                            newSettings=updateSettingsRequest()
                            newSettings.newSett.orbConfig.scale.data=sc
                            newSettings.newSett.orbConfig.edge.data=ed
                            newSettings.newSett.orbConfig.level.data=l
                            newSettings.newSett.orbConfig.wta.data=wt
                            newSettings.newSett.orbConfig.score.data=scor
                            newSettings.newSett.orbConfig.patch.data=pat
                            newSettings.newSett.ExtractorName.data="ORB"
                            ##send settings request
                            extractSettings(newSettings)
                            print("new Settings of ")
                            print(newSettings)
                            a = extractFeaturesRequest()
                            a.imageDir.data = dataNode.data.getCurrentDir()
                            reply=extractService(a)
                            print(reply)
                            time.sleep(0.5)

                            #img = cv2.imread('messi5.jpg', 0)
                            #cv2.imshow()

    cv2.destroyAllWindows()

''' scaleVect=np.linspace(0.2,1,2,endpoint=True)
    print(scaleVect)


    settings = extractSettings()
    settings.orbConfig.scale.data = 0.5
    settings.orbConfig.edge.data = 2
    settings.orbConfig.level.data = 3
    settings.orbConfig.wta.data = 2
    settings.orbConfig.score.data = cv2.ORB_HARRIS_SCORE
    settings.orbConfig.patch.data = 3
    settings.ExtractorName.data = "ORB"

    p = updateSettingsRequest()
    p.newSett = settings
    print(p)
    set(p)
    print("detect")

    time.sleep(0.8)

    a = extractFeaturesRequest()
    a.imageDir.data = dataNode.data.getCurrentDir()

    reply = test(a)

    left = cv2.imread(reply.leftFoundDir.data)
    cv2.imshow("newWIndow", left)

    cv2.waitKey(0)'''

singleImage()