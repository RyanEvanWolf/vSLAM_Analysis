from dataset.srv import updateSettings, updateSettingsResponse, updateSettingsRequest
import numpy as np
import cv2
import statistics
import matplotlib.pyplot as plt
import matplotlib.style as sty

class FrameFeatures:
    def __init__(self):
        self.settingsMessages=[]
        self.responses=[]
        self.imageName=[]
        self.imageFileName=[]
    def getOrbParameters(self):
        ORB_Messages=[]
        scaleVect = [0.8]#np.linspace(0.8, 1.2, 1, endpoint=True)
        edgeVect = [10,20]#np.arange(10, 30, 20)
        levelVect = [2]#np.arange(2, 4, 2)
        wtaVect = [2]#np.arange(2, 4, 2)
        scoreVect = [cv2.ORB_HARRIS_SCORE]#[cv2.ORB_HARRIS_SCORE, cv2.ORB_FAST_SCORE]
        patchVect = [10]#np.arange(10, 25, 15)
        for sc in scaleVect:
            for scor in scoreVect:
                for l in levelVect:
                    for wt in wtaVect:
                        for ed in edgeVect:
                            for pat in patchVect:
                                newSettings = updateSettingsRequest()
                                newSettings.newSett.orbConfig.scale.data = sc
                                newSettings.newSett.orbConfig.edge.data = ed
                                newSettings.newSett.orbConfig.level.data = l
                                newSettings.newSett.orbConfig.wta.data = wt
                                newSettings.newSett.orbConfig.score.data = scor
                                newSettings.newSett.orbConfig.patch.data = pat
                                newSettings.newSett.ExtractorName.data = "ORB"
                                ORB_Messages.append(newSettings)
        return ORB_Messages
    def getFastParameters(self):
        print("a")
    def getSD(self):
        ##get standard deviation both inliers, left, and right
        inli=[]
        l=[]
        r=[]
        for i in self.responses:
            l.append(i.nleft.data)
            r.append(i.nright.data)
            inli.append(i.nInliers.data)
        return [statistics.stdev(l),statistics.stdev(r),statistics.stdev(inli)]
    def getMean(self):
        ##get standard deviation both inliers, left, and right
        inli=[]
        l=[]
        r=[]
        for i in self.responses:
            l.append(i.nleft.data)
            r.append(i.nright.data)
            inli.append(i.nInliers.data)
        return [statistics.mean(l),statistics.mean(r),statistics.mean(inli)]
    def getMin(self):
        ##get standard deviation both inliers, left, and right
        inli=[]
        l=[]
        r=[]
        for i in self.responses:
            l.append(i.nleft.data)
            r.append(i.nright.data)
            inli.append(i.nInliers.data)
        return [min(l),min(r),min(inli)]
    def getMax(self):
        ##get standard deviation both inliers, left, and right
        inli=[]
        l=[]
        r=[]
        for i in self.responses:
            l.append(i.nleft.data)
            r.append(i.nright.data)
            inli.append(i.nInliers.data)
        return [max(l),max(r),max(inli)]
    def getAsList(self):
        print("a")

class DataSetFeatures:
    def __init__(self):
        self.Detector="ORB"
        self.Descriptor="ORB"
        self.frames=[]
        sty.use("seaborn")
    def drawGraph(self):
        fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
        x = np.arange(0, len(self.frames), 1)
        #get stereo numbers
        inlierMax=[]
        inlierMin=[]
        inlierTopDev=[]
        inlierMinDev=[]
        inlierMed=[]
        #get left numbers
        leftMax=[]
        leftMin=[]
        leftTopDev=[]
        leftMinDev=[]
        leftMed=[]
        for i in self.frames:
            leftMax.append(i.getMax()[0])
            leftMin.append(i.getMin()[0])
            leftMed.append(i.getMean()[0])
            leftTopDev.append(i.getMean()[0]+i.getSD()[0])
            leftMinDev.append(i.getMean()[0]-i.getSD()[0])
            inlierMax.append(i.getMax()[2])
            inlierMin.append(i.getMin()[2])
            inlierMed.append(i.getMean()[2])
            inlierTopDev.append(i.getMean()[2]+i.getSD()[2])
            inlierMinDev.append(i.getMean()[2]-i.getSD()[2])
        ax1.fill_between(x,leftMax,leftMin,color='black',alpha=0.2,linewidth=0.0)
        ax1.fill_between(x, leftTopDev, leftMinDev, color='darkblue', alpha=0.2,linewidth=0.0)
        ax1.plot(x,leftMed,color='black')
        ax2.fill_between(x,inlierMax,inlierMin,color='black',alpha=0.2,linewidth=0.0)
        ax2.fill_between(x, inlierTopDev, inlierMinDev, color='darkblue', alpha=0.2,linewidth=0.0)
        ax2.plot(x,inlierMed,color='black')
        plt.show()

