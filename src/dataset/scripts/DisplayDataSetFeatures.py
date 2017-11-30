#!/usr/bin/env python

from FeaturesAnalysis import drawGraph,drawProcVsNfeat
import pickle
import matplotlib as plt


file_path = "/media/ryan/Markov/DetectorOutput/D1_mini/30_11_22_12_10_ORB/Data.p"
data =  pickle.load(open(file_path,"rb"))

data.drawGraph()

