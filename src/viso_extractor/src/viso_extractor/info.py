#!/usr/bin/env python
#####ros related imports
import rospy 
import cv2
import time

from viso_extractor.stereo import getVisoFromBag,getVisoMatches
from viso_extractor.stereo import getRMSepiError
def getProcessingTime(bagDir):
    data=getVisoFromBag(bagDir)
    frameN=[]
    proc=[]
    for i in data:
        frameN.append(len(proc))
        proc.append(i["msg"].time.data)
    return frameN,proc

def getEpiPolarError(bagDir):
    data=getVisoFromBag(bagDir)
    frameN=[]
    err=[]
    for i in data:
        frameN.append(len(err))
        err.append(getRMSepiError(i["msg"]))

    return frameN,err

def getTotalMatches(bagDir):
    data=getVisoFromBag(bagDir)
    frameN=[]
    nMatches=[]
    for i in data:
        frameN.append(len(nMatches))
        nMatches.append(len(getVisoMatches(i["msg"])))
    return frameN,nMatches
  
def getFailureIndices(bagDir):
    data=getVisoFromBag(bagDir)
    indexes=[]
    for i in range(0,len(data)):
        if(not data[i]["msg"].success):
            indexes.append(i)
    return indexes