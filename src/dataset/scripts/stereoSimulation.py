#!/usr/bin/env python
#####ros related imports
import rospy
from FeaturesAnalysis import getOrbParameters
from PyQt5.QtWidgets import QApplication
from PyQt5.QtGui import QPixmap, QImage
####custom packages imports
from bumbleDataSet import bumbleDataSetNode
from front_end.srv import setDetector,setDetectorResponse,setDetectorRequest
from front_end.msg import ORB,StereoFrame,FrameTracks

from displayImages import imageManager

from dataset.srv import resetDataset,resetDatasetResponse,resetDatasetRequest
from dataset.srv import getDatasetInfo,getDatasetInfoResponse,getDatasetInfoRequest
from dataset.srv import publishImage,publishImageResponse,publishImageRequest

from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot

##system imports
import sys
import copy
import cv2
import time
from threading import Thread, Lock
import numpy as np
import pickle


from std_msgs.msg import String

import signal


class FrameFeatures:
    def __init__(self):
        self.messages=[]
        self.responses=[]
        self.imageDir=[]

class DataSetFeatures:
    def __init__(self):
        self.frames = []

class StereoManager():
    def __init__(self,displayNames):
        ##wait for services
        rospy.wait_for_service("front_end/setDetector", 4)
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
        self.stereo = []
        self.stereoSub = rospy.Subscriber("front_end/stereo", StereoFrame, self.stereoFrameReceived)
        self.tracksSub = rospy.Subscriber("front_end_window/FrameTracks", FrameTracks, self.tracksReceived)
        self.wait=False
        self.display=imageManager(displayNames)
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
        for i in range(55):
            self.wait=True
            self.publishSrv(next)
            while(self.wait):
                time.sleep(0.05)
        print("completed")
    def stereoFrameReceived(self,message):
        if("left" in self.display.namesList):
            Mat = copy.deepcopy(cv2.cvtColor(self.display.limg,cv2.COLOR_GRAY2RGB))
            for index in message.matches:
                cv2.circle(Mat, (int(index.leftFeature.imageCoord.x), int(index.leftFeature.imageCoord.y)), 2,(255, 50, 0), -1)
            qImg = QImage(Mat.data, Mat.shape[1], Mat.shape[0], 3 * Mat.shape[1], QImage.Format_RGB888)
            self.display.updateImage("left",qImg)
        if("right" in self.display.namesList):
            Mat = copy.deepcopy(cv2.cvtColor(self.display.rimg, cv2.COLOR_GRAY2RGB))
            for index in message.matches:
                cv2.circle(Mat, (int(index.rightFeature.imageCoord.x), int(index.rightFeature.imageCoord.y)), 2,(255, 50, 0), -1)
            qImg = QImage(Mat.data, Mat.shape[1], Mat.shape[0], 3 * Mat.shape[1], QImage.Format_RGB888)
            self.display.updateImage("right",qImg)
        print("nLeft",message.nLeft.data)
        self.stereo.append(message)
        if(len(self.stereo)>2):
            self.stereo.pop(0)
    def tracksReceived(self,message):
        if((len(self.stereo)>1)and("Tracks" in self.display.namesList)):
            drawnImage = copy.deepcopy(cv2.cvtColor(self.display.limg,cv2.COLOR_GRAY2RGB))
            for n in range(len(message.currentFrameIndexes)):
                pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.x)
                pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.y)
                prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.x)
                prey = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.y)
                cv2.circle(drawnImage, (pcx, pcy), 2, (0, 255, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
                cv2.line(drawnImage, (prex, prey), (pcx, pcy), (255, 255, 0, 200), 1)
                cv2.circle(drawnImage, (prex, prey), 2, (255, 0, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
            qImg = QImage(drawnImage.data, drawnImage.shape[1], drawnImage.shape[0], 3 * drawnImage.shape[1],QImage.Format_RGB888)
            self.display.updateImage("Tracks",qImg)
        self.wait=False






if __name__ == '__main__':
    global app
    rospy.init_node('stereoSimulation')
    app = QApplication(sys.argv)
    manager=StereoManager(["Tracks"])
    workerThread=Thread(target=manager.runSimulation)
    workerThread.daemon=True
    workerThread.start()

    sys.exit(app.exec_())