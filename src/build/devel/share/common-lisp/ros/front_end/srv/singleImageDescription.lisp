; Auto-generated. Do not edit!


(cl:in-package front_end-srv)


;//! \htmlinclude singleImageDescription-request.msg.html

(cl:defclass <singleImageDescription-request> (roslisp-msg-protocol:ros-message)
  ((leftImg
    :reader leftImg
    :initarg :leftImg
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rightImg
    :reader rightImg
    :initarg :rightImg
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
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

(cl:defclass singleImageDescription-request (<singleImageDescription-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <singleImageDescription-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'singleImageDescription-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<singleImageDescription-request> is deprecated: use front_end-srv:singleImageDescription-request instead.")))

(cl:ensure-generic-function 'leftImg-val :lambda-list '(m))
(cl:defmethod leftImg-val ((m <singleImageDescription-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:leftImg-val is deprecated.  Use front_end-srv:leftImg instead.")
  (leftImg m))

(cl:ensure-generic-function 'rightImg-val :lambda-list '(m))
(cl:defmethod rightImg-val ((m <singleImageDescription-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:rightImg-val is deprecated.  Use front_end-srv:rightImg instead.")
  (rightImg m))

(cl:ensure-generic-function 'leftFeatures-val :lambda-list '(m))
(cl:defmethod leftFeatures-val ((m <singleImageDescription-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:leftFeatures-val is deprecated.  Use front_end-srv:leftFeatures instead.")
  (leftFeatures m))

(cl:ensure-generic-function 'rightFeatures-val :lambda-list '(m))
(cl:defmethod rightFeatures-val ((m <singleImageDescription-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:rightFeatures-val is deprecated.  Use front_end-srv:rightFeatures instead.")
  (rightFeatures m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <singleImageDescription-request>) ostream)
  "Serializes a message object of type '<singleImageDescription-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftImg) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightImg) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <singleImageDescription-request>) istream)
  "Deserializes a message object of type '<singleImageDescription-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftImg) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightImg) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<singleImageDescription-request>)))
  "Returns string type for a service object of type '<singleImageDescription-request>"
  "front_end/singleImageDescriptionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleImageDescription-request)))
  "Returns string type for a service object of type 'singleImageDescription-request"
  "front_end/singleImageDescriptionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<singleImageDescription-request>)))
  "Returns md5sum for a message object of type '<singleImageDescription-request>"
  "7a7f06c16254c680957e38a3e6f8b450")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'singleImageDescription-request)))
  "Returns md5sum for a message object of type 'singleImageDescription-request"
  "7a7f06c16254c680957e38a3e6f8b450")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<singleImageDescription-request>)))
  "Returns full string definition for message of type '<singleImageDescription-request>"
  (cl:format cl:nil "sensor_msgs/Image leftImg~%sensor_msgs/Image rightImg~%front_end/kPoint[] leftFeatures~%front_end/kPoint[] rightFeatures~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%sensor_msgs/Image[] descriptors~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'singleImageDescription-request)))
  "Returns full string definition for message of type 'singleImageDescription-request"
  (cl:format cl:nil "sensor_msgs/Image leftImg~%sensor_msgs/Image rightImg~%front_end/kPoint[] leftFeatures~%front_end/kPoint[] rightFeatures~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%sensor_msgs/Image[] descriptors~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <singleImageDescription-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftImg))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightImg))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'leftFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rightFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <singleImageDescription-request>))
  "Converts a ROS message object to a list"
  (cl:list 'singleImageDescription-request
    (cl:cons ':leftImg (leftImg msg))
    (cl:cons ':rightImg (rightImg msg))
    (cl:cons ':leftFeatures (leftFeatures msg))
    (cl:cons ':rightFeatures (rightFeatures msg))
))
;//! \htmlinclude singleImageDescription-response.msg.html

(cl:defclass <singleImageDescription-response> (roslisp-msg-protocol:ros-message)
  ((results
    :reader results
    :initarg :results
    :type (cl:vector front_end-msg:Descriptors)
   :initform (cl:make-array 0 :element-type 'front_end-msg:Descriptors :initial-element (cl:make-instance 'front_end-msg:Descriptors))))
)

(cl:defclass singleImageDescription-response (<singleImageDescription-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <singleImageDescription-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'singleImageDescription-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<singleImageDescription-response> is deprecated: use front_end-srv:singleImageDescription-response instead.")))

(cl:ensure-generic-function 'results-val :lambda-list '(m))
(cl:defmethod results-val ((m <singleImageDescription-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:results-val is deprecated.  Use front_end-srv:results instead.")
  (results m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <singleImageDescription-response>) ostream)
  "Serializes a message object of type '<singleImageDescription-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'results))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <singleImageDescription-response>) istream)
  "Deserializes a message object of type '<singleImageDescription-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:Descriptors))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<singleImageDescription-response>)))
  "Returns string type for a service object of type '<singleImageDescription-response>"
  "front_end/singleImageDescriptionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleImageDescription-response)))
  "Returns string type for a service object of type 'singleImageDescription-response"
  "front_end/singleImageDescriptionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<singleImageDescription-response>)))
  "Returns md5sum for a message object of type '<singleImageDescription-response>"
  "7a7f06c16254c680957e38a3e6f8b450")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'singleImageDescription-response)))
  "Returns md5sum for a message object of type 'singleImageDescription-response"
  "7a7f06c16254c680957e38a3e6f8b450")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<singleImageDescription-response>)))
  "Returns full string definition for message of type '<singleImageDescription-response>"
  (cl:format cl:nil "front_end/Descriptors[] results~%~%~%~%================================================================================~%MSG: front_end/Descriptors~%front_end/ProcTime[] proc~%int32 descriptID~%int32[] left_featureMask~%int32[] right_featureMask~%sensor_msgs/Image leftDescriptors~%sensor_msgs/Image rightDescriptors~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'singleImageDescription-response)))
  "Returns full string definition for message of type 'singleImageDescription-response"
  (cl:format cl:nil "front_end/Descriptors[] results~%~%~%~%================================================================================~%MSG: front_end/Descriptors~%front_end/ProcTime[] proc~%int32 descriptID~%int32[] left_featureMask~%int32[] right_featureMask~%sensor_msgs/Image leftDescriptors~%sensor_msgs/Image rightDescriptors~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <singleImageDescription-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <singleImageDescription-response>))
  "Converts a ROS message object to a list"
  (cl:list 'singleImageDescription-response
    (cl:cons ':results (results msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'singleImageDescription)))
  'singleImageDescription-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'singleImageDescription)))
  'singleImageDescription-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'singleImageDescription)))
  "Returns string type for a service object of type '<singleImageDescription>"
  "front_end/singleImageDescription")