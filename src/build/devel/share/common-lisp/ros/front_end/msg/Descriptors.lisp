; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude Descriptors.msg.html

(cl:defclass <Descriptors> (roslisp-msg-protocol:ros-message)
  ((proc
    :reader proc
    :initarg :proc
    :type (cl:vector front_end-msg:ProcTime)
   :initform (cl:make-array 0 :element-type 'front_end-msg:ProcTime :initial-element (cl:make-instance 'front_end-msg:ProcTime)))
   (descriptID
    :reader descriptID
    :initarg :descriptID
    :type cl:integer
    :initform 0)
   (left_featureMask
    :reader left_featureMask
    :initarg :left_featureMask
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (right_featureMask
    :reader right_featureMask
    :initarg :right_featureMask
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (leftDescriptors
    :reader leftDescriptors
    :initarg :leftDescriptors
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rightDescriptors
    :reader rightDescriptors
    :initarg :rightDescriptors
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Descriptors (<Descriptors>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Descriptors>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Descriptors)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<Descriptors> is deprecated: use front_end-msg:Descriptors instead.")))

(cl:ensure-generic-function 'proc-val :lambda-list '(m))
(cl:defmethod proc-val ((m <Descriptors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:proc-val is deprecated.  Use front_end-msg:proc instead.")
  (proc m))

(cl:ensure-generic-function 'descriptID-val :lambda-list '(m))
(cl:defmethod descriptID-val ((m <Descriptors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:descriptID-val is deprecated.  Use front_end-msg:descriptID instead.")
  (descriptID m))

(cl:ensure-generic-function 'left_featureMask-val :lambda-list '(m))
(cl:defmethod left_featureMask-val ((m <Descriptors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:left_featureMask-val is deprecated.  Use front_end-msg:left_featureMask instead.")
  (left_featureMask m))

(cl:ensure-generic-function 'right_featureMask-val :lambda-list '(m))
(cl:defmethod right_featureMask-val ((m <Descriptors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:right_featureMask-val is deprecated.  Use front_end-msg:right_featureMask instead.")
  (right_featureMask m))

(cl:ensure-generic-function 'leftDescriptors-val :lambda-list '(m))
(cl:defmethod leftDescriptors-val ((m <Descriptors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:leftDescriptors-val is deprecated.  Use front_end-msg:leftDescriptors instead.")
  (leftDescriptors m))

(cl:ensure-generic-function 'rightDescriptors-val :lambda-list '(m))
(cl:defmethod rightDescriptors-val ((m <Descriptors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:rightDescriptors-val is deprecated.  Use front_end-msg:rightDescriptors instead.")
  (rightDescriptors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Descriptors>) ostream)
  "Serializes a message object of type '<Descriptors>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'proc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'proc))
  (cl:let* ((signed (cl:slot-value msg 'descriptID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'left_featureMask))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'left_featureMask))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'right_featureMask))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'right_featureMask))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftDescriptors) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightDescriptors) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Descriptors>) istream)
  "Deserializes a message object of type '<Descriptors>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'proc) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'proc)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:ProcTime))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'descriptID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'left_featureMask) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'left_featureMask)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'right_featureMask) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'right_featureMask)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftDescriptors) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightDescriptors) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Descriptors>)))
  "Returns string type for a message object of type '<Descriptors>"
  "front_end/Descriptors")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Descriptors)))
  "Returns string type for a message object of type 'Descriptors"
  "front_end/Descriptors")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Descriptors>)))
  "Returns md5sum for a message object of type '<Descriptors>"
  "eea05d4f348e83d7c6137f4b35cc7e3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Descriptors)))
  "Returns md5sum for a message object of type 'Descriptors"
  "eea05d4f348e83d7c6137f4b35cc7e3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Descriptors>)))
  "Returns full string definition for message of type '<Descriptors>"
  (cl:format cl:nil "front_end/ProcTime[] proc~%int32 descriptID~%int32[] left_featureMask~%int32[] right_featureMask~%sensor_msgs/Image leftDescriptors~%sensor_msgs/Image rightDescriptors~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Descriptors)))
  "Returns full string definition for message of type 'Descriptors"
  (cl:format cl:nil "front_end/ProcTime[] proc~%int32 descriptID~%int32[] left_featureMask~%int32[] right_featureMask~%sensor_msgs/Image leftDescriptors~%sensor_msgs/Image rightDescriptors~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Descriptors>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'proc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'left_featureMask) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'right_featureMask) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftDescriptors))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightDescriptors))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Descriptors>))
  "Converts a ROS message object to a list"
  (cl:list 'Descriptors
    (cl:cons ':proc (proc msg))
    (cl:cons ':descriptID (descriptID msg))
    (cl:cons ':left_featureMask (left_featureMask msg))
    (cl:cons ':right_featureMask (right_featureMask msg))
    (cl:cons ':leftDescriptors (leftDescriptors msg))
    (cl:cons ':rightDescriptors (rightDescriptors msg))
))
