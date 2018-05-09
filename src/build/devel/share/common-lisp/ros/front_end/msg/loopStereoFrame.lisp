; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude loopStereoFrame.msg.html

(cl:defclass <loopStereoFrame> (roslisp-msg-protocol:ros-message)
  ((frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:integer
    :initform 0)
   (curve_id
    :reader curve_id
    :initarg :curve_id
    :type cl:string
    :initform "")
   (processingTime
    :reader processingTime
    :initarg :processingTime
    :type (cl:vector front_end-msg:ProcTime)
   :initform (cl:make-array 0 :element-type 'front_end-msg:ProcTime :initial-element (cl:make-instance 'front_end-msg:ProcTime)))
   (leftFeatures
    :reader leftFeatures
    :initarg :leftFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (rightFeatures
    :reader rightFeatures
    :initarg :rightFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint))))
)

(cl:defclass loopStereoFrame (<loopStereoFrame>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <loopStereoFrame>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'loopStereoFrame)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<loopStereoFrame> is deprecated: use front_end-msg:loopStereoFrame instead.")))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <loopStereoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:frame_id-val is deprecated.  Use front_end-msg:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'curve_id-val :lambda-list '(m))
(cl:defmethod curve_id-val ((m <loopStereoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:curve_id-val is deprecated.  Use front_end-msg:curve_id instead.")
  (curve_id m))

(cl:ensure-generic-function 'processingTime-val :lambda-list '(m))
(cl:defmethod processingTime-val ((m <loopStereoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:processingTime-val is deprecated.  Use front_end-msg:processingTime instead.")
  (processingTime m))

(cl:ensure-generic-function 'leftFeatures-val :lambda-list '(m))
(cl:defmethod leftFeatures-val ((m <loopStereoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:leftFeatures-val is deprecated.  Use front_end-msg:leftFeatures instead.")
  (leftFeatures m))

(cl:ensure-generic-function 'rightFeatures-val :lambda-list '(m))
(cl:defmethod rightFeatures-val ((m <loopStereoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:rightFeatures-val is deprecated.  Use front_end-msg:rightFeatures instead.")
  (rightFeatures m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <loopStereoFrame>) ostream)
  "Serializes a message object of type '<loopStereoFrame>"
  (cl:let* ((signed (cl:slot-value msg 'frame_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'curve_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'curve_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'processingTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'processingTime))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'leftFeatures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'leftFeatures))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rightFeatures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rightFeatures))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <loopStereoFrame>) istream)
  "Deserializes a message object of type '<loopStereoFrame>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'curve_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'curve_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'processingTime) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'processingTime)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:ProcTime))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'leftFeatures) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'leftFeatures)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:kPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rightFeatures) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rightFeatures)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:kPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<loopStereoFrame>)))
  "Returns string type for a message object of type '<loopStereoFrame>"
  "front_end/loopStereoFrame")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'loopStereoFrame)))
  "Returns string type for a message object of type 'loopStereoFrame"
  "front_end/loopStereoFrame")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<loopStereoFrame>)))
  "Returns md5sum for a message object of type '<loopStereoFrame>"
  "a52e277306b94a230f130fabeb9b1a7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'loopStereoFrame)))
  "Returns md5sum for a message object of type 'loopStereoFrame"
  "a52e277306b94a230f130fabeb9b1a7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<loopStereoFrame>)))
  "Returns full string definition for message of type '<loopStereoFrame>"
  (cl:format cl:nil "int32 frame_id~%string curve_id~%front_end/ProcTime[] processingTime~%front_end/kPoint[] leftFeatures~%front_end/kPoint[] rightFeatures~% ~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%sensor_msgs/Image[] descriptors~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'loopStereoFrame)))
  "Returns full string definition for message of type 'loopStereoFrame"
  (cl:format cl:nil "int32 frame_id~%string curve_id~%front_end/ProcTime[] processingTime~%front_end/kPoint[] leftFeatures~%front_end/kPoint[] rightFeatures~% ~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%sensor_msgs/Image[] descriptors~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <loopStereoFrame>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'curve_id))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'processingTime) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'leftFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rightFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <loopStereoFrame>))
  "Converts a ROS message object to a list"
  (cl:list 'loopStereoFrame
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':curve_id (curve_id msg))
    (cl:cons ':processingTime (processingTime msg))
    (cl:cons ':leftFeatures (leftFeatures msg))
    (cl:cons ':rightFeatures (rightFeatures msg))
))
