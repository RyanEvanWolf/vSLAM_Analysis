#!/usr/bin/env python
from bumbleDataSet import bumbleDataSet

##Ros specific imports
import rospy
import tf
from std_msgs.msg import Int32, Bool, Int8, Float64,String

#system imports
from threading import Thread
import datetime
import numpy as np
import sys
import time
from Queue import Queue

from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QTabWidget, QFormLayout, QLineEdit,QCheckBox, QComboBox
from PyQt5.QtCore import pyqtSlot, QThread, QObject, pyqtSignal, QMutex, QSettings
from PyQt5.QtGui import QKeyEvent


class mainApp(QWidget):
    def __init__(self,parent=None):
        super(mainApp, self).__init__(parent)
        self.playbtn = QPushButton("Playback", self)
        self.prevbtn = QPushButton("Prev", self)
        self.nextbtn = QPushButton("Next", self)
        self.savebtn = QPushButton("Save", self)
        self.newbtn = QPushButton("newDataSet", self)

        self.playbtn.clicked.connect(self.play)
        self.prevbtn.clicked.connect(self.prev)
        self.nextbtn.clicked.connect(self.nxt)
        self.savebtn.clicked.connect(self.save)
        self.newbtn.clicked.connect(self.newData)
        self.worker=workerClass()
        self.worker.daemon=True

        self.node = rospy.init_node('dataset_node')
        self.initUI()
        self.data=bumbleDataSet()
        self.show()
        self.worker.start()
    def initUI(self):
        l=QFormLayout(self)
        l.addRow(self.playbtn)
        l.addRow(self.prevbtn)
        l.addRow(self.nextbtn)
        l.addRow(self.savebtn)
        l.addRow(self.newbtn)
        self.setLayout(l)
    def play(self):
        self.worker.commands.put("playback")
    def prev(self):
        self.worker.commands.put("previous")
    def nxt(self):
        self.worker.commands.put("next")
    def save(self):
        self.worker.commands.put("save")
    def newData(self):
        self.worker.settingsUpdate.put("XML File from edit box")
    def closeEvent(self,QCloseEvent):
        self.worker.settingsUpdate.put("xxx")


class workerClass(Thread):
    def __init__(self):
        super(workerClass,self).__init__()
        self.settingsUpdate=Queue()
        self.commands=Queue()
    def run(self):
        alive=True
        while(alive):
            if(self.settingsUpdate.qsize()>0):
                alive=self.updateSettings(self.settingsUpdate.get())
            if(alive):
                if(self.commands.qsize()>0):
                    self.commandResponse(self.commands.get())
    def updateSettings(self,message):
        print(message)
        if(message=="exit"):
            return False
        else:
            return True
    def commandResponse(self,message):
        if(message=="playback"):
            print("send")
        elif(message=="previous"):
            print("check prev")
        elif(message=="next"):
            print("next styff")
        elif(message=="save"):
            print("save my data")
        elif(message==""):
            print("aaaa")
        else:
            print("invalid command received")


if __name__ == '__main__':
    app = QApplication(sys.argv)
    main = mainApp()
    main.data.loadFiles(sys.argv[1])
    app.exec_()