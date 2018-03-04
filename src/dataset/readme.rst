Example Usage


1) begin the base nodes. This includes the dataset server, bumblebee configuration, and bumblebee Rectificaiton Server.
  Edit the baseLaunch.xml file settings, notably the dataset folder where the raw captured images reside, and the stereo output configuration folder 
  
  roslaunch dataset baseLaunch.xml

2) Create a rosbag of bayer encoded left and right images. This saves both the tf transform chain topic, and /dataset/currentImage raw bayer topic
  to a rosbag rawImageBag.bag
  To play it back,rosrun rosbag play -r 0.5 rawImageBag.bag,
  this runs the bag at half the rate it was originally published
    
  

  roslaunch dataset CreateDatasetBag.xml publishTransform:=True

3) 

First create a rosbag of stereo images.


  roslaunch dataset CreateStereoBag.xml 
  rosplay 