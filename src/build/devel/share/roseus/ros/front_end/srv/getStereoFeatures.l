;; Auto-generated. Do not edit!


(when (boundp 'front_end::getStereoFeatures)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'getStereoFeatures (find-package "FRONT_END")))
(unless (find-package "FRONT_END::GETSTEREOFEATURES")
  (make-package "FRONT_END::GETSTEREOFEATURES"))
(unless (find-package "FRONT_END::GETSTEREOFEATURESREQUEST")
  (make-package "FRONT_END::GETSTEREOFEATURESREQUEST"))
(unless (find-package "FRONT_END::GETSTEREOFEATURESRESPONSE")
  (make-package "FRONT_END::GETSTEREOFEATURESRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass front_end::getStereoFeaturesRequest
  :super ros::object
  :slots (_detID _descrID _leftImg _rightImg ))

(defmethod front_end::getStereoFeaturesRequest
  (:init
   (&key
    ((:detID __detID) "")
    ((:descrID __descrID) "")
    ((:leftImg __leftImg) (instance sensor_msgs::Image :init))
    ((:rightImg __rightImg) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _detID (string __detID))
   (setq _descrID (string __descrID))
   (setq _leftImg __leftImg)
   (setq _rightImg __rightImg)
   self)
  (:detID
   (&optional __detID)
   (if __detID (setq _detID __detID)) _detID)
  (:descrID
   (&optional __descrID)
   (if __descrID (setq _descrID __descrID)) _descrID)
  (:leftImg
   (&rest __leftImg)
   (if (keywordp (car __leftImg))
       (send* _leftImg __leftImg)
     (progn
       (if __leftImg (setq _leftImg (car __leftImg)))
       _leftImg)))
  (:rightImg
   (&rest __rightImg)
   (if (keywordp (car __rightImg))
       (send* _rightImg __rightImg)
     (progn
       (if __rightImg (setq _rightImg (car __rightImg)))
       _rightImg)))
  (:serialization-length
   ()
   (+
    ;; string _detID
    4 (length _detID)
    ;; string _descrID
    4 (length _descrID)
    ;; sensor_msgs/Image _leftImg
    (send _leftImg :serialization-length)
    ;; sensor_msgs/Image _rightImg
    (send _rightImg :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _detID
       (write-long (length _detID) s) (princ _detID s)
     ;; string _descrID
       (write-long (length _descrID) s) (princ _descrID s)
     ;; sensor_msgs/Image _leftImg
       (send _leftImg :serialize s)
     ;; sensor_msgs/Image _rightImg
       (send _rightImg :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _detID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _detID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _descrID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _descrID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; sensor_msgs/Image _leftImg
     (send _leftImg :deserialize buf ptr-) (incf ptr- (send _leftImg :serialization-length))
   ;; sensor_msgs/Image _rightImg
     (send _rightImg :deserialize buf ptr-) (incf ptr- (send _rightImg :serialization-length))
   ;;
   self)
  )

(defclass front_end::getStereoFeaturesResponse
  :super ros::object
  :slots (_latestFeatures ))

(defmethod front_end::getStereoFeaturesResponse
  (:init
   (&key
    ((:latestFeatures __latestFeatures) (instance front_end::stereoFeatures :init))
    )
   (send-super :init)
   (setq _latestFeatures __latestFeatures)
   self)
  (:latestFeatures
   (&rest __latestFeatures)
   (if (keywordp (car __latestFeatures))
       (send* _latestFeatures __latestFeatures)
     (progn
       (if __latestFeatures (setq _latestFeatures (car __latestFeatures)))
       _latestFeatures)))
  (:serialization-length
   ()
   (+
    ;; front_end/stereoFeatures _latestFeatures
    (send _latestFeatures :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/stereoFeatures _latestFeatures
       (send _latestFeatures :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/stereoFeatures _latestFeatures
     (send _latestFeatures :deserialize buf ptr-) (incf ptr- (send _latestFeatures :serialization-length))
   ;;
   self)
  )

(defclass front_end::getStereoFeatures
  :super ros::object
  :slots ())

(setf (get front_end::getStereoFeatures :md5sum-) "0a5f108044f2627eecc8992d4678dee9")
(setf (get front_end::getStereoFeatures :datatype-) "front_end/getStereoFeatures")
(setf (get front_end::getStereoFeatures :request) front_end::getStereoFeaturesRequest)
(setf (get front_end::getStereoFeatures :response) front_end::getStereoFeaturesResponse)

(defmethod front_end::getStereoFeaturesRequest
  (:response () (instance front_end::getStereoFeaturesResponse :init)))

(setf (get front_end::getStereoFeaturesRequest :md5sum-) "0a5f108044f2627eecc8992d4678dee9")
(setf (get front_end::getStereoFeaturesRequest :datatype-) "front_end/getStereoFeaturesRequest")
(setf (get front_end::getStereoFeaturesRequest :definition-)
      "string detID
string descrID
sensor_msgs/Image leftImg
sensor_msgs/Image rightImg

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
front_end/stereoFeatures latestFeatures


================================================================================
MSG: front_end/stereoFeatures
string detID
string descrID
front_end/kPoint[] leftFeatures
sensor_msgs/Image leftDescr
front_end/kPoint[] rightFeatures
sensor_msgs/Image rightDescr
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
MSG: front_end/ProcTime
string label
float64 seconds
")

(setf (get front_end::getStereoFeaturesResponse :md5sum-) "0a5f108044f2627eecc8992d4678dee9")
(setf (get front_end::getStereoFeaturesResponse :datatype-) "front_end/getStereoFeaturesResponse")
(setf (get front_end::getStereoFeaturesResponse :definition-)
      "string detID
string descrID
sensor_msgs/Image leftImg
sensor_msgs/Image rightImg

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
front_end/stereoFeatures latestFeatures


================================================================================
MSG: front_end/stereoFeatures
string detID
string descrID
front_end/kPoint[] leftFeatures
sensor_msgs/Image leftDescr
front_end/kPoint[] rightFeatures
sensor_msgs/Image rightDescr
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
MSG: front_end/ProcTime
string label
float64 seconds
")



(provide :front_end/getStereoFeatures "0a5f108044f2627eecc8992d4678dee9")


