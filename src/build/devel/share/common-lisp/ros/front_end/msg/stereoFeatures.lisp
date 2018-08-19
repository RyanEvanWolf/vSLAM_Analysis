; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude stereoFeatures.msg.html

(cl:defclass <stereoFeatures> (roslisp-msg-protocol:ros-message)
  ((detID
    :reader detID
    :initarg :detID
    :type cl:string
    :initform "")
   (descrID
    :reader descrID
    :initarg :descrID
    :type cl:string
    :initform "")
   (leftFeatures
    :reader leftFeatures
    :initarg :leftFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (leftDescr
    :reader leftDescr
    :initarg :leftDescr
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rightFeatures
    :reader rightFeatures
    :initarg :rightFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (rightDescr
    :reader rightDescr
    :initarg :rightDescr
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (proc
    :reader proc
    :initarg :proc
    :type (cl:vector front_end-msg:ProcTime)
   :initform (cl:make-array 0 :element-type 'front_end-msg:ProcTime :initial-element (cl:make-instance 'front_end-msg:ProcTime))))
)

(cl:defclass stereoFeatures (<stereoFeatures>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stereoFeatures>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stereoFeatures)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<stereoFeatures> is deprecated: use front_end-msg:stereoFeatures instead.")))

(cl:ensure-generic-function 'detID-val :lambda-list '(m))
(cl:defmethod detID-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:detID-val is deprecated.  Use front_end-msg:detID instead.")
  (detID m))

(cl:ensure-generic-function 'descrID-val :lambda-list '(m))
(cl:defmethod descrID-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:descrID-val is deprecated.  Use front_end-msg:descrID instead.")
  (descrID m))

(cl:ensure-generic-function 'leftFeatures-val :lambda-list '(m))
(cl:defmethod leftFeatures-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:leftFeatures-val is deprecated.  Use front_end-msg:leftFeatures instead.")
  (leftFeatures m))

(cl:ensure-generic-function 'leftDescr-val :lambda-list '(m))
(cl:defmethod leftDescr-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:leftDescr-val is deprecated.  Use front_end-msg:leftDescr instead.")
  (leftDescr m))

(cl:ensure-generic-function 'rightFeatures-val :lambda-list '(m))
(cl:defmethod rightFeatures-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:rightFeatures-val is deprecated.  Use front_end-msg:rightFeatures instead.")
  (rightFeatures m))

(cl:ensure-generic-function 'rightDescr-val :lambda-list '(m))
(cl:defmethod rightDescr-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:rightDescr-val is deprecated.  Use front_end-msg:rightDescr instead.")
  (rightDescr m))

(cl:ensure-generic-function 'proc-val :lambda-list '(m))
(cl:defmethod proc-val ((m <stereoFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:proc-val is deprecated.  Use front_end-msg:proc instead.")
  (proc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stereoFeatures>) ostream)
  "Serializes a message object of type '<stereoFeatures>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'detID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'detID))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'descrID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'descrID))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'leftFeatures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'leftFeatures))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftDescr) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rightFeatures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rightFeatures))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightDescr) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'proc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'proc))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stereoFeatures>) istream)
  "Deserializes a message object of type '<stereoFeatures>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'detID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'descrID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'descrID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftDescr) istream)
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightDescr) istream)
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stereoFeatures>)))
  "Returns string type for a message object of type '<stereoFeatures>"
  "front_end/stereoFeatures")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stereoFeatures)))
  "Returns string type for a message object of type 'stereoFeatures"
  "front_end/stereoFeatures")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stereoFeatures>)))
  "Returns md5sum for a message object of type '<stereoFeatures>"
  "439c0a796b9dac5b9df565eba5ed914c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stereoFeatures)))
  "Returns md5sum for a message object of type 'stereoFeatures"
  "439c0a796b9dac5b9df565eba5ed914c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stereoFeatures>)))
  "Returns full string definition for message of type '<stereoFeatures>"
  (cl:format cl:nil "string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/ProcTime[] proc~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stereoFeatures)))
  "Returns full string definition for message of type 'stereoFeatures"
  (cl:format cl:nil "string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/ProcTime[] proc~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stereoFeatures>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'detID))
     4 (cl:length (cl:slot-value msg 'descrID))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'leftFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftDescr))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rightFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightDescr))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'proc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stereoFeatures>))
  "Converts a ROS message object to a list"
  (cl:list 'stereoFeatures
    (cl:cons ':detID (detID msg))
    (cl:cons ':descrID (descrID msg))
    (cl:cons ':leftFeatures (leftFeatures msg))
    (cl:cons ':leftDescr (leftDescr msg))
    (cl:cons ':rightFeatures (rightFeatures msg))
    (cl:cons ':rightDescr (rightDescr msg))
    (cl:cons ':proc (proc msg))
))
