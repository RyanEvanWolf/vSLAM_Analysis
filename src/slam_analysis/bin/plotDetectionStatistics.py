#!/usr/bin/env python
#####ros related imports
import rospy 
import cv2
import time

from front_end.utils import *
from front_end.srv import *
from front_end.msg import frameDetection,ProcTime,kPoint

from slam_analysis.features import plotFeatures,getBestSettings,getFeatureSummary

from cv_bridge import CvBridge
import matplotlib.pyplot as plt
import matplotlib.style as sty
import pickle
import argparse
cvb=CvBridge() 

parser = argparse.ArgumentParser()
parser.add_argument("feature_pickle_dir")
parser.add_argument("output_pickle_dir")
args=parser.parse_args()


print("loading Data from "+args.feature_pickle_dir)
inputPickle=open(args.feature_pickle_dir,"rb")
dataIn=pickle.load(inputPickle)
inputPickle.close()
print("Data Loaded")


OperatingCurves=getFeatureSummary(dataIn)
sett=getBestSettings(dataIn)
print(len(sett["Maximum"]))


sty.use("seaborn")
###plot left number of features statistics

fig, ax1=plt.subplots(1,1)
ax1.plot(OperatingCurves["Maximum"], mew=0.1, marker='o', c=np.random.rand(3,),label="Maximum")
ax1.plot(OperatingCurves["Minimum"], mew=0.1, marker='o', c=np.random.rand(3,),label="Minimum")
ax1.plot(OperatingCurves["Mean"], mew=0.1, marker='o', c=(0.0,0,0),label="Mean")
ax1.fill_between(range(len(OperatingCurves["-Deviation"])), OperatingCurves["-Deviation"], OperatingCurves["+Deviation"], alpha=0.4, facecolor=(0.3,0.0,0.7), interpolate=True,label="Standard Deviation")

ax1.set_ylim(ymin=0.0)
ax1.set_ylabel("Number of features")
ax1.set_xlabel("Frame Number")
ax1.legend()

fig2, ax2=plt.subplots(1,1)
ax2.fill_between(range(len(OperatingCurves["Minimum"])), OperatingCurves["Minimum"], OperatingCurves["Maximum"], alpha=0.4, facecolor=(0.7,0.0,0.1), interpolate=True)
ax2.fill_between(range(len(OperatingCurves["-Deviation"])), OperatingCurves["-Deviation"], OperatingCurves["+Deviation"], alpha=0.4, facecolor=(0,0.8,0), interpolate=True)

ax2.plot(OperatingCurves["Maximum"], mew=0.1, marker='o', c=np.random.rand(3,),label="Maximum")
ax2.plot(OperatingCurves["0.9Maximum"], mew=0.1, marker='o', c=np.random.rand(3,),label="0.9Maximum")
ax2.plot(OperatingCurves["0.8Maximum"], mew=0.1, marker='o', c=np.random.rand(3,),label="0.8Maximum")
ax2.plot(OperatingCurves["0.7Maximum"], mew=0.1, marker='o', c=np.random.rand(3,),label="0.7Maximum")
ax2.plot(OperatingCurves["0.6Maximum"], mew=0.1, marker='o', c=np.random.rand(3,),label="0.6Maximum")
ax2.plot(OperatingCurves["+Deviation"], mew=0.1, marker='o', c=np.random.rand(3,),label="+Deviation")
ax2.plot(OperatingCurves["Mean"], mew=0.1, marker='o', c=(0.0,0,0),label="Mean")

ax2.set_ylim(ymin=0.0)
ax2.set_ylabel("Number of features")
ax2.set_xlabel("Frame Number")

ax2.legend()




# fig, (ax1, ax2) = plt.subplots(1, 2, sharex=True)
# for i in range(6):
#     ax1.plot(getAsList(bestSettings[i],1)[0], getAsList(bestSettings[i],1)[1], mew=0.1, marker='o', c=np.random.rand(3,))


# for i in range(6):
#     ax2.plot(getAsList(bestSettings[i],2)[0], getAsList(bestSettings[i],2)[1], mew=0.1, marker='o', c=np.random.rand(3,))

# ax2.set_ylim(ymin=0.0)
# ax2.set_ylabel("Processing Time (ms)")
# plt.show()



# for b in OperatingCurves.keys():
#     plt.plot(OperatingCurves[b],label=b)
# print("Completed")
# plt.legend()
plt.show()