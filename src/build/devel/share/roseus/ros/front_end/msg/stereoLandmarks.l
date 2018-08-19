;; Auto-generated. Do not edit!


(when (boundp 'front_end::stereoLandmarks)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'stereoLandmarks (find-package "FRONT_END")))
(unless (find-package "FRONT_END::STEREOLANDMARKS")
  (make-package "FRONT_END::STEREOLANDMARKS"))

(in-package "ROS")
;;//! \htmlinclude stereoLandmarks.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass front_end::stereoLandmarks
  :super ros::object
  :slots (_detID _descrID _leftFeatures _leftDescr _rightFeatures _rightDescr _matches _proc ))

(defmethod front_end::stereoLandmarks
  (:init
   (&key
    ((:detID __detID) "")
    ((:descrID __descrID) "")
    ((:leftFeatures __leftFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:leftDescr __leftDescr) (instance sensor_msgs::Image :init))
    ((:rightFeatures __rightFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:rightDescr __rightDescr) (instance sensor_msgs::Image :init))
    ((:matches __matches) (let (r) (dotimes (i 0) (push (instance front_end::cvMatch :init) r)) r))
    ((:proc __proc) (let (r) (dotimes (i 0) (push (instance front_end::ProcTime :init) r)) r))
    )
   (send-super :init)
   (setq _detID (string __detID))
   (setq _descrID (string __descrID))
   (setq _leftFeatures __leftFeatures)
   (setq _leftDescr __leftDescr)
   (setq _rightFeatures __rightFeatures)
   (setq _rightDescr __rightDescr)
   (setq _matches __matches)
   (setq _proc __proc)
   self)
  (:detID
   (&optional __detID)
   (if __detID (setq _detID __detID)) _detID)
  (:descrID
   (&optional __descrID)
   (if __descrID (setq _descrID __descrID)) _descrID)
  (:leftFeatures
   (&rest __leftFeatures)
   (if (keywordp (car __leftFeatures))
       (send* _leftFeatures __leftFeatures)
     (progn
       (if __leftFeatures (setq _leftFeatures (car __leftFeatures)))
       _leftFeatures)))
  (:leftDescr
   (&rest __leftDescr)
   (if (keywordp (car __leftDescr))
       (send* _leftDescr __leftDescr)
     (progn
       (if __leftDescr (setq _leftDescr (car __leftDescr)))
       _leftDescr)))
  (:rightFeatures
   (&rest __rightFeatures)
   (if (keywordp (car __rightFeatures))
       (send* _rightFeatures __rightFeatures)
     (progn
       (if __rightFeatures (setq _rightFeatures (car __rightFeatures)))
       _rightFeatures)))
  (:rightDescr
   (&rest __rightDescr)
   (if (keywordp (car __rightDescr))
       (send* _rightDescr __rightDescr)
     (progn
       (if __rightDescr (setq _rightDescr (car __rightDescr)))
       _rightDescr)))
  (:matches
   (&rest __matches)
   (if (keywordp (car __matches))
       (send* _matches __matches)
     (progn
       (if __matches (setq _matches (car __matches)))
       _matches)))
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
    ;; string _detID
    4 (length _detID)
    ;; string _descrID
    4 (length _descrID)
    ;; front_end/kPoint[] _leftFeatures
    (apply #'+ (send-all _leftFeatures :serialization-length)) 4
    ;; sensor_msgs/Image _leftDescr
    (send _leftDescr :serialization-length)
    ;; front_end/kPoint[] _rightFeatures
    (apply #'+ (send-all _rightFeatures :serialization-length)) 4
    ;; sensor_msgs/Image _rightDescr
    (send _rightDescr :serialization-length)
    ;; front_end/cvMatch[] _matches
    (apply #'+ (send-all _matches :serialization-length)) 4
    ;; front_end/ProcTime[] _proc
    (apply #'+ (send-all _proc :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _detID
       (write-long (length _detID) s) (princ _detID s)
     ;; string _descrID
       (write-long (length _descrID) s) (princ _descrID s)
     ;; front_end/kPoint[] _leftFeatures
     (write-long (length _leftFeatures) s)
     (dolist (elem _leftFeatures)
       (send elem :serialize s)
       )
     ;; sensor_msgs/Image _leftDescr
       (send _leftDescr :serialize s)
     ;; front_end/kPoint[] _rightFeatures
     (write-long (length _rightFeatures) s)
     (dolist (elem _rightFeatures)
       (send elem :serialize s)
       )
     ;; sensor_msgs/Image _rightDescr
       (send _rightDescr :serialize s)
     ;; front_end/cvMatch[] _matches
     (write-long (length _matches) s)
     (dolist (elem _matches)
       (send elem :serialize s)
       )
     ;; front_end/ProcTime[] _proc
     (write-long (length _proc) s)
     (dolist (elem _proc)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _detID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _detID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _descrID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _descrID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; front_end/kPoint[] _leftFeatures
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _leftFeatures (let (r) (dotimes (i n) (push (instance front_end::kPoint :init) r)) r))
     (dolist (elem- _leftFeatures)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/Image _leftDescr
     (send _leftDescr :deserialize buf ptr-) (incf ptr- (send _leftDescr :serialization-length))
   ;; front_end/kPoint[] _rightFeatures
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rightFeatures (let (r) (dotimes (i n) (push (instance front_end::kPoint :init) r)) r))
     (dolist (elem- _rightFeatures)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/Image _rightDescr
     (send _rightDescr :deserialize buf ptr-) (incf ptr- (send _rightDescr :serialization-length))
   ;; front_end/cvMatch[] _matches
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _matches (let (r) (dotimes (i n) (push (instance front_end::cvMatch :init) r)) r))
     (dolist (elem- _matches)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
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

(setf (get front_end::stereoLandmarks :md5sum-) "98c12b459ad7d1b907e89d7083880f69")
(setf (get front_end::stereoLandmarks :datatype-) "front_end/stereoLandmarks")
(setf (get front_end::stereoLandmarks :definition-)
      "string detID
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



(provide :front_end/stereoLandmarks "98c12b459ad7d1b907e89d7083880f69")


