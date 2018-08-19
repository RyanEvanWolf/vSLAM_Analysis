; Auto-generated. Do not edit!


(cl:in-package front_end-srv)


;//! \htmlinclude getStereoFeatures-request.msg.html

(cl:defclass <getStereoFeatures-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass getStereoFeatures-request (<getStereoFeatures-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getStereoFeatures-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getStereoFeatures-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<getStereoFeatures-request> is deprecated: use front_end-srv:getStereoFeatures-request instead.")))

(cl:ensure-generic-function 'detID-val :lambda-list '(m))
(cl:defmethod detID-val ((m <getStereoFeatures-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:detID-val is deprecated.  Use front_end-srv:detID instead.")
  (detID m))

(cl:ensure-generic-function 'descrID-val :lambda-list '(m))
(cl:defmethod descrID-val ((m <getStereoFeatures-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:descrID-val is deprecated.  Use front_end-srv:descrID instead.")
  (descrID m))

(cl:ensure-generic-function 'leftImg-val :lambda-list '(m))
(cl:defmethod leftImg-val ((m <getStereoFeatures-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:leftImg-val is deprecated.  Use front_end-srv:leftImg instead.")
  (leftImg m))

(cl:ensure-generic-function 'rightImg-val :lambda-list '(m))
(cl:defmethod rightImg-val ((m <getStereoFeatures-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:rightImg-val is deprecated.  Use front_end-srv:rightImg instead.")
  (rightImg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getStereoFeatures-request>) ostream)
  "Serializes a message object of type '<getStereoFeatures-request>"
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
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftImg) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightImg) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getStereoFeatures-request>) istream)
  "Deserializes a message object of type '<getStereoFeatures-request>"
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftImg) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightImg) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getStereoFeatures-request>)))
  "Returns string type for a service object of type '<getStereoFeatures-request>"
  "front_end/getStereoFeaturesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getStereoFeatures-request)))
  "Returns string type for a service object of type 'getStereoFeatures-request"
  "front_end/getStereoFeaturesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getStereoFeatures-request>)))
  "Returns md5sum for a message object of type '<getStereoFeatures-request>"
  "0a5f108044f2627eecc8992d4678dee9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getStereoFeatures-request)))
  "Returns md5sum for a message object of type 'getStereoFeatures-request"
  "0a5f108044f2627eecc8992d4678dee9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getStereoFeatures-request>)))
  "Returns full string definition for message of type '<getStereoFeatures-request>"
  (cl:format cl:nil "string detID~%string descrID~%sensor_msgs/Image leftImg~%sensor_msgs/Image rightImg~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getStereoFeatures-request)))
  "Returns full string definition for message of type 'getStereoFeatures-request"
  (cl:format cl:nil "string detID~%string descrID~%sensor_msgs/Image leftImg~%sensor_msgs/Image rightImg~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getStereoFeatures-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'detID))
     4 (cl:length (cl:slot-value msg 'descrID))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftImg))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightImg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getStereoFeatures-request>))
  "Converts a ROS message object to a list"
  (cl:list 'getStereoFeatures-request
    (cl:cons ':detID (detID msg))
    (cl:cons ':descrID (descrID msg))
    (cl:cons ':leftImg (leftImg msg))
    (cl:cons ':rightImg (rightImg msg))
))
;//! \htmlinclude getStereoFeatures-response.msg.html

(cl:defclass <getStereoFeatures-response> (roslisp-msg-protocol:ros-message)
  ((latestFeatures
    :reader latestFeatures
    :initarg :latestFeatures
    :type front_end-msg:stereoFeatures
    :initform (cl:make-instance 'front_end-msg:stereoFeatures)))
)

(cl:defclass getStereoFeatures-response (<getStereoFeatures-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getStereoFeatures-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getStereoFeatures-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<getStereoFeatures-response> is deprecated: use front_end-srv:getStereoFeatures-response instead.")))

(cl:ensure-generic-function 'latestFeatures-val :lambda-list '(m))
(cl:defmethod latestFeatures-val ((m <getStereoFeatures-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:latestFeatures-val is deprecated.  Use front_end-srv:latestFeatures instead.")
  (latestFeatures m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getStereoFeatures-response>) ostream)
  "Serializes a message object of type '<getStereoFeatures-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'latestFeatures) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getStereoFeatures-response>) istream)
  "Deserializes a message object of type '<getStereoFeatures-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'latestFeatures) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getStereoFeatures-response>)))
  "Returns string type for a service object of type '<getStereoFeatures-response>"
  "front_end/getStereoFeaturesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getStereoFeatures-response)))
  "Returns string type for a service object of type 'getStereoFeatures-response"
  "front_end/getStereoFeaturesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getStereoFeatures-response>)))
  "Returns md5sum for a message object of type '<getStereoFeatures-response>"
  "0a5f108044f2627eecc8992d4678dee9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getStereoFeatures-response)))
  "Returns md5sum for a message object of type 'getStereoFeatures-response"
  "0a5f108044f2627eecc8992d4678dee9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getStereoFeatures-response>)))
  "Returns full string definition for message of type '<getStereoFeatures-response>"
  (cl:format cl:nil "front_end/stereoFeatures latestFeatures~%~%~%================================================================================~%MSG: front_end/stereoFeatures~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/ProcTime[] proc~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getStereoFeatures-response)))
  "Returns full string definition for message of type 'getStereoFeatures-response"
  (cl:format cl:nil "front_end/stereoFeatures latestFeatures~%~%~%================================================================================~%MSG: front_end/stereoFeatures~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/ProcTime[] proc~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getStereoFeatures-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'latestFeatures))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getStereoFeatures-response>))
  "Converts a ROS message object to a list"
  (cl:list 'getStereoFeatures-response
    (cl:cons ':latestFeatures (latestFeatures msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'getStereoFeatures)))
  'getStereoFeatures-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'getStereoFeatures)))
  'getStereoFeatures-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getStereoFeatures)))
  "Returns string type for a service object of type '<getStereoFeatures>"
  "front_end/getStereoFeatures")