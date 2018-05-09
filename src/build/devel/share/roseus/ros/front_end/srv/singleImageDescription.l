;; Auto-generated. Do not edit!


(when (boundp 'front_end::singleImageDescription)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'singleImageDescription (find-package "FRONT_END")))
(unless (find-package "FRONT_END::SINGLEIMAGEDESCRIPTION")
  (make-package "FRONT_END::SINGLEIMAGEDESCRIPTION"))
(unless (find-package "FRONT_END::SINGLEIMAGEDESCRIPTIONREQUEST")
  (make-package "FRONT_END::SINGLEIMAGEDESCRIPTIONREQUEST"))
(unless (find-package "FRONT_END::SINGLEIMAGEDESCRIPTIONRESPONSE")
  (make-package "FRONT_END::SINGLEIMAGEDESCRIPTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass front_end::singleImageDescriptionRequest
  :super ros::object
  :slots (_leftImg _rightImg _leftFeatures _rightFeatures ))

(defmethod front_end::singleImageDescriptionRequest
  (:init
   (&key
    ((:leftImg __leftImg) (instance sensor_msgs::Image :init))
    ((:rightImg __rightImg) (instance sensor_msgs::Image :init))
    ((:leftFeatures __leftFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:rightFeatures __rightFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    )
   (send-super :init)
   (setq _leftImg __leftImg)
   (setq _rightImg __rightImg)
   (setq _leftFeatures __leftFeatures)
   (setq _rightFeatures __rightFeatures)
   self)
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
  (:leftFeatures
   (&rest __leftFeatures)
   (if (keywordp (car __leftFeatures))
       (send* _leftFeatures __leftFeatures)
     (progn
       (if __leftFeatures (setq _leftFeatures (car __leftFeatures)))
       _leftFeatures)))
  (:rightFeatures
   (&rest __rightFeatures)
   (if (keywordp (car __rightFeatures))
       (send* _rightFeatures __rightFeatures)
     (progn
       (if __rightFeatures (setq _rightFeatures (car __rightFeatures)))
       _rightFeatures)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _leftImg
    (send _leftImg :serialization-length)
    ;; sensor_msgs/Image _rightImg
    (send _rightImg :serialization-length)
    ;; front_end/kPoint[] _leftFeatures
    (apply #'+ (send-all _leftFeatures :serialization-length)) 4
    ;; front_end/kPoint[] _rightFeatures
    (apply #'+ (send-all _rightFeatures :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _leftImg
       (send _leftImg :serialize s)
     ;; sensor_msgs/Image _rightImg
       (send _rightImg :serialize s)
     ;; front_end/kPoint[] _leftFeatures
     (write-long (length _leftFeatures) s)
     (dolist (elem _leftFeatures)
       (send elem :serialize s)
       )
     ;; front_end/kPoint[] _rightFeatures
     (write-long (length _rightFeatures) s)
     (dolist (elem _rightFeatures)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _leftImg
     (send _leftImg :deserialize buf ptr-) (incf ptr- (send _leftImg :serialization-length))
   ;; sensor_msgs/Image _rightImg
     (send _rightImg :deserialize buf ptr-) (incf ptr- (send _rightImg :serialization-length))
   ;; front_end/kPoint[] _leftFeatures
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _leftFeatures (let (r) (dotimes (i n) (push (instance front_end::kPoint :init) r)) r))
     (dolist (elem- _leftFeatures)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; front_end/kPoint[] _rightFeatures
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rightFeatures (let (r) (dotimes (i n) (push (instance front_end::kPoint :init) r)) r))
     (dolist (elem- _rightFeatures)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass front_end::singleImageDescriptionResponse
  :super ros::object
  :slots (_results ))

(defmethod front_end::singleImageDescriptionResponse
  (:init
   (&key
    ((:results __results) (let (r) (dotimes (i 0) (push (instance front_end::Descriptors :init) r)) r))
    )
   (send-super :init)
   (setq _results __results)
   self)
  (:results
   (&rest __results)
   (if (keywordp (car __results))
       (send* _results __results)
     (progn
       (if __results (setq _results (car __results)))
       _results)))
  (:serialization-length
   ()
   (+
    ;; front_end/Descriptors[] _results
    (apply #'+ (send-all _results :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/Descriptors[] _results
     (write-long (length _results) s)
     (dolist (elem _results)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/Descriptors[] _results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _results (let (r) (dotimes (i n) (push (instance front_end::Descriptors :init) r)) r))
     (dolist (elem- _results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass front_end::singleImageDescription
  :super ros::object
  :slots ())

(setf (get front_end::singleImageDescription :md5sum-) "7a7f06c16254c680957e38a3e6f8b450")
(setf (get front_end::singleImageDescription :datatype-) "front_end/singleImageDescription")
(setf (get front_end::singleImageDescription :request) front_end::singleImageDescriptionRequest)
(setf (get front_end::singleImageDescription :response) front_end::singleImageDescriptionResponse)

(defmethod front_end::singleImageDescriptionRequest
  (:response () (instance front_end::singleImageDescriptionResponse :init)))

(setf (get front_end::singleImageDescriptionRequest :md5sum-) "7a7f06c16254c680957e38a3e6f8b450")
(setf (get front_end::singleImageDescriptionRequest :datatype-) "front_end/singleImageDescriptionRequest")
(setf (get front_end::singleImageDescriptionRequest :definition-)
      "sensor_msgs/Image leftImg
sensor_msgs/Image rightImg
front_end/kPoint[] leftFeatures
front_end/kPoint[] rightFeatures

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
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
---
front_end/Descriptors[] results



================================================================================
MSG: front_end/Descriptors
front_end/ProcTime[] proc
int32 descriptID
int32[] left_featureMask
int32[] right_featureMask
sensor_msgs/Image leftDescriptors
sensor_msgs/Image rightDescriptors

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds

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

(setf (get front_end::singleImageDescriptionResponse :md5sum-) "7a7f06c16254c680957e38a3e6f8b450")
(setf (get front_end::singleImageDescriptionResponse :datatype-) "front_end/singleImageDescriptionResponse")
(setf (get front_end::singleImageDescriptionResponse :definition-)
      "sensor_msgs/Image leftImg
sensor_msgs/Image rightImg
front_end/kPoint[] leftFeatures
front_end/kPoint[] rightFeatures

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
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
---
front_end/Descriptors[] results



================================================================================
MSG: front_end/Descriptors
front_end/ProcTime[] proc
int32 descriptID
int32[] left_featureMask
int32[] right_featureMask
sensor_msgs/Image leftDescriptors
sensor_msgs/Image rightDescriptors

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds

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



(provide :front_end/singleImageDescription "7a7f06c16254c680957e38a3e6f8b450")


