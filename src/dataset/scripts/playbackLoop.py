#!/usr/bin/env python
import os
import cv2
import sys

import time

import rospy
from bumbleDataSet import videoSequence,loop

if __name__ == '__main__':
    rospy.init_node('loop')

    metaIn=sys.argv[3]

    sequence=videoSequence(metaIn)
    
    trackNumber=int(sys.argv[1])
    loopNumber=int(sys.argv[2])
    print("beginning Sequence")
    sequence.playbackLoop(trackNumber,loopNumber)
    print("end")
    # for i in range(0,7):
    #     first=sequence.Track[0].loops[i].getImageList(sequence.Track[0].dir)
    #     second=sequence.Track[0].loops[i+1].getImageList(sequence.Track[0].dir)
    #     print(first[0],first[-1])
    #     print(second[0])
    #     cv2.namedWindow("a",cv2.WINDOW_NORMAL)
    #     cv2.namedWindow("b",cv2.WINDOW_NORMAL)
    #     cv2.imshow("a",cv2.imread(sequence.Track[0].dir+"/"+first[0],cv2.IMREAD_GRAYSCALE))
    #     cv2.imshow("b",cv2.imread(sequence.Track[0].dir+"/"+second[0],cv2.IMREAD_GRAYSCALE))
    #     cv2.waitKey(0)