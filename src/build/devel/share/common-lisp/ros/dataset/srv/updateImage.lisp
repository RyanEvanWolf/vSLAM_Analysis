; Auto-generated. Do not edit!


(cl:in-package dataset-srv)


;//! \htmlinclude updateImage-request.msg.html

(cl:defclass <updateImage-request> (roslisp-msg-protocol:ros-message)
  ((windowName
    :reader windowName
    :initarg :windowName
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (newImage
    :reader newImage
    :initarg :newImage
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (display
    :reader display
    :initarg :display
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass updateImage-request (<updateImage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updateImage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updateImage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<updateImage-request> is deprecated: use dataset-srv:updateImage-request instead.")))

(cl:ensure-generic-function 'windowName-val :lambda-list '(m))
(cl:defmethod windowName-val ((m <updateImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:windowName-val is deprecated.  Use dataset-srv:windowName instead.")
  (windowName m))

(cl:ensure-generic-function 'newImage-val :lambda-list '(m))
(cl:defmethod newImage-val ((m <updateImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:newImage-val is deprecated.  Use dataset-srv:newImage instead.")
  (newImage m))

(cl:ensure-generic-function 'display-val :lambda-list '(m))
(cl:defmethod display-val ((m <updateImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:display-val is deprecated.  Use dataset-srv:display instead.")
  (display m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updateImage-request>) ostream)
  "Serializes a message object of type '<updateImage-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'windowName) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'newImage) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'display) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updateImage-request>) istream)
  "Deserializes a message object of type '<updateImage-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'windowName) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'newImage) istream)
    (cl:setf (cl:slot-value msg 'display) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updateImage-request>)))
  "Returns string type for a service object of type '<updateImage-request>"
  "dataset/updateImageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updateImage-request)))
  "Returns string type for a service object of type 'updateImage-request"
  "dataset/updateImageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updateImage-request>)))
  "Returns md5sum for a message object of type '<updateImage-request>"
  "14086f831f7b9fc93a1aa90e9b41d9a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updateImage-request)))
  "Returns md5sum for a message object of type 'updateImage-request"
  "14086f831f7b9fc93a1aa90e9b41d9a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updateImage-request>)))
  "Returns full string definition for message of type '<updateImage-request>"
  (cl:format cl:nil "std_msgs/String windowName~%sensor_msgs/Image newImage~%bool display~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updateImage-request)))
  "Returns full string definition for message of type 'updateImage-request"
  (cl:format cl:nil "std_msgs/String windowName~%sensor_msgs/Image newImage~%bool display~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updateImage-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'windowName))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'newImage))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updateImage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'updateImage-request
    (cl:cons ':windowName (windowName msg))
    (cl:cons ':newImage (newImage msg))
    (cl:cons ':display (display msg))
))
;//! \htmlinclude updateImage-response.msg.html

(cl:defclass <updateImage-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass updateImage-response (<updateImage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updateImage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updateImage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<updateImage-response> is deprecated: use dataset-srv:updateImage-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updateImage-response>) ostream)
  "Serializes a message object of type '<updateImage-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updateImage-response>) istream)
  "Deserializes a message object of type '<updateImage-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updateImage-response>)))
  "Returns string type for a service object of type '<updateImage-response>"
  "dataset/updateImageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updateImage-response)))
  "Returns string type for a service object of type 'updateImage-response"
  "dataset/updateImageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updateImage-response>)))
  "Returns md5sum for a message object of type '<updateImage-response>"
  "14086f831f7b9fc93a1aa90e9b41d9a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updateImage-response)))
  "Returns md5sum for a message object of type 'updateImage-response"
  "14086f831f7b9fc93a1aa90e9b41d9a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updateImage-response>)))
  "Returns full string definition for message of type '<updateImage-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updateImage-response)))
  "Returns full string definition for message of type 'updateImage-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updateImage-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updateImage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'updateImage-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'updateImage)))
  'updateImage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'updateImage)))
  'updateImage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updateImage)))
  "Returns string type for a service object of type '<updateImage>"
  "dataset/updateImage")