;; Auto-generated. Do not edit!


(when (boundp 'front_end::interFrameTracks)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'interFrameTracks (find-package "FRONT_END")))
(unless (find-package "FRONT_END::INTERFRAMETRACKS")
  (make-package "FRONT_END::INTERFRAMETRACKS"))

(in-package "ROS")
;;//! \htmlinclude interFrameTracks.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass front_end::interFrameTracks
  :super ros::object
  :slots (_tracks _motionInliers ))

(defmethod front_end::interFrameTracks
  (:init
   (&key
    ((:tracks __tracks) (let (r) (dotimes (i 0) (push (instance front_end::cvMatch :init) r)) r))
    ((:motionInliers __motionInliers) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _tracks __tracks)
   (setq _motionInliers __motionInliers)
   self)
  (:tracks
   (&rest __tracks)
   (if (keywordp (car __tracks))
       (send* _tracks __tracks)
     (progn
       (if __tracks (setq _tracks (car __tracks)))
       _tracks)))
  (:motionInliers
   (&rest __motionInliers)
   (if (keywordp (car __motionInliers))
       (send* _motionInliers __motionInliers)
     (progn
       (if __motionInliers (setq _motionInliers (car __motionInliers)))
       _motionInliers)))
  (:serialization-length
   ()
   (+
    ;; front_end/cvMatch[] _tracks
    (apply #'+ (send-all _tracks :serialization-length)) 4
    ;; sensor_msgs/Image _motionInliers
    (send _motionInliers :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/cvMatch[] _tracks
     (write-long (length _tracks) s)
     (dolist (elem _tracks)
       (send elem :serialize s)
       )
     ;; sensor_msgs/Image _motionInliers
       (send _motionInliers :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/cvMatch[] _tracks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tracks (let (r) (dotimes (i n) (push (instance front_end::cvMatch :init) r)) r))
     (dolist (elem- _tracks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/Image _motionInliers
     (send _motionInliers :deserialize buf ptr-) (incf ptr- (send _motionInliers :serialization-length))
   ;;
   self)
  )

(setf (get front_end::interFrameTracks :md5sum-) "75c31d94db7747501fccc4f90c044a01")
(setf (get front_end::interFrameTracks :datatype-) "front_end/interFrameTracks")
(setf (get front_end::interFrameTracks :definition-)
      "front_end/cvMatch[] tracks 
sensor_msgs/Image motionInliers
================================================================================
MSG: front_end/cvMatch
uint32 queryIdx
uint32 trainIdx
uint32 imgIdx
float32 distance

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :front_end/interFrameTracks "75c31d94db7747501fccc4f90c044a01")


