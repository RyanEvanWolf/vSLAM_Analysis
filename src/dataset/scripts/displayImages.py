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




from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel,QMainWindow
from PyQt5.QtGui import QPixmap, QPainter, QImage
#
# class TrackingDisplay(imageWindow):
#     def __init__(self,imageSub):
#         imageWindow.__init__(self, imageSub)
#         self.StereoSub = rospy.Subscriber("/front_end/stereo", StereoFrame, self.Stereo)
#         self.onPubDraw = rospy.Subscriber("/front_end/stereo", StereoFrame, self.feedback)
#         self.setWindowTitle("/front_end/stereo")
#         self.updatedPub = rospy.Publisher("/front_end/stereo/updated", Bool, queue_size=5)
#
#         self.stereo=[]
#         self.Tracks=[]
#         self.left=leftPoints
#         self.frame=imageFrame()
#         lay = QVBoxLayout(self)
#
#         lay.addWidget(self.frame)
#
#         self.imgSub = rospy.Subscriber(imageTopic, Image, self.updateImg)
#         self.stereoSub= rospy.Subscriber(stereoTopic, StereoFrame, self.updateStereo)
#         self.trackSub=rospy.Subscriber(TrackTopic,FrameTracks,self.updateMessage)
#     def updateImg(self,message):
#         self.img = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
#         self.img=cv2.cvtColor(self.img,cv2.COLOR_GRAY2RGB)
#     def updateStereo(self,message):
#         self.stereo.append(copy.deepcopy(message))
#         if(len(self.stereo)>2):
#             self.stereo.pop(0)
#     def updateMessage(self,message):
#         drawnImage = copy.deepcopy(self.img)
#         for n in range(len(message.currentFrameIndexes)):
#             if(self.left):
#                 pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.x)
#                 pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.y)
#                 prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.x)
#                 prey = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.y)
#             else:
#                 pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].rightFeature.imageCoord.x)
#                 pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].rightFeature.imageCoord.y)
#                 prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].rightFeature.imageCoord.x)
#                 prey=int(self.stereo[0].matches[message.previousFrameIndexes[n].data].rightFeature.imageCoord.y)
#             cv2.circle(drawnImage, (pcx, pcy), 2, (0, 255, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
#             cv2.circle(drawnImage, (prex, prey), 2, (255, 0, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
#             cv2.line(drawnImage, (prex, prey), (pcx, pcy), (255, 255, 0, 200), 1)
#         qImg = QImage(drawnImage.data, drawnImage.shape[1], drawnImage.shape[0], 3 * drawnImage.shape[1], QImage.Format_RGB888)
#         self.frame.p=QPixmap(qImg)
#         self.update()
#         rospy.set_param(self.trackTopic+"/drawn",True)



class imageWindow(QWidget):
    def __init__(self, imgSub, parent=None):
        QWidget.__init__(self, parent=parent)
        self.imagesRef=imgSub
        self.resize(500,500)
        self.frame = imageFrame()
        lay = QVBoxLayout(self)
        lay.addWidget(self.frame)
        self.show()
    def redraw(self,q_image):
        self.frame.p=QPixmap(q_image)
        self.update()


class TrackingViewer(imageWindow):
    def __init__(self, imageSub):
        imageWindow.__init__(self, imageSub)
        self.onPubDraw = rospy.Subscriber("front_end_window/State", Window, self.feedback)
        self.setWindowTitle("front_end_window/State")
        self.updatedPub = rospy.Publisher("front_end_window/State/updated", Bool, queue_size=5)
    def feedback(self,message):
        print("windowFrame",len(message.frames))
        print("INterFrame",len(message.tracks))
        print("currentFeatures",len(message.frames[-1].inliers))
        if(len(message.tracks)>=1):
            print("prevFeatures", len(message.frames[-2].inliers))
            drawnImage = copy.deepcopy(self.imagesRef.limg)
            drawnImage = cv2.cvtColor(drawnImage,cv2.COLOR_GRAY2RGB)
            latestInterFrame=message.tracks[-1]
            print(len(latestInterFrame.currentInlierIndexes))
            inl=0
            outl=0
            for n in range(len(latestInterFrame.currentInlierIndexes)):
                px=int(message.frames[-1].inliers[latestInterFrame.currentInlierIndexes[n]].stereo.leftFeature.imageCoord.x)
                py=int(message.frames[-1].inliers[latestInterFrame.currentInlierIndexes[n]].stereo.leftFeature.imageCoord.y)
                prex=int(message.frames[-2].inliers[latestInterFrame.previousInlierIndexes[n]].stereo.leftFeature.imageCoord.x)
                prey=int(message.frames[-2].inliers[latestInterFrame.previousInlierIndexes[n]].stereo.leftFeature.imageCoord.y)
                cv2.circle(drawnImage, (px, py), 2, (0, 200, 0,255), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
                cv2.circle(drawnImage, (prex, prey), 2, (0, 150, 0,255), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
                cv2.line(drawnImage, (prex, prey), (px, py), (255, 255, 0, 200), 1)
                if(latestInterFrame.motionInlierMask[n]):
                    cv2.circle(drawnImage, (px, py), 2, (255, 0, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
                    cv2.circle(drawnImage, (prex, prey), 2, (255, 0, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
                    cv2.line(drawnImage, (prex, prey), (px, py), (255, 0, 0), 1)
                    outl=outl+1
                else:
                    inl=inl+1

            qImg = QImage(drawnImage.data, drawnImage.shape[1],drawnImage.shape[0], 3 *drawnImage.shape[1],
                          QImage.Format_RGB888)
            self.redraw(QPixmap(qImg))
            print(message.tracks[-1].R)
            print(message.tracks[-1].T)
            print("InlierPercentage",100*inl/float(inl+outl))
        #         for n in range(len(message.currentFrameIndexes)):
        #             if(self.left):
        #                 pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.x)
        #                 pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].leftFeature.imageCoord.y)
        #                 prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.x)
        #                 prey = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].leftFeature.imageCoord.y)
        #             else:
        #                 pcx = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].rightFeature.imageCoord.x)
        #                 pcy = int(self.stereo[1].matches[message.currentFrameIndexes[n].data].rightFeature.imageCoord.y)
        #                 prex = int(self.stereo[0].matches[message.previousFrameIndexes[n].data].rightFeature.imageCoord.x)
        #                 prey=int(self.stereo[0].matches[message.previousFrameIndexes[n].data].rightFeature.imageCoord.y)
        #             cv2.circle(drawnImage, (pcx, pcy), 2, (0, 255, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
        #             cv2.circle(drawnImage, (prex, prey), 2, (255, 0, 0), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
        #             cv2.line(drawnImage, (prex, prey), (pcx, pcy), (255, 255, 0, 200), 1)
        #         qImg = QImage(drawnImage.data, drawnImage.shape[1], drawnImage.shape[0], 3 * drawnImage.shape[1], QImage.Format_RGB888)
        #         self.frame.p=QPixmap(qImg)
        #         self.update()
        #         rospy.set_param(self.trackTopic+"/drawn",True)
        msg=Bool()
        self.updatedPub.publish(msg)
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

class StereoViewer(imageWindow):
    def __init__(self,imageSub):
        imageWindow.__init__(self,imageSub)
        self.onPubDraw = rospy.Subscriber("/front_end/stereo", StereoFrame, self.feedback)
        self.setWindowTitle("/front_end/stereo")
        self.updatedPub = rospy.Publisher("/front_end/stereo/updated", Bool, queue_size=5)
    def feedback(self,message):
        combinedImage = np.concatenate((self.imagesRef.limg, self.imagesRef.rimg), axis=1)
        combinedImage = cv2.cvtColor(combinedImage, cv2.COLOR_GRAY2RGB)
        for index in message.matches:
            rightPoint_x = index.rightFeature.imageCoord.x + 1024  ##offset is size of left image width
            ##draw onto image
            cv2.circle(combinedImage, (int(rightPoint_x), int(index.rightFeature.imageCoord.y)), 2, (255, 50, 0), -1)
            cv2.circle(combinedImage, (int(index.leftFeature.imageCoord.x), int(index.leftFeature.imageCoord.y)), 2,
                       (0, 0, 255), -1)
            cv2.line(combinedImage, (int(index.leftFeature.imageCoord.x), int(index.leftFeature.imageCoord.y)),
                     (int(rightPoint_x), int(index.rightFeature.imageCoord.y)),
                     (100, 255, 100, 255), 1)
        qImg = QImage(combinedImage.data, combinedImage.shape[1], combinedImage.shape[0], 3 * combinedImage.shape[1],
                      QImage.Format_RGB888)
        self.redraw(QPixmap(qImg))
        msg=Bool()
        self.updatedPub.publish(msg)


class imageSubscriber():
    def __init__(self):
        self.cvb = CvBridge()
        self.Lroitopic = "/bumblebee/leftROI"
        self.Rroitopic = "/bumblebee/rightROI"
        self.Ltopic = "/bumblebee/leftRectified"
        self.Rtopic = "/bumblebee/rightRectified"
        self.lroSub = rospy.Subscriber(self.Lroitopic, Image, self.updatelr)
        self.rroSub = rospy.Subscriber(self.Rroitopic, Image, self.updaterr)
        self.lSub = rospy.Subscriber(self.Ltopic, Image, self.updatel)
        self.rSub = rospy.Subscriber(self.Rtopic, Image, self.updater)
        self.limg = None
        self.rimg = None
        self.lroiimg = None
        self.rroiimg = None
    def updatel(self, message):
        self.limg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def updater(self, message):
        self.rimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def updatelr(self, message):
        self.lroiimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
    def updaterr(self, message):
        self.rroiimg = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))


if __name__ == '__main__':
    print("main")
    rospy.init_node('display')
    print(sys.argv)
    #rospy.set_param("waitTopicName","/front_end/stereo/drawn")
    app = QApplication(sys.argv)
    a=imageSubscriber()
    #b=imageWindow()
    #l=StereoViewer(a)
    r=TrackingViewer(a)
    #l222 = StereoViewer("/front_end/stereo", StereoFrame, a)
    #b=singleImageViewer()
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
    sys.exit(app.exec_())


