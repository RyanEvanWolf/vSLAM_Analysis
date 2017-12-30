#!/usr/bin/env python
from sensor_msgs.msg import Image
import sys
import rospy
import cv2
from cv_bridge import CvBridge
import copy
import numpy as np
from threading import Thread,Lock

from dataset.srv import updateImage,updateImageRequest,updateImageResponse
from bumblebee.srv import getOffset,getOffsetRequest,getOffsetResponse

from front_end.msg import StereoFrame,FrameTracks
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
import time

import matplotlib.pyplot as plt
import matplotlib.animation as animation


from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel
from PyQt5.QtGui import QPixmap, QPainter, QImage

class imageManager():
    def __init__(self,namesList):
        self.n=0
        self.figuresList=[]
        self.namesList=[]
        ##subscribe to all available images
        self.cvb = CvBridge()
        self.Lroitopic = "/bumblebee/leftROI"
        self.Rroitopic = "/bumblebee/rightROI"
        self.Ltopic = "/bumblebee/leftRectified"
        self.Rtopic = "/bumblebee/rightRectified"
        self.lroSub = rospy.Subscriber(self.Lroitopic, Image, self.updatelr)
        self.rroSub = rospy.Subscriber(self.Rroitopic, Image, self.updaterr)
        self.lSub = rospy.Subscriber(self.Ltopic, Image, self.updatel)
        self.rSub = rospy.Subscriber(self.Rtopic, Image, self.updater)
        self.limg=None
        self.rimg=None
        self.lroiimg=None
        self.rroiimg=None
        for index in namesList:
            self.addwindow(index)
        print(len(self.figuresList))
    def addwindow(self,name):
        newFig = imageWindow()
        newFig.setWindowTitle(name)
        self.figuresList.append(newFig)
        self.namesList.append(name)
    def updateImage(self,name,qimg):
        if(name in self.namesList):
            index=self.namesList.index(name)
            self.figuresList[index].redraw(qimg)
    def updatel(self,message):
        self.limg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
        self.n=self.n +1
    def updater(self,message):
        self.rimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def updatelr(self,message):
        self.lroiimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def updaterr(self,message):
        self.rroiimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))



class imageWindow(QWidget):
    def __init__(self,parent=None):
        QWidget.__init__(self, parent=parent)
        self.resize(500,500)
        self.frame = imageFrame()
        lay = QVBoxLayout(self)
        lay.addWidget(self.frame)
        self.show()
    def redraw(self,q_image):
        self.frame.p=QPixmap(q_image)
        self.update()

class StereoDisplay(QWidget):
    def __init__(self,leftTopic,rightTopic,stereoTopic,parent=None):
        QWidget.__init__(self, parent=parent)
        self.resize(1024, 768)
        self.cvb = CvBridge()
        self.leftTopic = leftTopic
        self.rightTopic = rightTopic
        self.stereoTopic = stereoTopic
        self.limg=None
        self.rimg=None
        ##subscribers
        self.lRectSub = rospy.Subscriber(leftTopic, Image, self.updateLeft)
        self.rRectSub = rospy.Subscriber(rightTopic, Image, self.updateRight)
        self.stereoSub = rospy.Subscriber(stereoTopic,StereoFrame, self.draw)
        ##qt
        self.frame = imageFrame()
        lay = QVBoxLayout(self)
        lay.addWidget(self.frame)
    def updateLeft(self, message):
        self.limg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def updateRight(self, message):
        self.rimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def draw(self, message):
        combinedImage = np.concatenate((self.limg, self.rimg), axis=1)
        combinedImage=cv2.cvtColor(combinedImage, cv2.COLOR_GRAY2RGB)
        for index in message.matches:
            rightPoint_x = index.rightFeature.imageCoord.x +1024##offset is size of left image width
            ##draw onto image
            cv2.circle(combinedImage, (int(rightPoint_x), int(index.rightFeature.imageCoord.y)), 2, (255, 50, 0), -1)
            cv2.circle(combinedImage, (int(index.leftFeature.imageCoord.x), int(index.leftFeature.imageCoord.y)), 2, (0, 0, 255), -1)
            cv2.line(combinedImage, (int(index.leftFeature.imageCoord.x), int(index.leftFeature.imageCoord.y)), (int(rightPoint_x), int(index.rightFeature.imageCoord.y)),
                     (100, 255, 100,255), 1)
        qImg = QImage(combinedImage.data, combinedImage.shape[1], combinedImage.shape[0], 3 * combinedImage.shape[1], QImage.Format_RGB888)
        self.frame.p=QPixmap(qImg)
        self.update()


class TrackingDisplay(QWidget):
    def __init__(self,imageTopic,stereoTopic,TrackTopic,leftPoints=True,parent=None):
        QWidget.__init__(self, parent=parent)
        self.setWindowTitle(TrackTopic)
        self.resize(1024/2, 768/2)
        self.cvb = CvBridge()
        self.img=None
        self.imgTopic=imageTopic
        self.trackTopic=TrackTopic
        self.stereoTopic=stereoTopic
        self.stereo=[]
        self.Tracks=[]
        self.left=leftPoints
        self.frame=imageFrame()
        lay = QVBoxLayout(self)

        lay.addWidget(self.frame)

        self.imgSub = rospy.Subscriber(imageTopic, Image, self.updateImg)
        self.stereoSub= rospy.Subscriber(stereoTopic, StereoFrame, self.updateStereo)
        self.trackSub=rospy.Subscriber(TrackTopic,FrameTracks,self.updateMessage)
    def updateImg(self,message):
        self.img = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
        self.img=cv2.cvtColor(self.img,cv2.COLOR_GRAY2RGB)
    def updateStereo(self,message):
        self.stereo.append(copy.deepcopy(message))
        if(len(self.stereo)>2):
            self.stereo.pop(0)
    def updateMessage(self,message):
        drawnImage = copy.deepcopy(self.img)
        for n in range(len(message.currentFrameIndexes)):
            if(self.left):
                pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.x)
                pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.y)
                prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.x)
                prey = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.y)
            else:
                pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].rightFeature.imageCoord.x)
                pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].rightFeature.imageCoord.y)
                prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].rightFeature.imageCoord.x)
                prey=int(self.stereo[0].matches[message.previousFrameIndexes[n].data].rightFeature.imageCoord.y)
            cv2.circle(drawnImage, (pcx, pcy), 2, (0, 255, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
            cv2.circle(drawnImage, (prex, prey), 2, (255, 0, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
            cv2.line(drawnImage, (prex, prey), (pcx, pcy), (255, 255, 0, 200), 1)
        qImg = QImage(drawnImage.data, drawnImage.shape[1], drawnImage.shape[0], 3 * drawnImage.shape[1], QImage.Format_RGB888)
        self.frame.p=QPixmap(qImg)
        self.update()
        rospy.set_param(self.trackTopic+"/drawn",True)
class imageFrame(QWidget):
    def __init__(self, parent=None):
        QWidget.__init__(self, parent=parent)
        self.p = None
        self.show()
    def paintEvent(self, event):
        if self.p:
            painter = QPainter(self)
            painter.setRenderHint(QPainter.SmoothPixmapTransform)
            painter.drawPixmap(self.rect(), self.p)

class SingleImageDisplay(QWidget):
    def __init__(self, topicName,parent=None):
        QWidget.__init__(self, parent=parent)
        self.resize(1024, 768)
        self.cvb = CvBridge()
        self.topic = topicName
        self.Sub = rospy.Subscriber(topicName, Image, self.newImage)
        self.frame=imageFrame()
        lay = QVBoxLayout(self)
        lay.addWidget(self.frame)
    def newImage(self, message):
        Mat = copy.deepcopy(cv2.cvtColor(self.cvb.imgmsg_to_cv2(message), cv2.COLOR_GRAY2RGB))
        qImg = QImage(Mat.data, Mat.shape[1], Mat.shape[0], 3 * Mat.shape[1], QImage.Format_RGB888)
        self.frame.p=QPixmap(qImg)
        self.update()

class drawFeatures(QWidget):
    def __init__(self,imgTopic,featuresTopic,left=True,parent=None):
        QWidget.__init__(self, parent=parent)
        self.resize(1024/2, 768/2)
        self.cvb = CvBridge()
        self.topic = featuresTopic
        self.imgTopic=imgTopic
        self.img=None
        self.left=left
        self.Sub = rospy.Subscriber(self.imgTopic, Image, self.newImage)
        self.featSub=rospy.Subscriber(self.topic,StereoFrame,self.draw)
        self.frame = imageFrame()
        lay = QVBoxLayout(self)
        lay.addWidget(self.frame)
        self.nFeat=0
        self.show()
    def newImage(self,message):
        self.img = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
        self.img=cv2.cvtColor(self.img,cv2.COLOR_GRAY2RGB)
    def draw(self, message):
        Mat = copy.deepcopy(self.img)
        if(self.left):
            for index in message.matches:
                cv2.circle(Mat, (int(index.leftFeature.imageCoord.x), int(index.leftFeature.imageCoord.y)), 2, (255, 50, 0), -1)
        else:
            for index in message.matches:
                cv2.circle(Mat, (int(index.rightFeature.imageCoord.x), int(index.rightFeature.imageCoord.y)), 2,(255, 50, 0), -1)
        qImg = QImage(Mat.data, Mat.shape[1], Mat.shape[0], 3 * Mat.shape[1], QImage.Format_RGB888)
        self.frame.p = QPixmap(qImg)
        self.update()
        self.nFeat=self.nFeat+1
        print("images counted = ", self.nFeat)
        time.sleep(0.5)
        rospy.set_param(self.topic+"/drawn",True)


if __name__ == '__main__':
    print("main")
    #rospy.init_node('display')
    #rospy.set_param("waitTopicName","/front_end/stereo/drawn")
    #app = QApplication(sys.argv)
    #leftFeat=drawFeatures("/bumblebee/leftRectified","/front_end/stereo")

    #leftImage= SingleImageDisplay("/bumblebee/leftROI")
    #leftImage.show()
    #stereoMatches=StereoDisplay("/bumblebee/leftRectified","/bumblebee/rightRectified","/front_end/stereo")
    #stereoMatches.show()
    #track=TrackingDisplay("bumblebee/leftRectified","/front_end/stereo","front_end_window/FrameTracksleft")
    #track.show()
    #track2=TrackingDisplay("bumblebee/rightRectified","/front_end/stereo","front_end_window/FrameTracksright",False)
    #track2.show()
    #track3=TrackingDisplay("bumblebee/leftRectified","/front_end/stereo","front_end_window/FrameTracks")
    #track3.show()
#    sys.exit(app.exec_())


