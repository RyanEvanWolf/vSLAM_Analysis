; Auto-generated. Do not edit!


(cl:in-package front_end-srv)


;//! \htmlinclude singleImageDetection-request.msg.html

(cl:defclass <singleImageDetection-request> (roslisp-msg-protocol:ros-message)
  ((detID
    :reader detID
    :initarg :detID
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (returnKP
    :reader returnKP
    :initarg :returnKP
    :type cl:boolean
    :initform cl:nil)
   (leftImg
    :reader leftImg
    :initarg :leftImg
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rightImg
    :reader rightImg
    :initarg :rightImg
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass singleImageDetection-request (<singleImageDetection-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <singleImageDetection-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'singleImageDetection-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<singleImageDetection-request> is deprecated: use front_end-srv:singleImageDetection-request instead.")))

(cl:ensure-generic-function 'detID-val :lambda-list '(m))
(cl:defmethod detID-val ((m <singleImageDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:detID-val is deprecated.  Use front_end-srv:detID instead.")
  (detID m))

(cl:ensure-generic-function 'returnKP-val :lambda-list '(m))
(cl:defmethod returnKP-val ((m <singleImageDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:returnKP-val is deprecated.  Use front_end-srv:returnKP instead.")
  (returnKP m))

(cl:ensure-generic-function 'leftImg-val :lambda-list '(m))
(cl:defmethod leftImg-val ((m <singleImageDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:leftImg-val is deprecated.  Use front_end-srv:leftImg instead.")
  (leftImg m))

(cl:ensure-generic-function 'rightImg-val :lambda-list '(m))
(cl:defmethod rightImg-val ((m <singleImageDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:rightImg-val is deprecated.  Use front_end-srv:rightImg instead.")
  (rightImg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <singleImageDetection-request>) ostream)
  "Serializes a message object of type '<singleImageDetection-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'detID))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'returnKP) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftImg) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightImg) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <singleImageDetection-request>) istream)
  "Deserializes a message object of type '<singleImageDetection-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detID) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detID)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:setf (cl:slot-value msg 'returnKP) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftImg) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightImg) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<singleImageDetection-request>)))
  "Returns string type for a service object of type '<singleImageDetection-request>"
  "front_end/singleImageDetectionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleImageDetection-request)))
  "Returns string type for a service object of type 'singleImageDetection-request"
  "front_end/singleImageDetectionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<singleImageDetection-request>)))
  "Returns md5sum for a message object of type '<singleImageDetection-request>"
  "a394ddda8400e32e0cbdb38aaf30224b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'singleImageDetection-request)))
  "Returns md5sum for a message object of type 'singleImageDetection-request"
  "a394ddda8400e32e0cbdb38aaf30224b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<singleImageDetection-request>)))
  "Returns full string definition for message of type '<singleImageDetection-request>"
  (cl:format cl:nil "string[] detID~%bool returnKP~%sensor_msgs/Image leftImg~%sensor_msgs/Image rightImg~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'singleImageDetection-request)))
  "Returns full string definition for message of type 'singleImageDetection-request"
  (cl:format cl:nil "string[] detID~%bool returnKP~%sensor_msgs/Image leftImg~%sensor_msgs/Image rightImg~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <singleImageDetection-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detID) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftImg))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightImg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <singleImageDetection-request>))
  "Converts a ROS message object to a list"
  (cl:list 'singleImageDetection-request
    (cl:cons ':detID (detID msg))
    (cl:cons ':returnKP (returnKP msg))
    (cl:cons ':leftImg (leftImg msg))
    (cl:cons ':rightImg (rightImg msg))
))
;//! \htmlinclude singleImageDetection-response.msg.html

(cl:defclass <singleImageDetection-response> (roslisp-msg-protocol:ros-message)
  ((outputFrames
    :reader outputFrames
    :initarg :outputFrames
    :type (cl:vector front_end-msg:frameDetection)
   :initform (cl:make-array 0 :element-type 'front_end-msg:frameDetection :initial-element (cl:make-instance 'front_end-msg:frameDetection))))
)

(cl:defclass singleImageDetection-response (<singleImageDetection-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <singleImageDetection-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'singleImageDetection-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<singleImageDetection-response> is deprecated: use front_end-srv:singleImageDetection-response instead.")))

(cl:ensure-generic-function 'outputFrames-val :lambda-list '(m))
(cl:defmethod outputFrames-val ((m <singleImageDetection-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:outputFrames-val is deprecated.  Use front_end-srv:outputFrames instead.")
  (outputFrames m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <singleImageDetection-response>) ostream)
  "Serializes a message object of type '<singleImageDetection-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'outputFrames))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'outputFrames))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <singleImageDetection-response>) istream)
  "Deserializes a message object of type '<singleImageDetection-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'outputFrames) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'outputFrames)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:frameDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<singleImageDetection-response>)))
  "Returns string type for a service object of type '<singleImageDetection-response>"
  "front_end/singleImageDetectionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleImageDetection-response)))
  "Returns string type for a service object of type 'singleImageDetection-response"
  "front_end/singleImageDetectionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<singleImageDetection-response>)))
  "Returns md5sum for a message object of type '<singleImageDetection-response>"
  "a394ddda8400e32e0cbdb38aaf30224b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'singleImageDetection-response)))
  "Returns md5sum for a message object of type 'singleImageDetection-response"
  "a394ddda8400e32e0cbdb38aaf30224b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<singleImageDetection-response>)))
  "Returns full string definition for message of type '<singleImageDetection-response>"
  (cl:format cl:nil "front_end/frameDetection[] outputFrames~%~%~%================================================================================~%MSG: front_end/frameDetection~%front_end/kPoint[] leftFeatures~%string detID~%uint16 nLeft~%float32 l_xAvg~%float32 l_yAvg~%float32 l_xStd~%float32 l_yStd~%front_end/kPoint[] rightFeatures~%uint16 nRight~%float32 r_xAvg~%float32 r_yAvg~%float32 r_xStd~%float32 r_yStd~%front_end/ProcTime[] processingTime ~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'singleImageDetection-response)))
  "Returns full string definition for message of type 'singleImageDetection-response"
  (cl:format cl:nil "front_end/frameDetection[] outputFrames~%~%~%================================================================================~%MSG: front_end/frameDetection~%front_end/kPoint[] leftFeatures~%string detID~%uint16 nLeft~%float32 l_xAvg~%float32 l_yAvg~%float32 l_xStd~%float32 l_yStd~%front_end/kPoint[] rightFeatures~%uint16 nRight~%float32 r_xAvg~%float32 r_yAvg~%float32 r_xStd~%float32 r_yStd~%front_end/ProcTime[] processingTime ~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <singleImageDetection-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'outputFrames) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <singleImageDetection-response>))
  "Converts a ROS message object to a list"
  (cl:list 'singleImageDetection-response
    (cl:cons ':outputFrames (outputFrames msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'singleImageDetection)))
  'singleImageDetection-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'singleImageDetection)))
  'singleImageDetection-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleImageDetection)))
  "Returns string type for a service object of type '<singleImageDetection>"
  "front_end/singleImageDetection")