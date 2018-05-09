import os
import cv2
import sys

import time

from cv_bridge import CvBridge

###common ros messages and imports
import rospy
import copy
import argparse
import os
import rosbag
import copy
from front_end.motion import deserialHomography
from front_end.motion import getMotion
import numpy as np
cvb=CvBridge()

from datetime import datetime 

import matplotlib.pyplot as plt
import matplotlib.style as sty

class visoFrame:
    def __init__(self,limg,rimg,visoMsg):
        self.left=limg
        self.right=rimg
        self.viso=visoMsg

class visoFeature:
    def __init__(self,u,v,id):
        self.u=u
        self.v=v
        self.id=id
        self.pt=(int(self.u),int(self.v))

class visoStereoFeature:
    def __init__(self,left,right):
        self.left=left
        self.right=right
    def epipolarError(self):
        return self.left.v-self.right.v
    def disparity(self):
        return self.left.u-self.right.v

class visoTrack:
    def __init__(self,current,previous):
        self.current=current
        self.previous=previous

def getVisoFromBag(bag,verbose=False):
    inputBag=rosbag.Bag(bag)
    Result=[]
    currentPose=np.eye(4,dtype=np.float64)
    frame={}
    for topic,msg,t in inputBag.read_messages(topics=['/viso_extractor/output','/bumblebee/left/ROI','/bumblebee/right/ROI']):
        if(topic=="/viso_extractor/output"):
            frame["msg"]=msg
        if(topic=="/bumblebee/left/ROI"):
            frame["Left"]=copy.deepcopy(cvb.imgmsg_to_cv2(msg))
        if(topic=="/bumblebee/right/ROI"):
            frame["Right"]=copy.deepcopy(cvb.imgmsg_to_cv2(msg))
        if(("msg" in frame)and("Left" in frame)and("Right" in frame)):
            Result.append(frame)
            if(verbose):
                print(len(Result))
            frame={}

    inputBag.close()
    return Result 

def getVisoMatches(visoMsg):
    frameTracks=[]
    for index in visoMsg.matches:
        ###current
        c=visoStereoFeature(visoFeature(index.u1c.data,index.v1c.data,index.i1c.data),
                             visoFeature(index.u2c.data,index.v2c.data,index.i2c.data))
        p=visoStereoFeature(visoFeature(index.u1p.data,index.v1p.data,index.i1p.data),
                             visoFeature(index.u2p.data,index.v2p.data,index.i2p.data))
        frameTracks.append(visoTrack(c,p))
    return frameTracks

def getVisoEpiError(visoMsg):
    EpiError=[]
    allTracks=getVisoMatches(visoMsg)
    for track in allTracks:
        EpiError.append(track.current.epipolarError())
    return EpiError

def getRMSepiError(visoMsg):
    err=getVisoEpiError(visoMsg)
    RMS=0
    if(len(err)>0):
        for featureError in err:
            RMS+=np.power(featureError,2)
        RMS=np.sqrt(RMS/len(err))
    return RMS

def getVisoMotionResults(bagDir):
    data=getVisoFromBag(bagDir)
    result=[]
    for i in data:
        try:
            HInv=deserialHomography(i["msg"].homography)
        except:
            HInv=np.eye(4,dtype=np.float64)
            print("Failed H ->LibVisoReport ->",i["msg"].success)
        H=np.linalg.inv(HInv)
        result.append(getMotion(H))
    return result

def drawVisoEpi(left,right,visoMsg):
    ##assume opencv style coloured images
    EpiImage=np.hstack((left,right))
    allTracks=getVisoMatches(visoMsg)
    for track in allTracks:
        lpt=track.current.left.pt
        rpt=list(track.current.right.pt)
        rpt[0]= rpt[0]+left.shape[1]
        rpt=(rpt[0],rpt[1])
        ##draw current features on left,right, and epipolar Image
        cv2.circle(EpiImage,lpt,2,(25,255,120))
        cv2.circle(EpiImage,rpt,2,(25,255,120))
        #draw Epi Image
        cv2.line(EpiImage,lpt,rpt,(255,0,0),1)
    return EpiImage