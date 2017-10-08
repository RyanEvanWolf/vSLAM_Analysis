#!/usr/bin/env python
import copy
import sys
import time
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton
from PyQt5.QtGui import QIcon
from PyQt5.QtCore import pyqtSlot, QThread, QObject, pyqtSignal, QMutex
import rospy
from std_msgs.msg import Int32, Bool
from viso2.srv import *

class App(QWidget):
    def __init__(self):
        super(App,self).__init__()
        self.stateRunning_=QMutex()
        self.title = 'PyQt5 button - pythonspot.com'
        self.left = 10
        self.top = 10
        self.width = 320
        self.height = 200
        node = rospy.init_node('gui')
        self.test=publishThread()
        self.initUI()
        self.test.start()
        
        rospy.wait_for_service('visoExtract')
        print("connected")
        try:
          self.serv = rospy.ServiceProxy('visoExtract', NextFrame)
        #resp1 = add_two_ints(x, y)
        #return resp1.sum
        except rospy.ServiceException, e:
          print "Service call failed: %s"%e
    def initUI(self):
        #define Buttons
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)
        button = QPushButton('PyQt5 button', self)
        button.setToolTip('This is an example button')
        button.move(100,70)
        button.clicked.connect(self.on_click)

        self.playButton_=QPushButton(self)
        self.playButton_.setText("Play")
        #self.playButton_.clicked.connect(self.close)

        self.exitButton_=QPushButton(self)
        self.exitButton_.setText("Exit")
        self.exitButton_.clicked.connect(self.close)

        self.show()
    @pyqtSlot()
    def on_click(self):
        print('PyQt5 button click')
        a=Bool()
        a.data=True
        abc=self.serv(a)
        print(abc)
    def close(self):
        print('closing')
        ## = call worker thread close functions
        self.test.close()
        self.test.wait()
        print('exited')
        sys.exit(0)
    def updatePlay(self):
      print("play")


#from beginner_tutorials.srv import *

#def add_two_ints_client(x, y):
 #   rospy.wait_for_service('add_two_ints')
  #  try:
   #     add_two_ints = rospy.ServiceProxy('add_two_ints', AddTwoInts)
    ###cept rospy.ServiceException, e:
       # print "Service call failed: %s"%e

#def usage():
 #   return "%s [x y]"%sys.argv[0]

#if __name__ == "__main__":
 #   if len(sys.argv) == 3:
  ###else:
     #   print usage()
      #  sys.exit(1)
    #print "Requesting %s+%s"%(x, y)
    #print "%s + %s = %s"%(x, y, add_two_ints_client(x, y))


class publishThread(QThread):
    def __init__(self):
        super(QThread,self).__init__()
        self.pub=rospy.Publisher("/keyPress",Int32)
        self.mRunning_=QMutex()
        self.stateRunning_=True
        print("abc")
    def run(self):
        killThread=False
        while not killThread:
            abc=Int32()
            abc.data=10
            self.pub.publish(abc)
            time.sleep(0.5)
            killThread= not copy.copy(self.getRunning_())
        print("publish Thread killed")
    def close(self):
            self.mRunning_.lock()
            self.stateRunning_=False
            self.mRunning_.unlock()
    def getRunning_(self):
        self.mRunning_.lock()
        state=self.stateRunning_
        self.mRunning_.unlock()
        return state

def stateThread(QThread):
    def __init(self):
        super(QThread,self).__init__()


    

if __name__ == '__main__':
    app = QApplication(sys.argv)
    main = App()
    sys.exit(app.exec_())
    print("mine")