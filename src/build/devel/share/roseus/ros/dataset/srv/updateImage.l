;; Auto-generated. Do not edit!


(when (boundp 'dataset::updateImage)
  (if (not (find-package "DATASET"))
    (make-package "DATASET"))
  (shadow 'updateImage (find-package "DATASET")))
(unless (find-package "DATASET::UPDATEIMAGE")
  (make-package "DATASET::UPDATEIMAGE"))
(unless (find-package "DATASET::UPDATEIMAGEREQUEST")
  (make-package "DATASET::UPDATEIMAGEREQUEST"))
(unless (find-package "DATASET::UPDATEIMAGERESPONSE")
  (make-package "DATASET::UPDATEIMAGERESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass dataset::updateImageRequest
  :super ros::object
  :slots (_windowName _newImage _display ))

(defmethod dataset::updateImageRequest
  (:init
   (&key
    ((:windowName __windowName) (instance std_msgs::String :init))
    ((:newImage __newImage) (instance sensor_msgs::Image :init))
    ((:display __display) nil)
    )
   (send-super :init)
   (setq _windowName __windowName)
   (setq _newImage __newImage)
   (setq _display __display)
   self)
  (:windowName
   (&rest __windowName)
   (if (keywordp (car __windowName))
       (send* _windowName __windowName)
     (progn
       (if __windowName (setq _windowName (car __windowName)))
       _windowName)))
  (:newImage
   (&rest __newImage)
   (if (keywordp (car __newImage))
       (send* _newImage __newImage)
     (progn
       (if __newImage (setq _newImage (car __newImage)))
       _newImage)))
  (:display
   (&optional __display)
   (if __display (setq _display __display)) _display)
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _windowName
    (send _windowName :serialization-length)
    ;; sensor_msgs/Image _newImage
    (send _newImage :serialization-length)
    ;; bool _display
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _windowName
       (send _windowName :serialize s)
     ;; sensor_msgs/Image _newImage
       (send _newImage :serialize s)
     ;; bool _display
       (if _display (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _windowName
     (send _windowName :deserialize buf ptr-) (incf ptr- (send _windowName :serialization-length))
   ;; sensor_msgs/Image _newImage
     (send _newImage :deserialize buf ptr-) (incf ptr- (send _newImage :serialization-length))
   ;; bool _display
     (setq _display (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass dataset::updateImageResponse
  :super ros::object
  :slots ())

(defmethod dataset::updateImageResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass dataset::updateImage
  :super ros::object
  :slots ())

(setf (get dataset::updateImage :md5sum-) "14086f831f7b9fc93a1aa90e9b41d9a6")
(setf (get dataset::updateImage :datatype-) "dataset/updateImage")
(setf (get dataset::updateImage :request) dataset::updateImageRequest)
(setf (get dataset::updateImage :response) dataset::updateImageResponse)

(defmethod dataset::updateImageRequest
  (:response () (instance dataset::updateImageResponse :init)))

(setf (get dataset::updateImageRequest :md5sum-) "14086f831f7b9fc93a1aa90e9b41d9a6")
(setf (get dataset::updateImageRequest :datatype-) "dataset/updateImageRequest")
(setf (get dataset::updateImageRequest :definition-)
      "std_msgs/String windowName
sensor_msgs/Image newImage
bool display

================================================================================
MSG: std_msgs/String
string data

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
---

")

(setf (get dataset::updateImageResponse :md5sum-) "14086f831f7b9fc93a1aa90e9b41d9a6")
(setf (get dataset::updateImageResponse :datatype-) "dataset/updateImageResponse")
(setf (get dataset::updateImageResponse :definition-)
      "std_msgs/String windowName
sensor_msgs/Image newImage
bool display

================================================================================
MSG: std_msgs/String
string data

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
---

")



(provide :dataset/updateImage "14086f831f7b9fc93a1aa90e9b41d9a6")


