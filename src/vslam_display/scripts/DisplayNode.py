#!/usr/bin/env python
import rospy
import time
from mainWidget import *

space=32
left=260
right=261
down=259
up=258
q=113


if __name__ == '__main__':
    #stdscr=curses.initscr()
    #stdscr.keypad(True)
    #curses.cbreak(1)
    #stdscr.nodelay(1)
    #curses.noecho()
    node=rospy.init_node('gui')
    app = mainWidget.QApplication(sys.argv)
    ex = mainWidget.App()
    #abc=0
    #pub=rospy.Publisher("/keyPress",Int32)
    
    
    #paused=False
    #refreshRate=1000/15
    #print("q to quit")
    #print("space to toggle")
    #print("arrow keys to increment while in paused mode")
    #print("up and down to change delay rate")
    while not rospy.is_shutdown():
        print("alve")
        time.sleep(2)
      #current=stdscr.getch()
      #latest=Int32()
      #latest.data=current
      #pub.publish(latest)
      #time.sleep(0.1)
      #stdscr.refresh()
    #curses.nocbreak()
    #stdscr.keypad(0)
    #curses.echo()
    #curses.endwin()
    sys.exit(app.exec_())
     
