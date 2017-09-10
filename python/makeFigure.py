import pandas as pd
import matplotlib.pyplot as plt
import GraphUtilities as UT

defaultFile="D5.csv"

DataFrame=pd.read_csv(defaultFile)

##create the Translation graph
translationGraph=plt.figure()
translationGraph.subplots_adjust(hspace=0.4)

xfig=translationGraph.add_subplot(311)
xfig.plot(DataFrame["X"],"r-")
xfig.set_title("$\delta$X per Frame")
xfig.set_xlabel("Frame Index")
xfig.set_ylabel("$\delta$X (m)")
xfig.grid(True)
xfig.set_ylim(-1,1)

xfig=translationGraph.add_subplot(312)
xfig.plot(DataFrame["Y"],"b-")
xfig.set_title("$\delta$Y per Frame")
xfig.set_xlabel("Frame Index")
xfig.set_ylabel("$\delta$Y (m)")
xfig.grid(True)
xfig.set_ylim(-1,1)

xfig=translationGraph.add_subplot(313)
xfig.plot(DataFrame["Z"],"g-")
xfig.set_title("$\delta$Z per Frame")
xfig.set_xlabel("Frame Index")
xfig.set_ylabel("$\delta$Z (m)")
xfig.grid(True)
xfig.set_ylim(-1,1)



##create angle graph
rotationGraph=plt.figure()
rotationGraph.subplots_adjust(hspace=0.4)

rfig=rotationGraph.add_subplot(311)
rfig.plot(DataFrame["Roll"],"r-")
rfig.set_title("$\delta$Roll per Frame")
rfig.set_xlabel("Frame Index")
rfig.set_ylabel("$\delta$Roll (radian)")
rfig.grid(True)
rfig.set_ylim(-0.2,0.2)

pfig=rotationGraph.add_subplot(312)
pfig.plot(DataFrame["Pitch"],"b-")
pfig.set_title("$\delta$Pitch per Frame")
pfig.set_xlabel("Frame Index")
pfig.set_ylabel("$\delta$Pitch (radian)")
pfig.grid(True)
pfig.set_ylim(-0.2,0.2)

yfig=rotationGraph.add_subplot(313)
yfig.plot(DataFrame["Yaw"],"g-")
yfig.set_title("$\delta$Yaw per Frame")
yfig.set_xlabel("Frame Index")
yfig.set_ylabel("$\delta$Yaw (radian)")
yfig.grid(True)
yfig.set_ylim(-0.2,0.2)

#show matches

inlierRatio=DataFrame["Inliers"]/DataFrame["Matches"]

matchFigure=plt.figure()
mfig=matchFigure.add_subplot(121)
mfig.plot(DataFrame["Matches"],"g-")
mfig.set_title("Number of Matches per Frame")
mfig.set_xlabel("Frame Index")
mfig.set_ylabel("Number of Matches")
mfig.grid(True)

inlierfig=matchFigure.add_subplot(122)
inlierfig.plot(inlierRatio.tolist(),"b-")
inlierfig.set_title("Inlier Ratio per Frame")
inlierfig.set_xlabel("Frame Index")
inlierfig.set_ylabel("Inlier Ratio")
inlierfig.grid(True)


##together

tog=plt.figure()
f=tog.add_subplot(111)
f.set_ylim(-1,1)
NormalizedMatches=DataFrame["Matches"]/DataFrame["Matches"].max()
plt.plot(NormalizedMatches,"g-")
plt.plot(DataFrame["Z"],"r-")





#modified=UT.clampValues(DataFrame["X"].values.tolist(),-1,1)

#print(modified)



#plt.plot(modified)

plt.show()


