#!/usr/bin/env python
#####ros related imports
import rospy
from FeaturesAnalysis import getOrbParameters


####custom packages imports
from bumbleDataSet import bumbleDataSetNode
from front_end.srv import setDetector,setDetectorResponse,setDetectorRequest
from front_end.msg import ORB,StereoFrame
from drawingFunctions import stereoDrawing,ImageThread
from dataset.srv import resetDataset,resetDatasetResponse,resetDatasetRequest
from dataset.srv import getDatasetInfo,getDatasetInfoResponse,getDatasetInfoRequest
from dataset.srv import publishImage,publishImageResponse,publishImageRequest

##system imports
import sys
import copy
import cv2
import time
from threading import Thread, Lock
import numpy as np
import pickle




class FrameFeatures:
    def __init__(self):
        self.messages=[]
        self.responses=[]
        self.imageDir=[]

class DataSetFeatures:
    def __init__(self):
        self.frames = []

class StereoManager():
    def __init__(self):
        ##wait for services
        rospy.wait_for_service("front_end/setDetector", 4)

        self.feedback=stereoDrawing("bumblebee/leftROI", "bumblebee/rightROI", "bumblebee/leftRectified",
                                     "bumblebee/rightRectified")
        self.detSrv=rospy.ServiceProxy("front_end/setDetector",setDetector)
        try:
            rospy.wait_for_service("/dataset/publishImage", 4)
            print("Connected to /dataset/publishImage")
            self.publishSrv = rospy.ServiceProxy("/dataset/publishImage",publishImage)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        try:
            rospy.wait_for_service("/dataset/getDatasetInfo", 4)
            print("Connected to /dataset/getDatasetInfo")
            self.infoSrv = rospy.ServiceProxy("/dataset/getDatasetInfo",getDatasetInfo)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        try:
            rospy.wait_for_service("/dataset/resetDataset", 4)
            print("Connected to /dataset/resetDataset")
            self.resetSrv = rospy.ServiceProxy("/dataset/resetDataset", resetDataset)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))



        stereoSub = rospy.Subscriber("front_end/stereo", StereoFrame, self.stereoFrameReceived)
        self.wait=False
        self.matchesImage=ImageThread("matches")
    def runSimulation(self):
        r = resetDatasetRequest()
        self.resetSrv(r)
        time.sleep(0.1)
        m = setDetectorRequest()
        settings=ORB()
        settings.maxFeatures.data=10000
        settings.scale.data = 1.5
        settings.edge.data = 4
        settings.level.data =3
        settings.wta.data = 2
        settings.score.data = cv2.ORB_HARRIS_SCORE
        settings.patch.data = 16
        m.orbConfig = settings
        m.Name.data="ORB"
        m.detection=True
        self.detSrv(m)
        time.sleep(0.5)
        m.detection=False
        self.detSrv(m)
        time.sleep(0.5)
        next = publishImageRequest()
        next.command.data = "Next"
        print("beginning Sequence")
        for i in range(30):
            ####update detection
            m.orbConfig=getOrbParameters()[i]
            m.detection=True
            self.detSrv(m)
            time.sleep(0.5)
            m.detection=False
            self.detSrv(m)
            time.sleep(0.5)
            self.wait=True
            self.publishSrv(next)
            while(self.wait):
                time.sleep(0.05)
        cv2.destroyAllWindows()
        print("completed")
    def stereoFrameReceived(self,message):
        self.matchesImage.updateImage(self.feedback.drawMatches(message.matches))
        self.wait = False






if __name__ == '__main__':
    rospy.init_node('stereoSimulation')
    manager=StereoManager()
    manager.runSimulation()
