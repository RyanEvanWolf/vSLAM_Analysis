#!/usr/bin/env python
import os
import sys
import rospy
import time
from std_msgs.msg import String,Int32,Float32
from dataset.srv import nextFrame, nextFrameResponse, nextFrameRequest
from dataset.srv import extractFeatures, extractFeaturesResponse, extractFeaturesRequest
from dataset.srv import updateSettings, updateSettingsResponse, updateSettingsRequest
from dataset.srv import rectifiedSettings,rectifiedSettingsResponse,rectifiedSettingsRequest
from dataset.msg import ORB, extractSettings
import cv2

class bumbleDataSet:
    def __init__(self):
        self.rootDir=None
        self.filesList=[]
        self.currentIndex=0
    def loadFiles(self,inDir):
        self.rootDir=inDir
        tempFiles=[]
        for files in os.listdir(inDir):
            tempFiles.append(self.rootDir+"/"+files)
        self.filesList=sorted(tempFiles)
        self.currentIndex=0
    def increment(self):
        if(self.currentIndex+1<len(self.filesList)):
            self.currentIndex+=1
            return True
        else:
            return False
    def decrement(self):
        if(self.currentIndex-1>=0):
            self.currentIndex-=1
            return True
        else:
            return False
    def getStatusString(self):
        return "["+str(self.currentIndex+1)+"/"+str(len(self.filesList))+"]"
    def getCurrentDir(self):
        return self.filesList[self.currentIndex]

class bumbleDataSetNode:
    def __init__(self):
        self.data=bumbleDataSet()
        self.subFolder=rospy.Subscriber("dataset/root",String,self.newRootFolder)
        ##output info
        self.latestImage=rospy.Publisher("dataset/currentImage",String,latch=True,queue_size=50)
        self.status = rospy.Publisher("dataset/status", String, latch=True, queue_size=50)
        self.feedback = rospy.Service("dataset/command",nextFrame,self.updateFrame)
    def newRootFolder(self,message):
        self.data.loadFiles(message.data)
        self.data.currentIndex=0
        self.latestImage.publish(self.data.getCurrentDir())
        self.status.publish(self.data.getStatusString())
    def updateFrame(self,req):
        message = nextFrameResponse()
        if(req.Forward.data==True):
            if(self.data.increment()):
                self.latestImage.publish(self.data.getCurrentDir())
                self.status.publish(self.data.getStatusString())
                message.Status.data="Incremented"
            else:
                message.Status.data="End"
                self.status.publish("End")
        elif(req.Forward.data==False):
            if(self.data.decrement()):
                self.latestImage.publish(self.data.getCurrentDir())
                self.status.publish(self.data.getStatusString())
                message.Status.data = "Decremented"
            else:
                message.Status.data = "Start"
                self.status.publish("Start")
        return message
