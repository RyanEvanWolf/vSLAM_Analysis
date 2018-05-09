;; Auto-generated. Do not edit!


(when (boundp 'front_end::loopStereoFrame)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'loopStereoFrame (find-package "FRONT_END")))
(unless (find-package "FRONT_END::LOOPSTEREOFRAME")
  (make-package "FRONT_END::LOOPSTEREOFRAME"))

(in-package "ROS")
;;//! \htmlinclude loopStereoFrame.msg.html


(defclass front_end::loopStereoFrame
  :super ros::object
  :slots (_frame_id _curve_id _processingTime _leftFeatures _rightFeatures ))

(defmethod front_end::loopStereoFrame
  (:init
   (&key
    ((:frame_id __frame_id) 0)
    ((:curve_id __curve_id) "")
    ((:processingTime __processingTime) (let (r) (dotimes (i 0) (push (instance front_end::ProcTime :init) r)) r))
    ((:leftFeatures __leftFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:rightFeatures __rightFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    )
   (send-super :init)
   (setq _frame_id (round __frame_id))
   (setq _curve_id (string __curve_id))
   (setq _processingTime __processingTime)
   (setq _leftFeatures __leftFeatures)
   (setq _rightFeatures __rightFeatures)
   self)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:curve_id
   (&optional __curve_id)
   (if __curve_id (setq _curve_id __curve_id)) _curve_id)
  (:processingTime
   (&rest __processingTime)
   (if (keywordp (car __processingTime))
       (send* _processingTime __processingTime)
     (progn
       (if __processingTime (setq _processingTime (car __processingTime)))
       _processingTime)))
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
    ;; int32 _frame_id
    4
    ;; string _curve_id
    4 (length _curve_id)
    ;; front_end/ProcTime[] _processingTime
    (apply #'+ (send-all _processingTime :serialization-length)) 4
    ;; front_end/kPoint[] _leftFeatures
    (apply #'+ (send-all _leftFeatures :serialization-length)) 4
    ;; front_end/kPoint[] _rightFeatures
    (apply #'+ (send-all _rightFeatures :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _frame_id
       (write-long _frame_id s)
     ;; string _curve_id
       (write-long (length _curve_id) s) (princ _curve_id s)
     ;; front_end/ProcTime[] _processingTime
     (write-long (length _processingTime) s)
     (dolist (elem _processingTime)
       (send elem :serialize s)
       )
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
   ;; int32 _frame_id
     (setq _frame_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _curve_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _curve_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; front_end/ProcTime[] _processingTime
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _processingTime (let (r) (dotimes (i n) (push (instance front_end::ProcTime :init) r)) r))
     (dolist (elem- _processingTime)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
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

(setf (get front_end::loopStereoFrame :md5sum-) "a52e277306b94a230f130fabeb9b1a7a")
(setf (get front_end::loopStereoFrame :datatype-) "front_end/loopStereoFrame")
(setf (get front_end::loopStereoFrame :definition-)
      "int32 frame_id
string curve_id
front_end/ProcTime[] processingTime
front_end/kPoint[] leftFeatures
front_end/kPoint[] rightFeatures
 

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds

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

")



(provide :front_end/loopStereoFrame "a52e277306b94a230f130fabeb9b1a7a")


