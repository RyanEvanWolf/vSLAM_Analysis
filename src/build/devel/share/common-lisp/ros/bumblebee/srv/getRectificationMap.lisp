; Auto-generated. Do not edit!


(cl:in-package bumblebee-srv)


;//! \htmlinclude getRectificationMap-request.msg.html

(cl:defclass <getRectificationMap-request> (roslisp-msg-protocol:ros-message)
  ((floatingPoint
    :reader floatingPoint
    :initarg :floatingPoint
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass getRectificationMap-request (<getRectificationMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getRectificationMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getRectificationMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bumblebee-srv:<getRectificationMap-request> is deprecated: use bumblebee-srv:getRectificationMap-request instead.")))

(cl:ensure-generic-function 'floatingPoint-val :lambda-list '(m))
(cl:defmethod floatingPoint-val ((m <getRectificationMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:floatingPoint-val is deprecated.  Use bumblebee-srv:floatingPoint instead.")
  (floatingPoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getRectificationMap-request>) ostream)
  "Serializes a message object of type '<getRectificationMap-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'floatingPoint) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getRectificationMap-request>) istream)
  "Deserializes a message object of type '<getRectificationMap-request>"
    (cl:setf (cl:slot-value msg 'floatingPoint) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getRectificationMap-request>)))
  "Returns string type for a service object of type '<getRectificationMap-request>"
  "bumblebee/getRectificationMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getRectificationMap-request)))
  "Returns string type for a service object of type 'getRectificationMap-request"
  "bumblebee/getRectificationMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getRectificationMap-request>)))
  "Returns md5sum for a message object of type '<getRectificationMap-request>"
  "dbd8732e5a390dbfdd19a82d4c0304e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getRectificationMap-request)))
  "Returns md5sum for a message object of type 'getRectificationMap-request"
  "dbd8732e5a390dbfdd19a82d4c0304e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getRectificationMap-request>)))
  "Returns full string definition for message of type '<getRectificationMap-request>"
  (cl:format cl:nil "bool floatingPoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getRectificationMap-request)))
  "Returns full string definition for message of type 'getRectificationMap-request"
  (cl:format cl:nil "bool floatingPoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getRectificationMap-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getRectificationMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'getRectificationMap-request
    (cl:cons ':floatingPoint (floatingPoint msg))
))
;//! \htmlinclude getRectificationMap-response.msg.html

(cl:defclass <getRectificationMap-response> (roslisp-msg-protocol:ros-message)
  ((leftx
    :reader leftx
    :initarg :leftx
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (lefty
    :reader lefty
    :initarg :lefty
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rightx
    :reader rightx
    :initarg :rightx
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (righty
    :reader righty
    :initarg :righty
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass getRectificationMap-response (<getRectificationMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getRectificationMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getRectificationMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bumblebee-srv:<getRectificationMap-response> is deprecated: use bumblebee-srv:getRectificationMap-response instead.")))

(cl:ensure-generic-function 'leftx-val :lambda-list '(m))
(cl:defmethod leftx-val ((m <getRectificationMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:leftx-val is deprecated.  Use bumblebee-srv:leftx instead.")
  (leftx m))

(cl:ensure-generic-function 'lefty-val :lambda-list '(m))
(cl:defmethod lefty-val ((m <getRectificationMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:lefty-val is deprecated.  Use bumblebee-srv:lefty instead.")
  (lefty m))

(cl:ensure-generic-function 'rightx-val :lambda-list '(m))
(cl:defmethod rightx-val ((m <getRectificationMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:rightx-val is deprecated.  Use bumblebee-srv:rightx instead.")
  (rightx m))

(cl:ensure-generic-function 'righty-val :lambda-list '(m))
(cl:defmethod righty-val ((m <getRectificationMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:righty-val is deprecated.  Use bumblebee-srv:righty instead.")
  (righty m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getRectificationMap-response>) ostream)
  "Serializes a message object of type '<getRectificationMap-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'leftx) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lefty) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rightx) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'righty) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getRectificationMap-response>) istream)
  "Deserializes a message object of type '<getRectificationMap-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'leftx) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lefty) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rightx) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'righty) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getRectificationMap-response>)))
  "Returns string type for a service object of type '<getRectificationMap-response>"
  "bumblebee/getRectificationMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getRectificationMap-response)))
  "Returns string type for a service object of type 'getRectificationMap-response"
  "bumblebee/getRectificationMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getRectificationMap-response>)))
  "Returns md5sum for a message object of type '<getRectificationMap-response>"
  "dbd8732e5a390dbfdd19a82d4c0304e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getRectificationMap-response)))
  "Returns md5sum for a message object of type 'getRectificationMap-response"
  "dbd8732e5a390dbfdd19a82d4c0304e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getRectificationMap-response>)))
  "Returns full string definition for message of type '<getRectificationMap-response>"
  (cl:format cl:nil "sensor_msgs/Image leftx~%sensor_msgs/Image lefty~%sensor_msgs/Image rightx~%sensor_msgs/Image righty~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getRectificationMap-response)))
  "Returns full string definition for message of type 'getRectificationMap-response"
  (cl:format cl:nil "sensor_msgs/Image leftx~%sensor_msgs/Image lefty~%sensor_msgs/Image rightx~%sensor_msgs/Image righty~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getRectificationMap-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'leftx))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lefty))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rightx))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'righty))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getRectificationMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'getRectificationMap-response
    (cl:cons ':leftx (leftx msg))
    (cl:cons ':lefty (lefty msg))
    (cl:cons ':rightx (rightx msg))
    (cl:cons ':righty (righty msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'getRectificationMap)))
  'getRectificationMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'getRectificationMap)))
  'getRectificationMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getRectificationMap)))
  "Returns string type for a service object of type '<getRectificationMap>"
  "bumblebee/getRectificationMap")