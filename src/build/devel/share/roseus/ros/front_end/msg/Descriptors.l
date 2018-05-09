;; Auto-generated. Do not edit!


(when (boundp 'front_end::Descriptors)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'Descriptors (find-package "FRONT_END")))
(unless (find-package "FRONT_END::DESCRIPTORS")
  (make-package "FRONT_END::DESCRIPTORS"))

(in-package "ROS")
;;//! \htmlinclude Descriptors.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass front_end::Descriptors
  :super ros::object
  :slots (_proc _descriptID _left_featureMask _right_featureMask _leftDescriptors _rightDescriptors ))

(defmethod front_end::Descriptors
  (:init
   (&key
    ((:proc __proc) (let (r) (dotimes (i 0) (push (instance front_end::ProcTime :init) r)) r))
    ((:descriptID __descriptID) 0)
    ((:left_featureMask __left_featureMask) (make-array 0 :initial-element 0 :element-type :integer))
    ((:right_featureMask __right_featureMask) (make-array 0 :initial-element 0 :element-type :integer))
    ((:leftDescriptors __leftDescriptors) (instance sensor_msgs::Image :init))
    ((:rightDescriptors __rightDescriptors) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _proc __proc)
   (setq _descriptID (round __descriptID))
   (setq _left_featureMask __left_featureMask)
   (setq _right_featureMask __right_featureMask)
   (setq _leftDescriptors __leftDescriptors)
   (setq _rightDescriptors __rightDescriptors)
   self)
  (:proc
   (&rest __proc)
   (if (keywordp (car __proc))
       (send* _proc __proc)
     (progn
       (if __proc (setq _proc (car __proc)))
       _proc)))
  (:descriptID
   (&optional __descriptID)
   (if __descriptID (setq _descriptID __descriptID)) _descriptID)
  (:left_featureMask
   (&optional __left_featureMask)
   (if __left_featureMask (setq _left_featureMask __left_featureMask)) _left_featureMask)
  (:right_featureMask
   (&optional __right_featureMask)
   (if __right_featureMask (setq _right_featureMask __right_featureMask)) _right_featureMask)
  (:leftDescriptors
   (&rest __leftDescriptors)
   (if (keywordp (car __leftDescriptors))
       (send* _leftDescriptors __leftDescriptors)
     (progn
       (if __leftDescriptors (setq _leftDescriptors (car __leftDescriptors)))
       _leftDescriptors)))
  (:rightDescriptors
   (&rest __rightDescriptors)
   (if (keywordp (car __rightDescriptors))
       (send* _rightDescriptors __rightDescriptors)
     (progn
       (if __rightDescriptors (setq _rightDescriptors (car __rightDescriptors)))
       _rightDescriptors)))
  (:serialization-length
   ()
   (+
    ;; front_end/ProcTime[] _proc
    (apply #'+ (send-all _proc :serialization-length)) 4
    ;; int32 _descriptID
    4
    ;; int32[] _left_featureMask
    (* 4    (length _left_featureMask)) 4
    ;; int32[] _right_featureMask
    (* 4    (length _right_featureMask)) 4
    ;; sensor_msgs/Image _leftDescriptors
    (send _leftDescriptors :serialization-length)
    ;; sensor_msgs/Image _rightDescriptors
    (send _rightDescriptors :serialization-length)
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
     ;; int32 _descriptID
       (write-long _descriptID s)
     ;; int32[] _left_featureMask
     (write-long (length _left_featureMask) s)
     (dotimes (i (length _left_featureMask))
       (write-long (elt _left_featureMask i) s)
       )
     ;; int32[] _right_featureMask
     (write-long (length _right_featureMask) s)
     (dotimes (i (length _right_featureMask))
       (write-long (elt _right_featureMask i) s)
       )
     ;; sensor_msgs/Image _leftDescriptors
       (send _leftDescriptors :serialize s)
     ;; sensor_msgs/Image _rightDescriptors
       (send _rightDescriptors :serialize s)
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
   ;; int32 _descriptID
     (setq _descriptID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _left_featureMask
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _left_featureMask (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _left_featureMask i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _right_featureMask
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _right_featureMask (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _right_featureMask i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; sensor_msgs/Image _leftDescriptors
     (send _leftDescriptors :deserialize buf ptr-) (incf ptr- (send _leftDescriptors :serialization-length))
   ;; sensor_msgs/Image _rightDescriptors
     (send _rightDescriptors :deserialize buf ptr-) (incf ptr- (send _rightDescriptors :serialization-length))
   ;;
   self)
  )

(setf (get front_end::Descriptors :md5sum-) "eea05d4f348e83d7c6137f4b35cc7e3b")
(setf (get front_end::Descriptors :datatype-) "front_end/Descriptors")
(setf (get front_end::Descriptors :definition-)
      "front_end/ProcTime[] proc
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



(provide :front_end/Descriptors "eea05d4f348e83d7c6137f4b35cc7e3b")


