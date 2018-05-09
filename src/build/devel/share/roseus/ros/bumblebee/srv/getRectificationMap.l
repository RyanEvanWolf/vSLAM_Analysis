;; Auto-generated. Do not edit!


(when (boundp 'bumblebee::getRectificationMap)
  (if (not (find-package "BUMBLEBEE"))
    (make-package "BUMBLEBEE"))
  (shadow 'getRectificationMap (find-package "BUMBLEBEE")))
(unless (find-package "BUMBLEBEE::GETRECTIFICATIONMAP")
  (make-package "BUMBLEBEE::GETRECTIFICATIONMAP"))
(unless (find-package "BUMBLEBEE::GETRECTIFICATIONMAPREQUEST")
  (make-package "BUMBLEBEE::GETRECTIFICATIONMAPREQUEST"))
(unless (find-package "BUMBLEBEE::GETRECTIFICATIONMAPRESPONSE")
  (make-package "BUMBLEBEE::GETRECTIFICATIONMAPRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass bumblebee::getRectificationMapRequest
  :super ros::object
  :slots (_floatingPoint ))

(defmethod bumblebee::getRectificationMapRequest
  (:init
   (&key
    ((:floatingPoint __floatingPoint) nil)
    )
   (send-super :init)
   (setq _floatingPoint __floatingPoint)
   self)
  (:floatingPoint
   (&optional __floatingPoint)
   (if __floatingPoint (setq _floatingPoint __floatingPoint)) _floatingPoint)
  (:serialization-length
   ()
   (+
    ;; bool _floatingPoint
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _floatingPoint
       (if _floatingPoint (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _floatingPoint
     (setq _floatingPoint (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass bumblebee::getRectificationMapResponse
  :super ros::object
  :slots (_leftx _lefty _rightx _righty ))

(defmethod bumblebee::getRectificationMapResponse
  (:init
   (&key
    ((:leftx __leftx) (instance sensor_msgs::Image :init))
    ((:lefty __lefty) (instance sensor_msgs::Image :init))
    ((:rightx __rightx) (instance sensor_msgs::Image :init))
    ((:righty __righty) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _leftx __leftx)
   (setq _lefty __lefty)
   (setq _rightx __rightx)
   (setq _righty __righty)
   self)
  (:leftx
   (&rest __leftx)
   (if (keywordp (car __leftx))
       (send* _leftx __leftx)
     (progn
       (if __leftx (setq _leftx (car __leftx)))
       _leftx)))
  (:lefty
   (&rest __lefty)
   (if (keywordp (car __lefty))
       (send* _lefty __lefty)
     (progn
       (if __lefty (setq _lefty (car __lefty)))
       _lefty)))
  (:rightx
   (&rest __rightx)
   (if (keywordp (car __rightx))
       (send* _rightx __rightx)
     (progn
       (if __rightx (setq _rightx (car __rightx)))
       _rightx)))
  (:righty
   (&rest __righty)
   (if (keywordp (car __righty))
       (send* _righty __righty)
     (progn
       (if __righty (setq _righty (car __righty)))
       _righty)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _leftx
    (send _leftx :serialization-length)
    ;; sensor_msgs/Image _lefty
    (send _lefty :serialization-length)
    ;; sensor_msgs/Image _rightx
    (send _rightx :serialization-length)
    ;; sensor_msgs/Image _righty
    (send _righty :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _leftx
       (send _leftx :serialize s)
     ;; sensor_msgs/Image _lefty
       (send _lefty :serialize s)
     ;; sensor_msgs/Image _rightx
       (send _rightx :serialize s)
     ;; sensor_msgs/Image _righty
       (send _righty :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _leftx
     (send _leftx :deserialize buf ptr-) (incf ptr- (send _leftx :serialization-length))
   ;; sensor_msgs/Image _lefty
     (send _lefty :deserialize buf ptr-) (incf ptr- (send _lefty :serialization-length))
   ;; sensor_msgs/Image _rightx
     (send _rightx :deserialize buf ptr-) (incf ptr- (send _rightx :serialization-length))
   ;; sensor_msgs/Image _righty
     (send _righty :deserialize buf ptr-) (incf ptr- (send _righty :serialization-length))
   ;;
   self)
  )

(defclass bumblebee::getRectificationMap
  :super ros::object
  :slots ())

(setf (get bumblebee::getRectificationMap :md5sum-) "dbd8732e5a390dbfdd19a82d4c0304e6")
(setf (get bumblebee::getRectificationMap :datatype-) "bumblebee/getRectificationMap")
(setf (get bumblebee::getRectificationMap :request) bumblebee::getRectificationMapRequest)
(setf (get bumblebee::getRectificationMap :response) bumblebee::getRectificationMapResponse)

(defmethod bumblebee::getRectificationMapRequest
  (:response () (instance bumblebee::getRectificationMapResponse :init)))

(setf (get bumblebee::getRectificationMapRequest :md5sum-) "dbd8732e5a390dbfdd19a82d4c0304e6")
(setf (get bumblebee::getRectificationMapRequest :datatype-) "bumblebee/getRectificationMapRequest")
(setf (get bumblebee::getRectificationMapRequest :definition-)
      "bool floatingPoint
---
sensor_msgs/Image leftx
sensor_msgs/Image lefty
sensor_msgs/Image rightx
sensor_msgs/Image righty

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

(setf (get bumblebee::getRectificationMapResponse :md5sum-) "dbd8732e5a390dbfdd19a82d4c0304e6")
(setf (get bumblebee::getRectificationMapResponse :datatype-) "bumblebee/getRectificationMapResponse")
(setf (get bumblebee::getRectificationMapResponse :definition-)
      "bool floatingPoint
---
sensor_msgs/Image leftx
sensor_msgs/Image lefty
sensor_msgs/Image rightx
sensor_msgs/Image righty

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



(provide :bumblebee/getRectificationMap "dbd8732e5a390dbfdd19a82d4c0304e6")


