;; Auto-generated. Do not edit!


(when (boundp 'front_end::windowMatching)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'windowMatching (find-package "FRONT_END")))
(unless (find-package "FRONT_END::WINDOWMATCHING")
  (make-package "FRONT_END::WINDOWMATCHING"))
(unless (find-package "FRONT_END::WINDOWMATCHINGREQUEST")
  (make-package "FRONT_END::WINDOWMATCHINGREQUEST"))
(unless (find-package "FRONT_END::WINDOWMATCHINGRESPONSE")
  (make-package "FRONT_END::WINDOWMATCHINGRESPONSE"))

(in-package "ROS")





(defclass front_end::windowMatchingRequest
  :super ros::object
  :slots (_reset _latestFrame ))

(defmethod front_end::windowMatchingRequest
  (:init
   (&key
    ((:reset __reset) nil)
    ((:latestFrame __latestFrame) (instance front_end::stereoLandmarks :init))
    )
   (send-super :init)
   (setq _reset __reset)
   (setq _latestFrame __latestFrame)
   self)
  (:reset
   (&optional __reset)
   (if __reset (setq _reset __reset)) _reset)
  (:latestFrame
   (&rest __latestFrame)
   (if (keywordp (car __latestFrame))
       (send* _latestFrame __latestFrame)
     (progn
       (if __latestFrame (setq _latestFrame (car __latestFrame)))
       _latestFrame)))
  (:serialization-length
   ()
   (+
    ;; bool _reset
    1
    ;; front_end/stereoLandmarks _latestFrame
    (send _latestFrame :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reset
       (if _reset (write-byte -1 s) (write-byte 0 s))
     ;; front_end/stereoLandmarks _latestFrame
       (send _latestFrame :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reset
     (setq _reset (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; front_end/stereoLandmarks _latestFrame
     (send _latestFrame :deserialize buf ptr-) (incf ptr- (send _latestFrame :serialization-length))
   ;;
   self)
  )

(defclass front_end::windowMatchingResponse
  :super ros::object
  :slots (_state ))

(defmethod front_end::windowMatchingResponse
  (:init
   (&key
    ((:state __state) (instance front_end::windowStatus :init))
    )
   (send-super :init)
   (setq _state __state)
   self)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; front_end/windowStatus _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/windowStatus _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/windowStatus _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(defclass front_end::windowMatching
  :super ros::object
  :slots ())

(setf (get front_end::windowMatching :md5sum-) "470c2089accb6822fcb69d05c9fefb39")
(setf (get front_end::windowMatching :datatype-) "front_end/windowMatching")
(setf (get front_end::windowMatching :request) front_end::windowMatchingRequest)
(setf (get front_end::windowMatching :response) front_end::windowMatchingResponse)

(defmethod front_end::windowMatchingRequest
  (:response () (instance front_end::windowMatchingResponse :init)))

(setf (get front_end::windowMatchingRequest :md5sum-) "470c2089accb6822fcb69d05c9fefb39")
(setf (get front_end::windowMatchingRequest :datatype-) "front_end/windowMatchingRequest")
(setf (get front_end::windowMatchingRequest :definition-)
      "bool reset
front_end/stereoLandmarks latestFrame

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
---
front_end/windowStatus state


================================================================================
MSG: front_end/windowStatus
front_end/stereoLandmarks[] msgs
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
")

(setf (get front_end::windowMatchingResponse :md5sum-) "470c2089accb6822fcb69d05c9fefb39")
(setf (get front_end::windowMatchingResponse :datatype-) "front_end/windowMatchingResponse")
(setf (get front_end::windowMatchingResponse :definition-)
      "bool reset
front_end/stereoLandmarks latestFrame

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
---
front_end/windowStatus state


================================================================================
MSG: front_end/windowStatus
front_end/stereoLandmarks[] msgs
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
")



(provide :front_end/windowMatching "470c2089accb6822fcb69d05c9fefb39")


