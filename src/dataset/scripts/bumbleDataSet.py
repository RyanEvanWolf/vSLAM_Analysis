#!/usr/bin/env python
import os
import cv2
import sys

import time

###common ros messages and imports
import rospy
from std_msgs.msg import String,Int32,Float32
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

###custom services and messages imports
from dataset.srv import resetDataset,resetDatasetResponse,resetDatasetRequest
from dataset.srv import getDatasetInfo,getDatasetInfoResponse,getDatasetInfoRequest
from dataset.srv import publishImage,publishImageResponse,publishImageRequest


class bumbleDataSet:
    def __init__(self):
        self.rootDir=None
        self.filesList=[]
        self.currentIndex=-1
    def loadFiles(self,inDir):
        self.rootDir=inDir
        tempFiles=[]
        for files in os.listdir(inDir):
            tempFiles.append(self.rootDir+"/"+files)
        self.filesList=sorted(tempFiles)
        self.currentIndex=-1
    def getImageName(self):
        if(self.currentIndex==-1):
            return "SequenceBeginning"
        elif((self.currentIndex>=0)and(self.currentIndex<len(self.filesList))):
            return self.filesList[self.currentIndex]
        else:
            return "ERROR,INVALID INDEX DETECTED"
    def getStatusString(self):
        return "["+str(self.currentIndex+1)+"/"+str(len(self.filesList))+"]"
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
    def __init__(self,rootFolder):
        self.data=bumbleDataSet()
        self.data.loadFiles(rootFolder)
        self.cvb = CvBridge()
        self.infoServ=rospy.Service("dataset/getDatasetInfo",getDatasetInfo,self.info)
        self.pubServ=rospy.Service("dataset/publishImage",publishImage,self.publishLatestImage)
        self.resetServ=rospy.Service("dataset/resetDataset",resetDataset,self.reset)
        self.pubImage=rospy.Publisher("dataset/currentImage",Image,queue_size=5)
    def reset(self,req):
        self.data.currentIndex=-1
        res=resetDatasetResponse()
        return res
    def info(self,req):
        returnMessage=getDatasetInfoResponse()
        returnMessage.rootFolder.data=self.data.rootDir
        returnMessage.currentIndex.data=self.data.currentIndex
        returnMessage.imageName.data=self.data.getImageName()
        returnMessage.status.data=self.data.getStatusString()
        return returnMessage
    def publishLatestImage(self,req):
        res=publishImageResponse()
        if(req.command.data=="Next"):
            if(self.data.increment()):
                newImage=cv2.imread(self.data.getCurrentDir(),cv2.IMREAD_GRAYSCALE)
                self.pubImage.publish(self.cvb.cv2_to_imgmsg(newImage))
                res.success=True
            else:
                print("Error, Dataset at end of sequnce")
                res.success=False
        elif(req.command.data=="Current"):
            newImage = cv2.imread(self.data.getCurrentDir(), cv2.IMREAD_GRAYSCALE)
            self.pubImage.publish(self.cvb.cv2_to_imgmsg(newImage))
            res.success = True
        elif(req.command.data=="Previous"):
            if (self.data.decrement()):
                newImage = cv2.imread(self.data.getCurrentDir(), cv2.IMREAD_GRAYSCALE)
                self.pubImage.publish(self.cvb.cv2_to_imgmsg(newImage))
                res.success = True
            else:
                print("Error, Dataset at beginning of Sequence")
                res.success = False
        else:
            print("unrecognized command")
            res.success=False
        res.currentIndex.data=self.data.currentIndex
        res.status.data=self.data.getStatusString()
        return res
if __name__ == '__main__':
    rospy.init_node('dataset')
    if(len(sys.argv)!=2):
        print("Incorrect Parameters Specified")
        print("expected: rosrun dataset bumbleDataSet.py ROOTDIR_OF_DATASET")
        exit(-1)
    manager=bumbleDataSetNode(sys.argv[1])
    rospy.spin()