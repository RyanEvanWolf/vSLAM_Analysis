;; Auto-generated. Do not edit!


(when (boundp 'front_end::stereoMatching)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'stereoMatching (find-package "FRONT_END")))
(unless (find-package "FRONT_END::STEREOMATCHING")
  (make-package "FRONT_END::STEREOMATCHING"))
(unless (find-package "FRONT_END::STEREOMATCHINGREQUEST")
  (make-package "FRONT_END::STEREOMATCHINGREQUEST"))
(unless (find-package "FRONT_END::STEREOMATCHINGRESPONSE")
  (make-package "FRONT_END::STEREOMATCHINGRESPONSE"))

(in-package "ROS")





(defclass front_end::stereoMatchingRequest
  :super ros::object
  :slots (_frame ))

(defmethod front_end::stereoMatchingRequest
  (:init
   (&key
    ((:frame __frame) (instance front_end::stereoFeatures :init))
    )
   (send-super :init)
   (setq _frame __frame)
   self)
  (:frame
   (&rest __frame)
   (if (keywordp (car __frame))
       (send* _frame __frame)
     (progn
       (if __frame (setq _frame (car __frame)))
       _frame)))
  (:serialization-length
   ()
   (+
    ;; front_end/stereoFeatures _frame
    (send _frame :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/stereoFeatures _frame
       (send _frame :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/stereoFeatures _frame
     (send _frame :deserialize buf ptr-) (incf ptr- (send _frame :serialization-length))
   ;;
   self)
  )

(defclass front_end::stereoMatchingResponse
  :super ros::object
  :slots (_out ))

(defmethod front_end::stereoMatchingResponse
  (:init
   (&key
    ((:out __out) (instance front_end::stereoLandmarks :init))
    )
   (send-super :init)
   (setq _out __out)
   self)
  (:out
   (&rest __out)
   (if (keywordp (car __out))
       (send* _out __out)
     (progn
       (if __out (setq _out (car __out)))
       _out)))
  (:serialization-length
   ()
   (+
    ;; front_end/stereoLandmarks _out
    (send _out :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/stereoLandmarks _out
       (send _out :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/stereoLandmarks _out
     (send _out :deserialize buf ptr-) (incf ptr- (send _out :serialization-length))
   ;;
   self)
  )

(defclass front_end::stereoMatching
  :super ros::object
  :slots ())

(setf (get front_end::stereoMatching :md5sum-) "75348319ccc3f979d087d64d783a5ddc")
(setf (get front_end::stereoMatching :datatype-) "front_end/stereoMatching")
(setf (get front_end::stereoMatching :request) front_end::stereoMatchingRequest)
(setf (get front_end::stereoMatching :response) front_end::stereoMatchingResponse)

(defmethod front_end::stereoMatchingRequest
  (:response () (instance front_end::stereoMatchingResponse :init)))

(setf (get front_end::stereoMatchingRequest :md5sum-) "75348319ccc3f979d087d64d783a5ddc")
(setf (get front_end::stereoMatchingRequest :datatype-) "front_end/stereoMatchingRequest")
(setf (get front_end::stereoMatchingRequest :definition-)
      "front_end/stereoFeatures frame

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
---
front_end/stereoLandmarks out


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
")

(setf (get front_end::stereoMatchingResponse :md5sum-) "75348319ccc3f979d087d64d783a5ddc")
(setf (get front_end::stereoMatchingResponse :datatype-) "front_end/stereoMatchingResponse")
(setf (get front_end::stereoMatchingResponse :definition-)
      "front_end/stereoFeatures frame

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
---
front_end/stereoLandmarks out


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
")



(provide :front_end/stereoMatching "75348319ccc3f979d087d64d783a5ddc")


