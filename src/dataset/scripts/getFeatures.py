#!/usr/bin/env python
from dataset.srv import resetDataset,resetDatasetResponse,resetDatasetRequest
from dataset.srv import getDatasetInfo,getDatasetInfoResponse,getDatasetInfoRequest
from dataset.srv import publishImage,publishImageResponse,publishImageRequest
from FeaturesAnalysis import getOrbParameters

import time
from drawingFunctions import ImageThread
from sensor_msgs.msg import Image
import rospy
import cv2
from cv_bridge import CvBridge
import copy
import sys
import os
import datetime
import pickle
import numpy as np
import statistics

defaultSaveOutput="/media/ryan/Markov/DetectorOutput"
class frameFeatures():
    def __init__(self):
        self.nFound=[]
        self.avgTime=[]
        self.DataInfo=None
    def getStdDev(self):
        ##get standard deviation of left features
        nleftDev=None
        nTimeDev=None
        if(len(self.nFound)>2):
            nleftDev=statistics.stdev(self.nFound)
        else:
            nleftDev=0
        if(len(self.avgTime)>2):
            nTimeDev=statistics.stdev(self.avgTime)
        else:
            nTimeDev=0
        return [nleftDev,nTimeDev]


class datasetFeatures():
    def __init__(self):
        self.frames=[]
        self.settings=[]
    def getBestDetectorsSettings(self):
        # define best detectors settings as Max,0.9Max, 0.8Max,0.7Max,stdDev,Mean
        max = []
        max9 = []
        max8 = []
        max7 = []
        maxdev = []
        maxmean = []
        for frameIndex in self.frames:
            print("loading from ", frameIndex)
            currentFrame = pickle.load(open(frameIndex, "rb"))
            MaxInFrame=np.amax(currentFrame.nFound)
            stdDev=currentFrame.getStdDev()[0]##get the nfound stdDev
            mean=statistics.mean(currentFrame.nFound)
            dev_and_mean=mean+stdDev
            ###find indexes of best detectors
            maxIndex=np.abs(np.array(currentFrame.nFound)-MaxInFrame).argmin()
            max9Index = np.abs(np.array(currentFrame.nFound)-0.9*MaxInFrame).argmin()
            max8Index = np.abs(np.array(currentFrame.nFound)-0.8*MaxInFrame).argmin()
            max7Index = np.abs(np.array(currentFrame.nFound)-0.7*MaxInFrame).argmin()
            maxdevIndex=np.abs(np.array(currentFrame.nFound)-dev_and_mean).argmin()
            meanIndex=np.abs(np.array(currentFrame.nFound)-mean).argmin()
            ##store the settings in arrays

            max.append([self.settings[maxIndex], currentFrame.nFound[maxIndex],"maxFeatures"])
            max9.append([self.settings[max9Index], currentFrame.nFound[max9Index],"max9Features"])
            max8.append([self.settings[max8Index], currentFrame.nFound[max8Index],"max8Features"])
            max7.append([self.settings[max7Index], currentFrame.nFound[max7Index],"max7Features"])
            maxdev.append([self.settings[maxdevIndex], currentFrame.nFound[maxdevIndex],"devFeatures"])
            maxmean.append([self.settings[meanIndex], currentFrame.nFound[meanIndex],"meanFeatures"])
        return [max,max9,max8,max7,maxdev,maxmean]

class Analysis():
    def __init__(self,detectorName):
        self.DetectorName=detectorName
        try:
            rospy.wait_for_service("/dataset/publishImage", 4)
            print("Connected to /dataset/publishImage")
            self.publishSrv = rospy.ServiceProxy("/dataset/publishImage", publishImage)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        try:
            rospy.wait_for_service("/dataset/getDatasetInfo", 4)
            print("Connected to /dataset/getDatasetInfo")
            self.infoSrv = rospy.ServiceProxy("/dataset/getDatasetInfo", getDatasetInfo)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        try:
            rospy.wait_for_service("/dataset/resetDataset", 4)
            print("Connected to /dataset/resetDataset")
            self.resetSrv = rospy.ServiceProxy("/dataset/resetDataset", resetDataset)
            r = resetDatasetRequest()
            self.resetSrv(r)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        self.original = ImageThread("original")
        self.cvb = CvBridge()
        self.ROISub = rospy.Subscriber("b"
                                       "umblebee/leftROI", Image, self.update)
        self.settings=None
        self.latest=None
        self.wait=None
        self.averageCount=5
    def update(self,message):
        self.latest = copy.deepcopy(self.cvb.imgmsg_to_cv2(message))
        self.wait=False
    def getDataInfo(self):
        return self.infoSrv(getDatasetInfoRequest())
    def getFullOut(self):
        output=defaultSaveOutput
        output=output+"/"+self.getDataInfo().rootFolder.data.split("/")[-1]
        output=output+"/"+datetime.datetime.now().strftime("%d_%m_%H-%M-%S")+"-"+self.DetectorName
        return output



class OrbAnalysis(Analysis):
    def __init__(self,detectorName):
        Analysis.__init__(self,detectorName)
    def runTest(self):
        totalImages=45
        next = publishImageRequest()
        next.command.data = "Next"
        imagecount=0
        data=datasetFeatures()
        data.settings=copy.deepcopy(getOrbParameters())
        outputDirectory=self.getFullOut()
        if not os.path.exists(outputDirectory):
            os.makedirs(outputDirectory)
        frameOutputDir=outputDirectory+"/frames"
        if not os.path.exists(frameOutputDir):
            os.makedirs(frameOutputDir)
        time.sleep(2)
        for imageIndex in range(totalImages):
            ##load new ROI image from dataset
            self.wait=True
            self.publishSrv(next)
            while(self.wait):
                time.sleep(0.1)
            ###
            detectorCount=0
            currentFrame=frameFeatures()
            currentFrame.DataInfo=self.getDataInfo()
            for i in getOrbParameters():
                det = cv2.ORB_create(nfeatures=i.maxFeatures.data,
                                     scaleFactor=i.scale.data,
                                     nlevels=i.level.data,
                                     edgeThreshold=i.edge.data,
                                     firstLevel=0,
                                     WTA_K=i.wta.data,
                                     scoreType=i.score.data,
                                     patchSize=i.patch.data)
                average=0
                for i in range(self.averageCount):
                    tim1=time.clock()
                    kp = det.detect(self.latest, None)
                    tim2=time.clock()
                    average=average+(tim2-tim1)
                average=average/self.averageCount
                currentFrame.nFound.append(len(kp))
                currentFrame.avgTime.append(average)
                img2 = cv2.drawKeypoints(self.latest, kp, None, color=(0, 255, 0), flags=0)
                self.original.updateImage(img2)
                print("["+str(imagecount)+"]["+str(detectorCount) + "]/" + str(len(getOrbParameters())))
                detectorCount = detectorCount + 1
            fileName=frameOutputDir+"/"+str(imagecount)+"_frameData.p"
            pickle.dump(currentFrame,open(fileName, "wb"))
            data.frames.append(fileName)
            imagecount=imagecount+1
        fileName=outputDirectory+"/MetaData.p"
        pickle.dump(data, open(fileName, "wb"))
        print("saved meta data Object")
        print("generating detectorSettings files")
        answers=data.getBestDetectorsSettings()
        for summaryIndex in answers:
            r = resetDatasetRequest()
            self.resetSrv(r)
            print("data sequence Reset")
            imgcount=0
            ##make new folders
            dataSequenceFolder=outputDirectory+"/"+summaryIndex[0][2]
            print("saving to "+dataSequenceFolder)
            if not os.path.exists(dataSequenceFolder):
                os.makedirs(dataSequenceFolder)
            TrajectorySettings=[]
            for frameSummaryIndex in summaryIndex:
                #for each setting, get the next image
                self.wait = True
                self.publishSrv(next)
                while (self.wait):
                    time.sleep(0.1)
                TrajectorySettings.append(frameSummaryIndex[0])
                det = cv2.ORB_create(nfeatures=frameSummaryIndex[0].maxFeatures.data,
                                        scaleFactor=frameSummaryIndex[0].scale.data,
                                        nlevels=frameSummaryIndex[0].level.data,
                                        edgeThreshold=frameSummaryIndex[0].edge.data,
                                        firstLevel=0,
                                        WTA_K=frameSummaryIndex[0].wta.data,
                                        scoreType=frameSummaryIndex[0].score.data,
                                        patchSize=frameSummaryIndex[0].patch.data)
                kp = det.detect(self.latest, None)
                img2 = cv2.drawKeypoints(a.latest, kp, None, color=(20, 255, 10), flags=0)
                self.original.updateImage(img2)
                print(frameSummaryIndex[2]+"//"+str(imgcount))
                filename=dataSequenceFolder+"/img_"+str(imgcount)+".ppm"
                cv2.imwrite(filename,img2)
                imgcount=imgcount +1
            trajectoryName=outputDirectory+"/"+summaryIndex[0][2]+".p"
            print("save settings trajectory to " + trajectoryName)
            pickle.dump(TrajectorySettings, open(trajectoryName, "wb"))
if __name__ == '__main__':
    rospy.init_node('getFeatures')
    if(len(sys.argv)==1):
        print(sys.argv)
    elif(len(sys.argv==2)):
        print(2)
    a=OrbAnalysis("ORB")
    a.runTest()
    print("finished"+a.DetectorName)