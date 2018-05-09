; Auto-generated. Do not edit!


(cl:in-package front_end-srv)


;//! \htmlinclude singleStereo-request.msg.html

(cl:defclass <singleStereo-request> (roslisp-msg-protocol:ros-message)
  ((leftFeatures
    :reader leftFeatures
    :initarg :leftFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (rightFeatures
    :reader rightFeatures
    :initarg :rightFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (descriptors
    :reader descriptors
    :initarg :descriptors
    :type (cl:vector front_end-msg:Descriptors)
   :initform (cl:make-array 0 :element-type 'front_end-msg:Descriptors :initial-element (cl:make-instance 'front_end-msg:Descriptors)))
   (inputSettings
    :reader inputSettings
    :initarg :inputSettings
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass singleStereo-request (<singleStereo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <singleStereo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'singleStereo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<singleStereo-request> is deprecated: use front_end-srv:singleStereo-request instead.")))

(cl:ensure-generic-function 'leftFeatures-val :lambda-list '(m))
(cl:defmethod leftFeatures-val ((m <singleStereo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:leftFeatures-val is deprecated.  Use front_end-srv:leftFeatures instead.")
  (leftFeatures m))

(cl:ensure-generic-function 'rightFeatures-val :lambda-list '(m))
(cl:defmethod rightFeatures-val ((m <singleStereo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:rightFeatures-val is deprecated.  Use front_end-srv:rightFeatures instead.")
  (rightFeatures m))

(cl:ensure-generic-function 'descriptors-val :lambda-list '(m))
(cl:defmethod descriptors-val ((m <singleStereo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:descriptors-val is deprecated.  Use front_end-srv:descriptors instead.")
  (descriptors m))

(cl:ensure-generic-function 'inputSettings-val :lambda-list '(m))
(cl:defmethod inputSettings-val ((m <singleStereo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:inputSettings-val is deprecated.  Use front_end-srv:inputSettings instead.")
  (inputSettings m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <singleStereo-request>) ostream)
  "Serializes a message object of type '<singleStereo-request>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'descriptors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'descriptors))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'inputSettings))))
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
   (cl:slot-value msg 'inputSettings))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <singleStereo-request>) istream)
  "Deserializes a message object of type '<singleStereo-request>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'descriptors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'descriptors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:Descriptors))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'inputSettings) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'inputSettings)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<singleStereo-request>)))
  "Returns string type for a service object of type '<singleStereo-request>"
  "front_end/singleStereoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleStereo-request)))
  "Returns string type for a service object of type 'singleStereo-request"
  "front_end/singleStereoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<singleStereo-request>)))
  "Returns md5sum for a message object of type '<singleStereo-request>"
  "ceff56939495f6592227196cef4aceff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'singleStereo-request)))
  "Returns md5sum for a message object of type 'singleStereo-request"
  "ceff56939495f6592227196cef4aceff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<singleStereo-request>)))
  "Returns full string definition for message of type '<singleStereo-request>"
  (cl:format cl:nil "front_end/kPoint[] leftFeatures~%front_end/kPoint[] rightFeatures~%front_end/Descriptors[] descriptors~%string[] inputSettings~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%sensor_msgs/Image[] descriptors~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/Descriptors~%front_end/ProcTime[] proc~%int32 descriptID~%int32[] left_featureMask~%int32[] right_featureMask~%sensor_msgs/Image leftDescriptors~%sensor_msgs/Image rightDescriptors~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'singleStereo-request)))
  "Returns full string definition for message of type 'singleStereo-request"
  (cl:format cl:nil "front_end/kPoint[] leftFeatures~%front_end/kPoint[] rightFeatures~%front_end/Descriptors[] descriptors~%string[] inputSettings~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%sensor_msgs/Image[] descriptors~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/Descriptors~%front_end/ProcTime[] proc~%int32 descriptID~%int32[] left_featureMask~%int32[] right_featureMask~%sensor_msgs/Image leftDescriptors~%sensor_msgs/Image rightDescriptors~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <singleStereo-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'leftFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rightFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'descriptors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'inputSettings) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <singleStereo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'singleStereo-request
    (cl:cons ':leftFeatures (leftFeatures msg))
    (cl:cons ':rightFeatures (rightFeatures msg))
    (cl:cons ':descriptors (descriptors msg))
    (cl:cons ':inputSettings (inputSettings msg))
))
;//! \htmlinclude singleStereo-response.msg.html

(cl:defclass <singleStereo-response> (roslisp-msg-protocol:ros-message)
  ((proc
    :reader proc
    :initarg :proc
    :type (cl:vector front_end-msg:ProcTime)
   :initform (cl:make-array 0 :element-type 'front_end-msg:ProcTime :initial-element (cl:make-instance 'front_end-msg:ProcTime))))
)

(cl:defclass singleStereo-response (<singleStereo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <singleStereo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'singleStereo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<singleStereo-response> is deprecated: use front_end-srv:singleStereo-response instead.")))

(cl:ensure-generic-function 'proc-val :lambda-list '(m))
(cl:defmethod proc-val ((m <singleStereo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:proc-val is deprecated.  Use front_end-srv:proc instead.")
  (proc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <singleStereo-response>) ostream)
  "Serializes a message object of type '<singleStereo-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'proc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'proc))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <singleStereo-response>) istream)
  "Deserializes a message object of type '<singleStereo-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<singleStereo-response>)))
  "Returns string type for a service object of type '<singleStereo-response>"
  "front_end/singleStereoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleStereo-response)))
  "Returns string type for a service object of type 'singleStereo-response"
  "front_end/singleStereoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<singleStereo-response>)))
  "Returns md5sum for a message object of type '<singleStereo-response>"
  "ceff56939495f6592227196cef4aceff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'singleStereo-response)))
  "Returns md5sum for a message object of type 'singleStereo-response"
  "ceff56939495f6592227196cef4aceff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<singleStereo-response>)))
  "Returns full string definition for message of type '<singleStereo-response>"
  (cl:format cl:nil "front_end/ProcTime[] proc~%~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'singleStereo-response)))
  "Returns full string definition for message of type 'singleStereo-response"
  (cl:format cl:nil "front_end/ProcTime[] proc~%~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <singleStereo-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'proc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <singleStereo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'singleStereo-response
    (cl:cons ':proc (proc msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'singleStereo)))
  'singleStereo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'singleStereo)))
  'singleStereo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleStereo)))
  "Returns string type for a service object of type '<singleStereo>"
  "front_end/singleStereo")