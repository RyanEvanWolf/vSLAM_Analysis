import rospy
import os
import time
##ros general imports
from std_msgs.msg import Int32, Bool, Int8, Float64,String
##dataset settings
from dataset.srv import nextFrame, nextFrameResponse, nextFrameRequest

##camera settings
from dataset.srv import rectifiedSettings,rectifiedSettingsResponse,rectifiedSettingsRequest

##detector services
from dataset.srv import extractFAST, extractFASTResponse,extractFASTRequest
from dataset.srv import extractSIFT,extractSIFTResponse,extractSIFTRequest
from dataset.msg import ORB, FAST, SIFT


import numpy as np
import cv2
import copy
#post processing imports
import statistics
import matplotlib.pyplot as plt
import matplotlib.style as sty


import datetime


def getOrbParameters():
    ORB_Messages = []
    scaleVect = [0.8]  # np.linspace(0.8, 1.2, 1, endpoint=True)
    edgeVect = [10, 20]  # np.arange(10, 30, 20)
    levelVect = [2]  # np.arange(2, 4, 2)
    wtaVect = [2]  # np.arange(2, 4, 2)
    scoreVect = [cv2.ORB_HARRIS_SCORE]  # [cv2.ORB_HARRIS_SCORE, cv2.ORB_FAST_SCORE]
    patchVect = [10]  # np.arange(10, 25, 15)
    for sc in scaleVect:
        for scor in scoreVect:
            for l in levelVect:
                for wt in wtaVect:
                    for ed in edgeVect:
                        for pat in patchVect:
                            newSettings = ORB()
                            newSettings.orbConfig.scale.data = sc
                            newSettings.orbConfig.edge.data = ed
                            newSettings.orbConfig.level.data = l
                            newSettings.orbConfig.wta.data = wt
                            newSettings.orbConfig.score.data = scor
                            newSettings.orbConfig.patch.data = pat
                            ORB_Messages.append(newSettings)
    return ORB_Messages


def getFastParameters():
    FAST_Messages=[]
    threshVect=np.arange(4, 8, 2)
    typeVect=[cv2.FAST_FEATURE_DETECTOR_TYPE_5_8, cv2.FAST_FEATURE_DETECTOR_TYPE_7_12, cv2.FAST_FEATURE_DETECTOR_TYPE_9_16]
    SupprVect=[True]#, False]
    for s in SupprVect:
        for ty in typeVect:
            for th in threshVect:
                fastSettings=FAST()
                fastSettings.type.data=ty
                fastSettings.thresh.data=th
                fastSettings.suppression.data=s
                FAST_Messages.append(fastSettings)
    return FAST_Messages

def getSIFTParameters():
    SIFT_Messages=[]
    nFeatures=40000
    octave=np.arange(2, 3, 1)
    contrast=np.linspace(0.001, 0.5, 2, endpoint=True)
    edge=np.linspace(1, 4, 2, endpoint=True)
    sigma=np.linspace(1, 2, 2, endpoint=True)
    for o in octave:
        for c in contrast:
            for e in edge:
                for s in sigma:
                    SIFTsettings=SIFT()
                    SIFTsettings.maxFeatures.data=nFeatures
                    SIFTsettings.nOctave.data=o
                    SIFTsettings.contrastThresh.data=c
                    SIFTsettings.edgeThresh.data=e
                    SIFTsettings.sigma.data=s
                    SIFT_Messages.append(SIFTsettings)
    return SIFT_Messages



from bumbleDataSet import bumbleDataSetNode

class FeaturesAnalysis:
    def __init__(self,Dataset,detectorName,display=True):
        self.outRootDirectory=rospy.get_param("/outputDirectory")
        print(self.outRootDirectory)
        self.startTime=time.strftime('%d_%m_%H_%M_%S')
        self.DataSetRoot= Dataset
        self.display=display
        print(self.DataSetRoot)
        rospy.set_param("/bumbledataset/rootDirectory", self.DataSetRoot)
        pubFolder = rospy.Publisher("dataset/root", String, latch=True, queue_size=10)
        pubFolder.publish(self.DataSetRoot)
        time.sleep(0.2)  ##waitfor server to setup
        self.dataNode = bumbleDataSetNode()
        self.dataSetName=Dataset[Dataset.rfind("/")+1:len(Dataset)]
        print(self.dataSetName)
        self.detType=detectorName
        self.extractServiceName="/extract/"+self.detType
        try:
            rospy.wait_for_service("/extract/rectified", 4)
            print("Connected to extract/rectified")
            self.extractRectification = rospy.ServiceProxy("/extract/rectified", rectifiedSettings)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        try:
            rospy.wait_for_service(self.extractServiceName, 4)
            print("Connected to "+self.extractServiceName)
            if(self.detType=="FAST"):
                self.extract= rospy.ServiceProxy(self.extractServiceName, extractFAST)
            elif(self.detType=="SIFT"):
                self.extract = rospy.ServiceProxy(self.extractServiceName, extractSIFT)
        except rospy.ServiceException as exc:
            print("Service did not process request: " + str(exc))
        ##set xml File
        rectFile = rectifiedSettingsRequest()
        rectFile.RectifiedXMLdir.data = "/home/ryan/git/Output/Calibration/stereo_ParameterFour.xml"
        self.extractRectification(rectFile)
        print("setXMl Rectification Parameters")
        ##create output Directories
        if not os.path.exists(self.getFullDir()):
            os.makedirs(self.getFullDir())
    def getFullDir(self):
        return self.outRootDirectory+"/"+self.dataSetName+"/"+self.startTime+"_"+self.detType
    def AnalyzeDataSet(self):
        output=DataSetFeatures()
        if(self.detType=="FAST"):
            settings=getFastParameters()
            defaultMessage=extractFASTRequest()
        elif(self.detType=="SIFT"):
            settings=getSIFTParameters()
            defaultMessage=extractSIFTRequest()
        endSeq = False
        ind=0
        while(not endSeq):
            ##analyze a single image
            currentDetector=0
            singleFrame=FrameFeatures()
            for detectorSettings in settings:
                outputImageName=self.outRootDirectory+"/tempExtractImage.png"
                print("["+str(currentDetector)+"/"+str(len(settings)-1)+"]"+self.dataNode.data.getStatusString() + "--" + self.dataNode.data.getCurrentDir())
                defaultMessage.config=detectorSettings
                defaultMessage.imageDir.data=self.dataNode.data.getCurrentDir()
                if(self.display):
                    defaultMessage.outputDir.data=outputImageName
                else:
                    defaultMessage.outputDir.data=""
                t=copy.deepcopy(defaultMessage)
                singleFrame.messages.append(t)##need a deep copy for some reason
                reply=self.extract(defaultMessage)
                if(self.display):
                    img = cv2.imread(outputImageName, cv2.IMREAD_COLOR)
                    cv2.imshow('Features', img)
                    cv2.waitKey(1)
                    print(t)
                singleFrame.responses.append(reply)
                currentDetector += 1
            ###draw and save the images for the [min,avg,stdDev1,and max]
            statsIndexes=[singleFrame.getMinIndex(),singleFrame.getMedianIndex(),singleFrame.getMedianPlusSdIndex(),singleFrame.getMaxIndex()]
            print(singleFrame.getAsList()[0])
            print(statsIndexes)
            statsCount=0
            for i in statsIndexes:
                displayMessage=copy.deepcopy(singleFrame.messages[i])
                displayMessage.outputDir.data=outputImageName
                self.extract(displayMessage)
                img = cv2.imread(outputImageName, cv2.IMREAD_COLOR)
                imageFileName = self.getFullDir() + "/" + str(ind) + "_" + str(statsCount) + ".ppm"
                cv2.imwrite(imageFileName, img)
                singleFrame.imageDir.append(imageFileName)
                statsCount+=1
            ##append to list and increment
            extra=copy.deepcopy(singleFrame)##deep copy to double check the data is %100 passed onto the dataset without loss of information
            output.frames.append(extra)
            next=nextFrameRequest()
            next.Forward.data=True
            response=self.dataNode.updateFrame(next)
            if(response.Status.data=="End"):
                endSeq=True
            ind+=1
        return output

class FrameFeatures:
    def __init__(self):
        self.messages=[]
        self.responses=[]
        self.imageDir=[]
    def getSD(self,listindex):
        ##get standard deviation of left features
        if(len(self.getAsList()[listindex])>2):
            return statistics.stdev(self.getAsList()[listindex])
        else:
            return 0
    def getMean(self,listindex):
        return statistics.mean(self.getAsList()[listindex])
    def getMin(self,listindex):
        return min(self.getAsList()[listindex])
    def getMax(self,listindex):
        return max(self.getAsList()[listindex])
    def getAsList(self):
        listTimes=[]
        listnFeatures=[]
        for i in self.responses:
            listTimes.append(i.averageTime.data)
            listnFeatures.append(i.nleft.data)
        return [listnFeatures,listTimes]
    def getMaxIndex(self):
        return np.abs(np.array(self.getAsList()[0])-self.getMax(0)).argmin()
    def getMinIndex(self):
        return np.abs(np.array(self.getAsList()[0]) - self.getMin(0)).argmin()
    def getMedianIndex(self):
        return np.abs(np.array(self.getAsList()[0])-self.getMean(0)).argmin()
    def getMedianPlusSdIndex(self):
        return np.abs(np.array(self.getAsList()[0]) -(self.getMean(0)+ self.getSD(0))).argmin()


def drawGraph(inDataSetFeatures):
    sty.use("seaborn")
    fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
    x = np.arange(0, len(inDataSetFeatures.frames), 1)
    # get left numbers
    leftMax = []
    leftMin = []
    leftTopDev = []
    leftMinDev = []
    leftMed = []
    timMax=[]

    timMin=[]
    timTopDev=[]
    timMinDev=[]
    timMed=[]
    LeftListIndex=0
    TimeListIndex=1
    for i in inDataSetFeatures.frames:
        leftMax.append(i.getMax(LeftListIndex))
        leftMin.append(i.getMin(LeftListIndex))
        leftMed.append(i.getMean(LeftListIndex))
        leftTopDev.append(i.getMean(LeftListIndex) + i.getSD(LeftListIndex))
        leftMinDev.append(i.getMean(LeftListIndex) - i.getSD(LeftListIndex))
        timMax.append(i.getMax(TimeListIndex))
        timMin.append(i.getMin(TimeListIndex))
        timMed.append(i.getMean(TimeListIndex))
        timTopDev.append(i.getMean(TimeListIndex) + i.getSD(TimeListIndex))
        timMinDev.append(i.getMean(TimeListIndex) - i.getSD(TimeListIndex))
    ax1.fill_between(x, leftMax, leftMin, color='black', alpha=0.5, linewidth=0.0)
    ax1.fill_between(x, leftTopDev, leftMinDev, color='darkred', alpha=0.2, linewidth=0.0)
    ax1.plot(x, leftMed, mew=0.1, marker='o', color='black')
    ax1.set_ylim(ymin=0.0)
    ax1.set_ylabel("Number of features")

    ax2.fill_between(x, timMax, timMin, color='black', alpha=0.2, linewidth=0.0)
    ax2.fill_between(x, timTopDev, timMinDev, color='darkblue', alpha=0.2, linewidth=0.0)
    ax2.plot(x, timMed, mew=0.1, marker='o', color='black')
    ax2.set_ylim(ymin=0.0)
    ax2.set_ylabel("Processing Time")
    plt.show()


class DataSetFeatures:
    def __init__(self):
        self.frames = []
        sty.use("seaborn")

