#!/usr/bin/env python
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt

def getHomogZeros():
    out=np.zeros((4,1),dtype=np.float64)
    out[3,0]=1
    return out

def plotPose(graph,H,scale=0.2):
    ###
    centre=getHomogZeros()
    newCentre=H.dot(centre)
    xAxis=getHomogZeros()
    xAxis[0,0]=scale
    yAxis=getHomogZeros()
    yAxis[1,0]=scale
    zAxis=getHomogZeros()
    zAxis[2,0]=scale
    ##get relative points
    newX=H.dot(xAxis)
    newY=H.dot(yAxis)
    newZ=H.dot(zAxis)
    ###draw them
    graph.plot((newCentre[0,0],newX[0,0]),             
                (newCentre[1,0],newX[1,0]),
                (newCentre[2,0],newX[2,0]),
                color='red')
    graph.plot((newCentre[0,0],newY[0,0]),             
                (newCentre[1,0],newY[1,0]),
                (newCentre[2,0],newY[2,0]),
                color='green')
    graph.plot((newCentre[0,0],newZ[0,0]),             
                (newCentre[1,0],newZ[1,0]),
                (newCentre[2,0],newZ[2,0]),
                color='blue')


mpl.rcParams['legend.fontsize'] = 10

fig = plt.figure()
ax = fig.gca(projection='3d')
ax.set_xlabel('X axis')
ax.set_ylabel('Y axis')
ax.set_zlabel('Z axis')
ax.set_xlim3d(0, 3)
ax.set_ylim3d(0,3)
ax.set_zlim3d(0,3)


newMotion=np.eye(4,dtype=np.float64)
plotPose(ax,newMotion)
plotPose(ax,newMotion)


ax.legend()
# '''
# ==============
# 3D quiver plot
# ==============

# Demonstrates plotting directional arrows at points on a 3d meshgrid.
# '''

# from mpl_toolkits.mplot3d import axes3d
# import matplotlib.pyplot as plt
# import numpy as np



# motion =[]


# xArrow=np.zeros((4,1),dtype=np.float64)
# xArrow[0,0]=1
# xArrow[3,0]=1
# yArrow=np.zeros((4,1),dtype=np.float64)
# yArrow[1,0]=1
# yArrow[3,0]=1
# zArrow=np.zeros((4,1),dtype=np.float64)
# zArrow[2,0]=1
# zArrow[3,0]=1


# print(xArrow,yArrow,zArrow)

# print(zArrow)

# for i in range(0,10):
#     h=np.eye(4,dtype=np.float64)
#     x1=np.zeros((4,1),dtype=np.float64)
#     x1[3,0]=1
#     h[2,3]=1.0*i
#     motion.append(h)








# def plotAxis(graph,scale=0.2):
    
#     arrow1=(0,0,0,scale,0,0,'red')
#     arrow2=(0,0,0,0,0,2*scale,'blue')
#     arrow3=(0,0,0,0,scale,0,'green')
#     l=[arrow1,arrow2,arrow3]
#     for i in l:
#         graph.quiver(i[0], i[1], i[2], i[3], i[4], i[5],color=i[6],length=0.1)#, normalize=True)




# def getAxis():
#     return [0,0,0,1,0,0]


# fig = plt.figure()
# ax = fig.gca(projection='3d')
# ax.set_xlabel('X axis')
# ax.set_ylabel('Y axis')
# ax.set_zlabel('Z axis')



# for h in motion:
#     newarrow=(h.dot(xArrow),h.dot(yArrow),h.dot(zArrow))
#     coordinate=h[0:3,3]
#     print(coordinate,h)
#     print(newarrow)
#     print("--")

# plotAxis(ax)

# arrow1=(0,0,0,1,0,0)
# arrow2=(0,0,0,0,0,1)
# arrow3=(0,0,0,0,1,0)

# l=[arrow1]



# for i in l:
#     ax.quiver(i[0], i[1], i[2], i[3], i[4], i[5],color='red',length=0.1, normalize=True)

# x=[arrow1[0],arrow2[0],arrow3[0]]
# y=[arrow1[1],arrow2[1],arrow3[1]]
# z=[arrow1[2],arrow2[2],arrow3[2]]
# u=[arrow1[3],arrow2[3],arrow3[3]]
# v=[arrow1[4],arrow2[4],arrow3[4]]
# w=[arrow1[5],arrow2[5],arrow3[5]]


#ax.quiver(x, y, z, u, v, w,C=((0,0,255),(0,255,0),(255,0,0)), length=0.1, normalize=True)

plt.show()

# #import panda3d.core as p3core

# from direct.showbase.ShowBase import ShowBase
# from direct.showbase.DirectObject import DirectObject
# from direct.gui.DirectGui import *
# from direct.interval.IntervalGlobal import *
# # from panda3d.core import lookAt
# from panda3d.core import GeomVertexFormat, GeomVertexData
# from panda3d.core import Geom, GeomTriangles, GeomVertexWriter
# from panda3d.core import Texture, GeomNode
# from panda3d.core import PerspectiveLens
# from panda3d.core import CardMaker
# from panda3d.core import Light, Spotlight
# from panda3d.core import TextNode
# from panda3d.core import LVector3
# import sys
# import os

# base = ShowBase()
# base.camera.setPos(0, -20, 2)


# #step 1) create GeomVertexData and add vertex information 
# format = GeomVertexFormat.getV3() 
# vdata = GeomVertexData("vertices", format, Geom.UHStatic) 
# vdata.setNumRows(4) 

# vertexWriter = GeomVertexWriter(vdata, "vertex") 
# vertexWriter.addData3f(0,0,0) 
# vertexWriter.addData3f(1,0,0) 
# vertexWriter.addData3f(1,0,1) 
# vertexWriter.addData3f(0,0,1) 

# #step 2) make primitives and assign vertices to them 
# tris=GeomTriangles(Geom.UHStatic) 

# #have to add vertices one by one since they are not in order 
# tris.addVertex(0) 
# tris.addVertex(1) 
# tris.addVertex(3) 

# #indicates that we have finished adding vertices for the first triangle. 
# tris.closePrimitive() 

# #since the coordinates are in order we can use this convenience function. 
# tris.addConsecutiveVertices(1,3) #add vertex 1, 2 and 3 
# tris.closePrimitive() 

# #step 3) make a Geom object to hold the primitives 
# squareGeom=Geom(vdata) 
# squareGeom.addPrimitive(tris) 

# #now put squareGeom in a GeomNode. You can now position your geometry in the scene graph. 
# squareGN=GeomNode("square") 
# squareGN.addGeom(squareGeom) 
# render.attachNewNode(squareGN)

# base.run()