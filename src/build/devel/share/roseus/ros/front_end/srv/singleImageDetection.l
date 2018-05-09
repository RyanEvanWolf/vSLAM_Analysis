;; Auto-generated. Do not edit!


(when (boundp 'front_end::singleImageDetection)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'singleImageDetection (find-package "FRONT_END")))
(unless (find-package "FRONT_END::SINGLEIMAGEDETECTION")
  (make-package "FRONT_END::SINGLEIMAGEDETECTION"))
(unless (find-package "FRONT_END::SINGLEIMAGEDETECTIONREQUEST")
  (make-package "FRONT_END::SINGLEIMAGEDETECTIONREQUEST"))
(unless (find-package "FRONT_END::SINGLEIMAGEDETECTIONRESPONSE")
  (make-package "FRONT_END::SINGLEIMAGEDETECTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass front_end::singleImageDetectionRequest
  :super ros::object
  :slots (_detectorName _det_attrib _returnKP _leftImg _rightImg ))

(defmethod front_end::singleImageDetectionRequest
  (:init
   (&key
    ((:detectorName __detectorName) "")
    ((:det_attrib __det_attrib) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:returnKP __returnKP) nil)
    ((:leftImg __leftImg) (instance sensor_msgs::Image :init))
    ((:rightImg __rightImg) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _detectorName (string __detectorName))
   (setq _det_attrib __det_attrib)
   (setq _returnKP __returnKP)
   (setq _leftImg __leftImg)
   (setq _rightImg __rightImg)
   self)
  (:detectorName
   (&optional __detectorName)
   (if __detectorName (setq _detectorName __detectorName)) _detectorName)
  (:det_attrib
   (&optional __det_attrib)
   (if __det_attrib (setq _det_attrib __det_attrib)) _det_attrib)
  (:returnKP
   (&optional __returnKP)
   (if __returnKP (setq _returnKP __returnKP)) _returnKP)
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
    ;; string _detectorName
    4 (length _detectorName)
    ;; string[] _det_attrib
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _det_attrib)) 4
    ;; bool _returnKP
    1
    ;; sensor_msgs/Image _leftImg
    (send _leftImg :serialization-length)
    ;; sensor_msgs/Image _rightImg
    (send _rightImg :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _detectorName
       (write-long (length _detectorName) s) (princ _detectorName s)
     ;; string[] _det_attrib
     (write-long (length _det_attrib) s)
     (dolist (elem _det_attrib)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool _returnKP
       (if _returnKP (write-byte -1 s) (write-byte 0 s))
     ;; sensor_msgs/Image _leftImg
       (send _leftImg :serialize s)
     ;; sensor_msgs/Image _rightImg
       (send _rightImg :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _detectorName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _detectorName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _det_attrib
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _det_attrib (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _det_attrib i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool _returnKP
     (setq _returnKP (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; sensor_msgs/Image _leftImg
     (send _leftImg :deserialize buf ptr-) (incf ptr- (send _leftImg :serialization-length))
   ;; sensor_msgs/Image _rightImg
     (send _rightImg :deserialize buf ptr-) (incf ptr- (send _rightImg :serialization-length))
   ;;
   self)
  )

(defclass front_end::singleImageDetectionResponse
  :super ros::object
  :slots (_outputFrames ))

(defmethod front_end::singleImageDetectionResponse
  (:init
   (&key
    ((:outputFrames __outputFrames) (let (r) (dotimes (i 0) (push (instance front_end::frameDetection :init) r)) r))
    )
   (send-super :init)
   (setq _outputFrames __outputFrames)
   self)
  (:outputFrames
   (&rest __outputFrames)
   (if (keywordp (car __outputFrames))
       (send* _outputFrames __outputFrames)
     (progn
       (if __outputFrames (setq _outputFrames (car __outputFrames)))
       _outputFrames)))
  (:serialization-length
   ()
   (+
    ;; front_end/frameDetection[] _outputFrames
    (apply #'+ (send-all _outputFrames :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/frameDetection[] _outputFrames
     (write-long (length _outputFrames) s)
     (dolist (elem _outputFrames)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/frameDetection[] _outputFrames
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _outputFrames (let (r) (dotimes (i n) (push (instance front_end::frameDetection :init) r)) r))
     (dolist (elem- _outputFrames)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass front_end::singleImageDetection
  :super ros::object
  :slots ())

(setf (get front_end::singleImageDetection :md5sum-) "48205b8c8040e40e02f025ebed0f5df8")
(setf (get front_end::singleImageDetection :datatype-) "front_end/singleImageDetection")
(setf (get front_end::singleImageDetection :request) front_end::singleImageDetectionRequest)
(setf (get front_end::singleImageDetection :response) front_end::singleImageDetectionResponse)

(defmethod front_end::singleImageDetectionRequest
  (:response () (instance front_end::singleImageDetectionResponse :init)))

(setf (get front_end::singleImageDetectionRequest :md5sum-) "48205b8c8040e40e02f025ebed0f5df8")
(setf (get front_end::singleImageDetectionRequest :datatype-) "front_end/singleImageDetectionRequest")
(setf (get front_end::singleImageDetectionRequest :definition-)
      "string detectorName
string[] det_attrib
bool returnKP
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
front_end/frameDetection[] outputFrames


================================================================================
MSG: front_end/frameDetection
front_end/kPoint[] leftFeatures
uint16 nLeft
float32 l_xAvg
float32 l_yAvg
float32 l_xStd
float32 l_yStd
front_end/kPoint[] rightFeatures
uint16 nRight
float32 r_xAvg
float32 r_yAvg
float32 r_xStd
float32 r_yStd
front_end/ProcTime[] processingTime 

================================================================================
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
sensor_msgs/Image[] descriptors
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

(setf (get front_end::singleImageDetectionResponse :md5sum-) "48205b8c8040e40e02f025ebed0f5df8")
(setf (get front_end::singleImageDetectionResponse :datatype-) "front_end/singleImageDetectionResponse")
(setf (get front_end::singleImageDetectionResponse :definition-)
      "string detectorName
string[] det_attrib
bool returnKP
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
front_end/frameDetection[] outputFrames


================================================================================
MSG: front_end/frameDetection
front_end/kPoint[] leftFeatures
uint16 nLeft
float32 l_xAvg
float32 l_yAvg
float32 l_xStd
float32 l_yStd
front_end/kPoint[] rightFeatures
uint16 nRight
float32 r_xAvg
float32 r_yAvg
float32 r_xStd
float32 r_yStd
front_end/ProcTime[] processingTime 

================================================================================
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
sensor_msgs/Image[] descriptors
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



(provide :front_end/singleImageDetection "48205b8c8040e40e02f025ebed0f5df8")


