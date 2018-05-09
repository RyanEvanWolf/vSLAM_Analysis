;; Auto-generated. Do not edit!


(when (boundp 'front_end::singleStereo)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'singleStereo (find-package "FRONT_END")))
(unless (find-package "FRONT_END::SINGLESTEREO")
  (make-package "FRONT_END::SINGLESTEREO"))
(unless (find-package "FRONT_END::SINGLESTEREOREQUEST")
  (make-package "FRONT_END::SINGLESTEREOREQUEST"))
(unless (find-package "FRONT_END::SINGLESTEREORESPONSE")
  (make-package "FRONT_END::SINGLESTEREORESPONSE"))

(in-package "ROS")





(defclass front_end::singleStereoRequest
  :super ros::object
  :slots (_leftFeatures _rightFeatures _descriptors _inputSettings ))

(defmethod front_end::singleStereoRequest
  (:init
   (&key
    ((:leftFeatures __leftFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:rightFeatures __rightFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:descriptors __descriptors) (let (r) (dotimes (i 0) (push (instance front_end::Descriptors :init) r)) r))
    ((:inputSettings __inputSettings) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _leftFeatures __leftFeatures)
   (setq _rightFeatures __rightFeatures)
   (setq _descriptors __descriptors)
   (setq _inputSettings __inputSettings)
   self)
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
  (:descriptors
   (&rest __descriptors)
   (if (keywordp (car __descriptors))
       (send* _descriptors __descriptors)
     (progn
       (if __descriptors (setq _descriptors (car __descriptors)))
       _descriptors)))
  (:inputSettings
   (&optional __inputSettings)
   (if __inputSettings (setq _inputSettings __inputSettings)) _inputSettings)
  (:serialization-length
   ()
   (+
    ;; front_end/kPoint[] _leftFeatures
    (apply #'+ (send-all _leftFeatures :serialization-length)) 4
    ;; front_end/kPoint[] _rightFeatures
    (apply #'+ (send-all _rightFeatures :serialization-length)) 4
    ;; front_end/Descriptors[] _descriptors
    (apply #'+ (send-all _descriptors :serialization-length)) 4
    ;; string[] _inputSettings
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _inputSettings)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;; front_end/Descriptors[] _descriptors
     (write-long (length _descriptors) s)
     (dolist (elem _descriptors)
       (send elem :serialize s)
       )
     ;; string[] _inputSettings
     (write-long (length _inputSettings) s)
     (dolist (elem _inputSettings)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;; front_end/Descriptors[] _descriptors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descriptors (let (r) (dotimes (i n) (push (instance front_end::Descriptors :init) r)) r))
     (dolist (elem- _descriptors)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _inputSettings
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _inputSettings (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _inputSettings i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass front_end::singleStereoResponse
  :super ros::object
  :slots (_proc ))

(defmethod front_end::singleStereoResponse
  (:init
   (&key
    ((:proc __proc) (let (r) (dotimes (i 0) (push (instance front_end::ProcTime :init) r)) r))
    )
   (send-super :init)
   (setq _proc __proc)
   self)
  (:proc
   (&rest __proc)
   (if (keywordp (car __proc))
       (send* _proc __proc)
     (progn
       (if __proc (setq _proc (car __proc)))
       _proc)))
  (:serialization-length
   ()
   (+
    ;; front_end/ProcTime[] _proc
    (apply #'+ (send-all _proc :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/ProcTime[] _proc
     (write-long (length _proc) s)
     (dolist (elem _proc)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/ProcTime[] _proc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _proc (let (r) (dotimes (i n) (push (instance front_end::ProcTime :init) r)) r))
     (dolist (elem- _proc)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass front_end::singleStereo
  :super ros::object
  :slots ())

(setf (get front_end::singleStereo :md5sum-) "ceff56939495f6592227196cef4aceff")
(setf (get front_end::singleStereo :datatype-) "front_end/singleStereo")
(setf (get front_end::singleStereo :request) front_end::singleStereoRequest)
(setf (get front_end::singleStereo :response) front_end::singleStereoResponse)

(defmethod front_end::singleStereoRequest
  (:response () (instance front_end::singleStereoResponse :init)))

(setf (get front_end::singleStereoRequest :md5sum-) "ceff56939495f6592227196cef4aceff")
(setf (get front_end::singleStereoRequest :datatype-) "front_end/singleStereoRequest")
(setf (get front_end::singleStereoRequest :definition-)
      "front_end/kPoint[] leftFeatures
front_end/kPoint[] rightFeatures
front_end/Descriptors[] descriptors
string[] inputSettings

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
---
front_end/ProcTime[] proc


================================================================================
MSG: front_end/ProcTime
string label
float64 seconds
")

(setf (get front_end::singleStereoResponse :md5sum-) "ceff56939495f6592227196cef4aceff")
(setf (get front_end::singleStereoResponse :datatype-) "front_end/singleStereoResponse")
(setf (get front_end::singleStereoResponse :definition-)
      "front_end/kPoint[] leftFeatures
front_end/kPoint[] rightFeatures
front_end/Descriptors[] descriptors
string[] inputSettings

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
---
front_end/ProcTime[] proc


================================================================================
MSG: front_end/ProcTime
string label
float64 seconds
")



(provide :front_end/singleStereo "ceff56939495f6592227196cef4aceff")


