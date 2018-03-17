#!/usr/bin/env python
import os
import cv2
import sys

import time

logExtension=".LoggedData"
dataExtension=".rawData"


from datetime import datetime 

import matplotlib.pyplot as plt
import matplotlib.style as sty

fileInput=sys.argv[1]
timePrefix=fileInput.split("/")[-1]
timePrefix=timePrefix[:timePrefix.rfind(".")]

###calculate the recording stats first

LogFile=fileInput+logExtension
jitter=[]
bufferId=[]

with open(LogFile,"r") as lFile:
    ##skip the first data Point and header
    lFile.next()
    lFile.next()
    for line in lFile:
        msg=line.split(",")
        jitter.append(float(msg[1])/1000)
        bufferId.append(float(msg[2]))

lFile.close()



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
plt.show()
