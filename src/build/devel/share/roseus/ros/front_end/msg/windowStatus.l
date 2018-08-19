;; Auto-generated. Do not edit!


(when (boundp 'front_end::windowStatus)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'windowStatus (find-package "FRONT_END")))
(unless (find-package "FRONT_END::WINDOWSTATUS")
  (make-package "FRONT_END::WINDOWSTATUS"))

(in-package "ROS")
;;//! \htmlinclude windowStatus.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass front_end::windowStatus
  :super ros::object
  :slots (_msgs _tracks _motion ))

(defmethod front_end::windowStatus
  (:init
   (&key
    ((:msgs __msgs) (let (r) (dotimes (i 0) (push (instance front_end::stereoLandmarks :init) r)) r))
    ((:tracks __tracks) (let (r) (dotimes (i 0) (push (instance front_end::interFrameTracks :init) r)) r))
    ((:motion __motion) (let (r) (dotimes (i 0) (push (instance sensor_msgs::Image :init) r)) r))
    )
   (send-super :init)
   (setq _msgs __msgs)
   (setq _tracks __tracks)
   (setq _motion __motion)
   self)
  (:msgs
   (&rest __msgs)
   (if (keywordp (car __msgs))
       (send* _msgs __msgs)
     (progn
       (if __msgs (setq _msgs (car __msgs)))
       _msgs)))
  (:tracks
   (&rest __tracks)
   (if (keywordp (car __tracks))
       (send* _tracks __tracks)
     (progn
       (if __tracks (setq _tracks (car __tracks)))
       _tracks)))
  (:motion
   (&rest __motion)
   (if (keywordp (car __motion))
       (send* _motion __motion)
     (progn
       (if __motion (setq _motion (car __motion)))
       _motion)))
  (:serialization-length
   ()
   (+
    ;; front_end/stereoLandmarks[] _msgs
    (apply #'+ (send-all _msgs :serialization-length)) 4
    ;; front_end/interFrameTracks[] _tracks
    (apply #'+ (send-all _tracks :serialization-length)) 4
    ;; sensor_msgs/Image[] _motion
    (apply #'+ (send-all _motion :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/stereoLandmarks[] _msgs
     (write-long (length _msgs) s)
     (dolist (elem _msgs)
       (send elem :serialize s)
       )
     ;; front_end/interFrameTracks[] _tracks
     (write-long (length _tracks) s)
     (dolist (elem _tracks)
       (send elem :serialize s)
       )
     ;; sensor_msgs/Image[] _motion
     (write-long (length _motion) s)
     (dolist (elem _motion)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/stereoLandmarks[] _msgs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _msgs (let (r) (dotimes (i n) (push (instance front_end::stereoLandmarks :init) r)) r))
     (dolist (elem- _msgs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; front_end/interFrameTracks[] _tracks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tracks (let (r) (dotimes (i n) (push (instance front_end::interFrameTracks :init) r)) r))
     (dolist (elem- _tracks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/Image[] _motion
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _motion (let (r) (dotimes (i n) (push (instance sensor_msgs::Image :init) r)) r))
     (dolist (elem- _motion)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get front_end::windowStatus :md5sum-) "adb1806280520464955e7665ce04362e")
(setf (get front_end::windowStatus :datatype-) "front_end/windowStatus")
(setf (get front_end::windowStatus :definition-)
      "front_end/stereoLandmarks[] msgs
front_end/interFrameTracks[] tracks
sensor_msgs/Image[] motion

================================================================================
MSG: front_end/stereoLandmarks
string detID
string descrID
front_end/kPoint[] leftFeatures
sensor_msgs/Image leftDescr
front_end/kPoint[] rightFeatures
sensor_msgs/Image rightDescr
front_end/cvMatch[] matches
front_end/ProcTime[] proc

================================================================================
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id

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

================================================================================
MSG: front_end/cvMatch
uint32 queryIdx
uint32 trainIdx
uint32 imgIdx
float32 distance

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds

================================================================================
MSG: front_end/interFrameTracks
front_end/cvMatch[] tracks 
sensor_msgs/Image motionInliers
")



(provide :front_end/windowStatus "adb1806280520464955e7665ce04362e")


