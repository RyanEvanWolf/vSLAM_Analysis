#!/usr/bin/env python
import os
import cv2
import sys

import time

from cv_bridge import CvBridge

###common ros messages and imports
import rospy
import copy
import argparse

import rosbag


import numpy as np
cvb=CvBridge()

logExtension=".LoggedData"
dataExtension=".rawData"


from datetime import datetime 

import matplotlib.pyplot as plt
import matplotlib.style as sty

fileInput=sys.argv[1]
timePrefix=fileInput.split("/")[-1]
timePrefix=timePrefix[:timePrefix.rfind(".")]
######
##

###calculate the recording stats first

LogFile=fileInput+logExtension
jitter=[]
bufferId=[]

print("Fetching Recording Stats")

with open(LogFile,"r") as lFile:
    ##skip the first data Point and header
    lFile.next()
    lFile.next()
    for line in lFile:
        msg=line.split(",")
        jitter.append(float(msg[1])/1000)
        bufferId.append(float(msg[2]))

lFile.close()
print("completed")

print("Calculating Viso Stats")

CurrentIndex=0
PreviousIndex=1

LeftIndex=0
RightIndex=1

class Feature:
    def __init__(self,u,v,id):
        self.u=u
        self.v=v
        self.id=id


class singleFrame:
    def __init__(self,lmsg,rmsg,vmsg,frameN):
        self.left=cvb.imgmsg_to_cv2(lmsg)
        self.right=cvb.imgmsg_to_cv2(rmsg)
        self.viso=copy.deepcopy(vmsg)
        self.nNumber=frameN
    def getMatches(self):
        ###[LeftFeature,RightFeature]
        currentMatches=[]
        previousMatches=[]
        for index in self.viso.matches:
            currentMatches.append((Feature(index.u1c.data,index.v1c.data,index.i1c.data),
                                    Feature(index.u2c.data,index.v2c.data,index.i2c.data)))
            previousMatches.append((Feature(index.u1p.data,index.v1p.data,index.i1p.data),
                                    Feature(index.u2p.data,index.v2p.data,index.i2p.data)))
        return (currentMatches,previousMatches)
    def drawFeatures(self):
        data=copy.deepcopy(self.getMatches())
        leftColour=cv2.cvtColor(self.left,cv2.COLOR_GRAY2RGB)
        rightColour=cv2.cvtColor(self.right,cv2.COLOR_GRAY2RGB)
        Epi=np.hstack((leftColour, rightColour))

        for featureIndex in range(0,len(data[0])):
            ##draw current features on left,right, and epipolar Image
            cv2.circle(leftColour,(int(data[CurrentIndex][featureIndex][LeftIndex].u),int(data[CurrentIndex][featureIndex][LeftIndex].v)),2,(0,255,0))
            cv2.circle(rightColour,(int(data[CurrentIndex][featureIndex][RightIndex].u),int(data[CurrentIndex][featureIndex][RightIndex].v)),2,(0,255,0))
            cv2.circle(Epi,(int(data[CurrentIndex][featureIndex][LeftIndex].u),int(round(data[CurrentIndex][featureIndex][LeftIndex].v))),2,(25,255,120))
            cv2.circle(Epi,(int(data[CurrentIndex][featureIndex][RightIndex].u)+leftColour.shape[1],int(round(data[CurrentIndex][featureIndex][RightIndex].v))),2,(25,255,120))
            ##draw previous features on left,right, and epipolar Image
            cv2.circle(leftColour,(int(data[PreviousIndex][featureIndex][LeftIndex].u),int(data[PreviousIndex][featureIndex][LeftIndex].v)),2,(255,0,0))
            cv2.circle(rightColour,(int(data[PreviousIndex][featureIndex][RightIndex].u),int(data[PreviousIndex][featureIndex][RightIndex].v)),2,(255,0,0))
            ##draw Tracked Lines
            cv2.line(leftColour,(int(data[CurrentIndex][featureIndex][LeftIndex].u),int(data[CurrentIndex][featureIndex][LeftIndex].v)),
                                (int(data[PreviousIndex][featureIndex][LeftIndex].u),int(data[PreviousIndex][featureIndex][LeftIndex].v)),(255,0,0),1)
            cv2.line(rightColour,(int(data[CurrentIndex][featureIndex][RightIndex].u),int(data[CurrentIndex][featureIndex][RightIndex].v)),
                                (int(data[PreviousIndex][featureIndex][RightIndex].u),int(data[PreviousIndex][featureIndex][RightIndex].v)),(255,0,0),1)

            #draw Epi Lines
            cv2.line(leftColour,(int(data[0][featureIndex][0].u),int(data[0][featureIndex][0].v)),
                                (int(data[1][featureIndex][0].u),int(data[1][featureIndex][0].v)),(255,0,0),1)

            #draw Epi Image
            cv2.line(Epi,(int(data[CurrentIndex][featureIndex][LeftIndex].u),int(round(data[CurrentIndex][featureIndex][LeftIndex].v))),
                                (int(data[CurrentIndex][featureIndex][RightIndex].u)+leftColour.shape[1],int(round(data[CurrentIndex][featureIndex][RightIndex].v))),(255,0,0),1)
        return (leftColour,rightColour,Epi)
    def getEpiPolarError(self):
        data=copy.deepcopy(self.getMatches())
        EpiError=[]
        for featureIndex in range(0,len(data[0])):
            e=data[CurrentIndex][featureIndex][LeftIndex].v-data[CurrentIndex][featureIndex][RightIndex].v
            EpiError.append(e)
        return EpiError

   
    

#inputBag=rosbag.Bag("/home/ryan/DataSets/raw/auto/1/output/visoBag.bag")

#leftImages=[]
#rightImages=[]
#outputData=[]




#for topic,msg,t in inputBag.read_messages(topics=['/viso_extractor/output','/bumblebee/left/ROI','/bumblebee/right/ROI']):
    #if(topic=="/viso_extractor/output"):
        #outputData.append(msg)
    #if(topic=="/bumblebee/left/ROI"):
        #leftImages.append(msg)
    #if(topic=="/bumblebee/right/ROI"):
        #rightImages.append(msg)

#########
##calculate motion Fail Statistics
##get Processing time
motionFail=[]
procTime=[]


for i in outputData:
    if(i.success):
        motionFail.append(True)
    else:
        motionFail.append(False)
    procTime.append(i.time.data)







# for i in range(0,len(leftImages)):
#     a=singleFrame(leftImages[i],rightImages[i],outputData[i],i)
#     print(a.nNumber)
#     cv2.imshow("a",a.left)
#     cv2.waitKey(1)

#RMS_EPI=[]
#Matches=[]
#inputBag.close()
#for i in range(1,len(leftImages)):
    #a=singleFrame(leftImages[i],rightImages[i],outputData[i],i)
    #err=a.getEpiPolarError()
    #RMS=0
    #for i in err:
        #RMS+=np.power(i,2)
    #RMS_EPI.append(np.sqrt(RMS/len(err)))
    #Matches.append(len(a.getMatches()[LeftIndex]))







sty.use("seaborn")

###jitter
plt.figure(100)
t = range(1,len(jitter)+1)
plt.plot(t, jitter, 'b-')
plt.xlabel('Image Frame')
plt.ylabel('Timestamp Difference (ms)')



###validate bufferID
plt.figure(200)

t = range(1,len(bufferId)+1)
plt.plot(t, bufferId, 'b-')
plt.xlabel('Image Frame')
plt.ylabel('Image Buffer ID')



plt.figure(300)
plt.plot(motionFail)

plt.figure(400)
plt.plot(procTime)

#plt.figure()
#plt.plot(RMS_EPI)


#plt.figure()
#plt.plot(Matches)

plt.show()
