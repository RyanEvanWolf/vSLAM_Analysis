Example Usage


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
  
  
  
To execute in looped mode where a dataset has been split up into individual loops, provide a metaData file as shown in github project gpsData

1) execute a minLaunch.xml where it provides only the stereo processing node and tf transform chain.

roslaunch dataset minLaunch.xml BumblebeeConfigurationFolder:=DIRECTORY_TO_CALIBRATION publishTransform:=True

2) once these have started up, start recording the stereo output topics and saving them to bags, give a track and loop number to select which set of images to use

roslaunch dataset CreateStereoLoop.xml