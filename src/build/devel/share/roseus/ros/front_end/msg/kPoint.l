;; Auto-generated. Do not edit!


(when (boundp 'front_end::kPoint)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'kPoint (find-package "FRONT_END")))
(unless (find-package "FRONT_END::KPOINT")
  (make-package "FRONT_END::KPOINT"))

(in-package "ROS")
;;//! \htmlinclude kPoint.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass front_end::kPoint
  :super ros::object
  :slots (_x _y _size _angle _response _octave _class_id _descriptors ))

(defmethod front_end::kPoint
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:size __size) 0.0)
    ((:angle __angle) 0.0)
    ((:response __response) 0.0)
    ((:octave __octave) 0)
    ((:class_id __class_id) 0)
    ((:descriptors __descriptors) (let (r) (dotimes (i 0) (push (instance sensor_msgs::Image :init) r)) r))
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _size (float __size))
   (setq _angle (float __angle))
   (setq _response (float __response))
   (setq _octave (round __octave))
   (setq _class_id (round __class_id))
   (setq _descriptors __descriptors)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:octave
   (&optional __octave)
   (if __octave (setq _octave __octave)) _octave)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:descriptors
   (&rest __descriptors)
   (if (keywordp (car __descriptors))
       (send* _descriptors __descriptors)
     (progn
       (if __descriptors (setq _descriptors (car __descriptors)))
       _descriptors)))
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _size
    4
    ;; float32 _angle
    4
    ;; float32 _response
    4
    ;; int32 _octave
    4
    ;; int32 _class_id
    4
    ;; sensor_msgs/Image[] _descriptors
    (apply #'+ (send-all _descriptors :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _size
       (sys::poke _size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _response
       (sys::poke _response (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _octave
       (write-long _octave s)
     ;; int32 _class_id
       (write-long _class_id s)
     ;; sensor_msgs/Image[] _descriptors
     (write-long (length _descriptors) s)
     (dolist (elem _descriptors)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _size
     (setq _size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _response
     (setq _response (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _octave
     (setq _octave (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _class_id
     (setq _class_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; sensor_msgs/Image[] _descriptors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descriptors (let (r) (dotimes (i n) (push (instance sensor_msgs::Image :init) r)) r))
     (dolist (elem- _descriptors)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get front_end::kPoint :md5sum-) "42809bfff6ca27b1c8dd8bc19c75a12c")
(setf (get front_end::kPoint :datatype-) "front_end/kPoint")
(setf (get front_end::kPoint :definition-)
      "float32 x
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



(provide :front_end/kPoint "42809bfff6ca27b1c8dd8bc19c75a12c")


