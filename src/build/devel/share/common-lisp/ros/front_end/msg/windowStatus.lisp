; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude windowStatus.msg.html

(cl:defclass <windowStatus> (roslisp-msg-protocol:ros-message)
  ((msgs
    :reader msgs
    :initarg :msgs
    :type (cl:vector front_end-msg:stereoLandmarks)
   :initform (cl:make-array 0 :element-type 'front_end-msg:stereoLandmarks :initial-element (cl:make-instance 'front_end-msg:stereoLandmarks)))
   (tracks
    :reader tracks
    :initarg :tracks
    :type (cl:vector front_end-msg:interFrameTracks)
   :initform (cl:make-array 0 :element-type 'front_end-msg:interFrameTracks :initial-element (cl:make-instance 'front_end-msg:interFrameTracks)))
   (motion
    :reader motion
    :initarg :motion
    :type (cl:vector sensor_msgs-msg:Image)
   :initform (cl:make-array 0 :element-type 'sensor_msgs-msg:Image :initial-element (cl:make-instance 'sensor_msgs-msg:Image))))
)

(cl:defclass windowStatus (<windowStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <windowStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'windowStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<windowStatus> is deprecated: use front_end-msg:windowStatus instead.")))

(cl:ensure-generic-function 'msgs-val :lambda-list '(m))
(cl:defmethod msgs-val ((m <windowStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:msgs-val is deprecated.  Use front_end-msg:msgs instead.")
  (msgs m))

(cl:ensure-generic-function 'tracks-val :lambda-list '(m))
(cl:defmethod tracks-val ((m <windowStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:tracks-val is deprecated.  Use front_end-msg:tracks instead.")
  (tracks m))

(cl:ensure-generic-function 'motion-val :lambda-list '(m))
(cl:defmethod motion-val ((m <windowStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:motion-val is deprecated.  Use front_end-msg:motion instead.")
  (motion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <windowStatus>) ostream)
  "Serializes a message object of type '<windowStatus>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'msgs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'msgs))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tracks))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motion))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <windowStatus>) istream)
  "Deserializes a message object of type '<windowStatus>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'msgs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'msgs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:stereoLandmarks))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tracks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tracks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:interFrameTracks))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motion) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motion)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:Image))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<windowStatus>)))
  "Returns string type for a message object of type '<windowStatus>"
  "front_end/windowStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windowStatus)))
  "Returns string type for a message object of type 'windowStatus"
  "front_end/windowStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<windowStatus>)))
  "Returns md5sum for a message object of type '<windowStatus>"
  "adb1806280520464955e7665ce04362e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'windowStatus)))
  "Returns md5sum for a message object of type 'windowStatus"
  "adb1806280520464955e7665ce04362e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<windowStatus>)))
  "Returns full string definition for message of type '<windowStatus>"
  (cl:format cl:nil "front_end/stereoLandmarks[] msgs~%front_end/interFrameTracks[] tracks~%sensor_msgs/Image[] motion~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: front_end/interFrameTracks~%front_end/cvMatch[] tracks ~%sensor_msgs/Image motionInliers~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'windowStatus)))
  "Returns full string definition for message of type 'windowStatus"
  (cl:format cl:nil "front_end/stereoLandmarks[] msgs~%front_end/interFrameTracks[] tracks~%sensor_msgs/Image[] motion~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: front_end/interFrameTracks~%front_end/cvMatch[] tracks ~%sensor_msgs/Image motionInliers~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <windowStatus>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'msgs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tracks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motion) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <windowStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'windowStatus
    (cl:cons ':msgs (msgs msg))
    (cl:cons ':tracks (tracks msg))
    (cl:cons ':motion (motion msg))
))
