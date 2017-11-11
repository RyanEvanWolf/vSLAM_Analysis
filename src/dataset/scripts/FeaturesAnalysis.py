import rospy
import sys
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
#post processing imports
import statistics
import matplotlib.pyplot as plt
import matplotlib.style as sty


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
    threshVect=np.arange(5, 15, 5)
    typeVect=[cv2.FAST_FEATURE_DETECTOR_TYPE_5_8]
    SupprVect=[True]
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
    nFeatures=10000
    octave=np.arange(2, 5, 1)
    contrast=np.linspace(0.001, 0.5, 2, endpoint=True)
    edge=np.linspace(1, 30, 2, endpoint=True)
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
    def __init__(self,Dataset,detectorName):
        self.DataSetRoot= Dataset
        self.display=True
        print(self.DataSetRoot)
        rospy.set_param("/bumbledataset/rootDirectory", self.DataSetRoot)
        pubFolder = rospy.Publisher("dataset/root", String, latch=True, queue_size=10)
        pubFolder.publish(self.DataSetRoot)
        time.sleep(0.2)  ##waitfor server to setup
        self.dataNode = bumbleDataSetNode()
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
            print(self.dataNode.data.getStatusString() + "--" + self.dataNode.data.getCurrentDir())
            currentDetector=0
            singleFrame=FrameFeatures()
            for detectorSettings in settings:
                print("["+str(currentDetector)+"/"+str(len(settings))+"]")
                defaultMessage.config=detectorSettings
                defaultMessage.imageDir.data=self.dataNode.data.getCurrentDir()
                reply=self.extract(defaultMessage)
                print(reply)
                currentDetector+=1
                if(self.display):
                    img = cv2.imread(reply.leftFoundDir.data, cv2.IMREAD_COLOR)
                    cv2.imshow('Features', img)
                    cv2.waitKey(1)
                singleFrame.messages.append(defaultMessage)
                singleFrame.responses.append(reply)
            output.frames.append(singleFrame)
            ##increment
            next=nextFrameRequest()
            next.Forward.data=True
            response=self.dataNode.updateFrame(next)
            if(response.Status.data=="End"):
                endSeq=True
            if(ind<2):
                ind+=1
            else:
                endSeq = True
        return output

class FrameFeatures:
    def __init__(self):
        self.messages=[]
        self.responses=[]
    def getSD(self):
        ##get standard deviation of left features
        l = []
        for i in self.responses:
            l.append(i.nleft.data)
        if(len(l)>2):
            return statistics.stdev(l)
        else:
            return 0
    def getMean(self):
        ##get average
        l = []
        for i in self.responses:
            l.append(i.nleft.data)
        return statistics.mean(l)
    def getMin(self):
        ##get standard deviation both inliers, left, and right
        l = []
        for i in self.responses:
            l.append(i.nleft.data)
        return min(l)
    def getMax(self):
        ##get standard deviation both inliers, left, and right
        l = []
        for i in self.responses:
            l.append(i.nleft.data)
        return max(l)

class DataSetFeatures:
    def __init__(self):
        self.frames = []
        sty.use("seaborn")
    def drawGraph(self):
        fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
        x = np.arange(0, len(self.frames), 1)
        # get stereo numbers
        inlierMax = []
        inlierMin = []
        inlierTopDev = []
        inlierMinDev = []
        inlierMed = []
        # get left numbers
        leftMax = []
        leftMin = []
        leftTopDev = []
        leftMinDev = []
        leftMed = []
        for i in self.frames:
                leftMax.append(i.getMax())
                leftMin.append(i.getMin())
                leftMed.append(i.getMean())
                leftTopDev.append(i.getMean() + i.getSD())
                leftMinDev.append(i.getMean() - i.getSD())
                inlierMax.append(i.getMax())
                inlierMin.append(i.getMin())
                inlierMed.append(i.getMean())
                inlierTopDev.append(i.getMean() + i.getSD())
                inlierMinDev.append(i.getMean() - i.getSD())
        ax1.fill_between(x, leftMax, leftMin, color='black', alpha=0.2, linewidth=0.0)
        ax1.fill_between(x, leftTopDev, leftMinDev, color='darkblue', alpha=0.2, linewidth=0.0)
        ax1.plot(x, leftMed,mew=0.1,marker='o', color='black')
        ax2.fill_between(x, inlierMax, inlierMin, color='black', alpha=0.2, linewidth=0.0)
        ax2.fill_between(x, inlierTopDev, inlierMinDev, color='darkblue', alpha=0.2, linewidth=0.0)
        ax2.plot(x, inlierMed, color='black')
        plt.show()

    # class FrameFeatures:
    #     def __init__(self):
    #         self.settingsMessages = []
    #         self.responses = []
    #         self.imageName = []
    #         self.imageFileName = []
    #
    #     def getOrbParameters(self):
    #         ORB_Messages = []
    #         scaleVect = [0.8]  # np.linspace(0.8, 1.2, 1, endpoint=True)
    #         edgeVect = [10, 20]  # np.arange(10, 30, 20)
    #         levelVect = [2]  # np.arange(2, 4, 2)
    #         wtaVect = [2]  # np.arange(2, 4, 2)
    #         scoreVect = [cv2.ORB_HARRIS_SCORE]  # [cv2.ORB_HARRIS_SCORE, cv2.ORB_FAST_SCORE]
    #         patchVect = [10]  # np.arange(10, 25, 15)
    #         for sc in scaleVect:
    #             for scor in scoreVect:
    #                 for l in levelVect:
    #                     for wt in wtaVect:
    #                         for ed in edgeVect:
    #                             for pat in patchVect:
    #                                 newSettings = updateSettingsRequest()
    #                                 newSettings.newSett.orbConfig.scale.data = sc
    #                                 newSettings.newSett.orbConfig.edge.data = ed
    #                                 newSettings.newSett.orbConfig.level.data = l
    #                                 newSettings.newSett.orbConfig.wta.data = wt
    #                                 newSettings.newSett.orbConfig.score.data = scor
    #                                 newSettings.newSett.orbConfig.patch.data = pat
    #                                 newSettings.newSett.ExtractorName.data = "ORB"
    #                                 ORB_Messages.append(newSettings)
    #         return ORB_Messages
    #
    #     def getFastParameters(self):
    #         print("a")
    #
    #     def getSD(self):
    #         ##get standard deviation both inliers, left, and right
    #         inli = []
    #         l = []
    #         r = []
    #         for i in self.responses:
    #             l.append(i.nleft.data)
    #             r.append(i.nright.data)
    #             inli.append(i.nInliers.data)
    #         return [statistics.stdev(l), statistics.stdev(r), statistics.stdev(inli)]
    #
    #     def getMean(self):
    #         ##get standard deviation both inliers, left, and right
    #         inli = []
    #         l = []
    #         r = []
    #         for i in self.responses:
    #             l.append(i.nleft.data)
    #             r.append(i.nright.data)
    #             inli.append(i.nInliers.data)
    #         return [statistics.mean(l), statistics.mean(r), statistics.mean(inli)]
    #
    #     def getMin(self):
    #         ##get standard deviation both inliers, left, and right
    #         inli = []
    #         l = []
    #         r = []
    #         for i in self.responses:
    #             l.append(i.nleft.data)
    #             r.append(i.nright.data)
    #             inli.append(i.nInliers.data)
    #         return [min(l), min(r), min(inli)]
    #
    #     def getMax(self):
    #         ##get standard deviation both inliers, left, and right
    #         inli = []
    #         l = []
    #         r = []
    #         for i in self.responses:
    #             l.append(i.nleft.data)
    #             r.append(i.nright.data)
    #             inli.append(i.nInliers.data)
    #         return [max(l), max(r), max(inli)]
    #
    #     def getAsList(self):
    #         print("a")
    #
    # class DataSetFeatures:
    #     def __init__(self):
    #         self.Detector = "ORB"
    #         self.Descriptor = "ORB"
    #         self.frames = []
    #         sty.use("seaborn")
    #
    #     def drawGraph(self):
    #         fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
    #         x = np.arange(0, len(self.frames), 1)
    #         # get stereo numbers
    #         inlierMax = []
    #         inlierMin = []
    #         inlierTopDev = []
    #         inlierMinDev = []
    #         inlierMed = []
    #         # get left numbers
    #         leftMax = []
    #         leftMin = []
    #         leftTopDev = []
    #         leftMinDev = []
    #         leftMed = []
    #         for i in self.frames:
    #             leftMax.append(i.getMax()[0])
    #             leftMin.append(i.getMin()[0])
    #             leftMed.append(i.getMean()[0])
    #             leftTopDev.append(i.getMean()[0] + i.getSD()[0])
    #             leftMinDev.append(i.getMean()[0] - i.getSD()[0])
    #             inlierMax.append(i.getMax()[2])
    #             inlierMin.append(i.getMin()[2])
    #             inlierMed.append(i.getMean()[2])
    #             inlierTopDev.append(i.getMean()[2] + i.getSD()[2])
    #             inlierMinDev.append(i.getMean()[2] - i.getSD()[2])
    #         ax1.fill_between(x, leftMax, leftMin, color='black', alpha=0.2, linewidth=0.0)
    #         ax1.fill_between(x, leftTopDev, leftMinDev, color='darkblue', alpha=0.2, linewidth=0.0)
    #         ax1.plot(x, leftMed, color='black')
    #         ax2.fill_between(x, inlierMax, inlierMin, color='black', alpha=0.2, linewidth=0.0)
    #         ax2.fill_between(x, inlierTopDev, inlierMinDev, color='darkblue', alpha=0.2, linewidth=0.0)
    #         ax2.plot(x, inlierMed, color='black')
    #         plt.show()
