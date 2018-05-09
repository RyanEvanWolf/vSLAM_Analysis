# dataset
Executes and combines the various SLAM packages to produce useful input and output data. This includes coordinating the various nodes in order to produce pickled and ros bags of output data, and stereo rectified images.


Example Usage


#######
##
display a folder of images
rosrun dataset displayFolder directoryToImages 
rosrun dataset displayFolder directoryToImages --debayer True --delayTime 66

debayer images before displaying with BG2RGB
wait 66 ms before displaying a new folder


1) begin the base nodes. This includes the dataset server, bumblebee configuration, and bumblebee Rectificaiton Server.
  Edit the baseLaunch.xml file settings, notably the dataset folder where the raw captured images reside, and the stereo output configuration folder.
    Add the tag publishTransform = True for this first bag.
  This will allow a transform tree to be published and recorded.
  
  
  roslaunch dataset baseLaunch.xml
  
  
  OR 
  
  roslauncg dataset baseLaunch.xml publishTransform:= True
  
  

2) Create a rosbag of bayer encoded left and right images. This saves both the tf transform chain topic, and /dataset/currentImage raw bayer topic  to a rosbag rawImageBag.bag
  To play it back,rosrun rosbag play -r 0.5 rawImageBag.bag,
  this runs the bag at half the rate it was originally published.
  Run baseLaunch before execution with the publish transform option.
  Change the args parameter in the CreateDatasetBag.xml to change the minimum number of Images

    
  

  roslaunch dataset CreateDatasetBag.xml

3) 
run baseLaunch with no publish transform parameter

First create a rosbag of stereo images.


  roslaunch dataset CreateStereoBag.xml 
  rosplay 
  

  
  
----------------
rosrun dataset extractLoopFeatures /home/ryan/DATA3 A_1 --max_images 10
-----------------
  
  
  
To execute in looped mode where a dataset has been split up into individual loops, provide a metaData file as shown in github project gpsData

1) execute a minLaunch.xml where it provides only the stereo processing node and tf transform chain.

roslaunch dataset minLaunch.xml BumblebeeConfigurationFolder:=DIRECTORY_TO_CALIBRATION publishTransform:=True

2) once these have started up, start recording the stereo output topics and saving them to bags, give a track and loop number to select which set of images to use

roslaunch dataset CreateStereoLoop.xml
################
###to get libviso and loop bags

1) execute configuration script
->lib viso parameters must be adjusted manually in the visoConfig.xml file in viso_extractor


roslaunch dataset visoLoopLaunch.xml

2)
ensure that the DATAFolder/Bags folder has been CreateDatasetBag
->adjust output folders in xml 


roslaunch dataset CreateStereoLoop.xml



######################
##extracting features from looped data
##

1) initilaize the front_end feature node for feature extraction
rosrun front_end feature_node

2)Begin extracting features from a rosbag that contains stereo rectified Images

rosrun dataset extractLoopFeatures.py /home/ryan/DATA/Bags/stereoBag_A_1.bag /home/ryan/DATA/Features/_A_1/FAST/baseDetection.p

3) generate stereo summary statistics 

rosrun dataset extractStereo.py