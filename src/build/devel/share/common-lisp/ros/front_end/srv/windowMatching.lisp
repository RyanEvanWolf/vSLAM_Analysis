; Auto-generated. Do not edit!


(cl:in-package front_end-srv)


;//! \htmlinclude windowMatching-request.msg.html

(cl:defclass <windowMatching-request> (roslisp-msg-protocol:ros-message)
  ((reset
    :reader reset
    :initarg :reset
    :type cl:boolean
    :initform cl:nil)
   (latestFrame
    :reader latestFrame
    :initarg :latestFrame
    :type front_end-msg:stereoLandmarks
    :initform (cl:make-instance 'front_end-msg:stereoLandmarks)))
)

(cl:defclass windowMatching-request (<windowMatching-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <windowMatching-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'windowMatching-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<windowMatching-request> is deprecated: use front_end-srv:windowMatching-request instead.")))

(cl:ensure-generic-function 'reset-val :lambda-list '(m))
(cl:defmethod reset-val ((m <windowMatching-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:reset-val is deprecated.  Use front_end-srv:reset instead.")
  (reset m))

(cl:ensure-generic-function 'latestFrame-val :lambda-list '(m))
(cl:defmethod latestFrame-val ((m <windowMatching-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:latestFrame-val is deprecated.  Use front_end-srv:latestFrame instead.")
  (latestFrame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <windowMatching-request>) ostream)
  "Serializes a message object of type '<windowMatching-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'latestFrame) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <windowMatching-request>) istream)
  "Deserializes a message object of type '<windowMatching-request>"
    (cl:setf (cl:slot-value msg 'reset) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'latestFrame) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<windowMatching-request>)))
  "Returns string type for a service object of type '<windowMatching-request>"
  "front_end/windowMatchingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windowMatching-request)))
  "Returns string type for a service object of type 'windowMatching-request"
  "front_end/windowMatchingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<windowMatching-request>)))
  "Returns md5sum for a message object of type '<windowMatching-request>"
  "470c2089accb6822fcb69d05c9fefb39")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'windowMatching-request)))
  "Returns md5sum for a message object of type 'windowMatching-request"
  "470c2089accb6822fcb69d05c9fefb39")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<windowMatching-request>)))
  "Returns full string definition for message of type '<windowMatching-request>"
  (cl:format cl:nil "bool reset~%front_end/stereoLandmarks latestFrame~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'windowMatching-request)))
  "Returns full string definition for message of type 'windowMatching-request"
  (cl:format cl:nil "bool reset~%front_end/stereoLandmarks latestFrame~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <windowMatching-request>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'latestFrame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <windowMatching-request>))
  "Converts a ROS message object to a list"
  (cl:list 'windowMatching-request
    (cl:cons ':reset (reset msg))
    (cl:cons ':latestFrame (latestFrame msg))
))
;//! \htmlinclude windowMatching-response.msg.html

(cl:defclass <windowMatching-response> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type front_end-msg:windowStatus
    :initform (cl:make-instance 'front_end-msg:windowStatus)))
)

(cl:defclass windowMatching-response (<windowMatching-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <windowMatching-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'windowMatching-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<windowMatching-response> is deprecated: use front_end-srv:windowMatching-response instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <windowMatching-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:state-val is deprecated.  Use front_end-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <windowMatching-response>) ostream)
  "Serializes a message object of type '<windowMatching-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <windowMatching-response>) istream)
  "Deserializes a message object of type '<windowMatching-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<windowMatching-response>)))
  "Returns string type for a service object of type '<windowMatching-response>"
  "front_end/windowMatchingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windowMatching-response)))
  "Returns string type for a service object of type 'windowMatching-response"
  "front_end/windowMatchingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<windowMatching-response>)))
  "Returns md5sum for a message object of type '<windowMatching-response>"
  "470c2089accb6822fcb69d05c9fefb39")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'windowMatching-response)))
  "Returns md5sum for a message object of type 'windowMatching-response"
  "470c2089accb6822fcb69d05c9fefb39")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<windowMatching-response>)))
  "Returns full string definition for message of type '<windowMatching-response>"
  (cl:format cl:nil "front_end/windowStatus state~%~%~%================================================================================~%MSG: front_end/windowStatus~%front_end/stereoLandmarks[] msgs~%front_end/interFrameTracks[] tracks~%sensor_msgs/Image[] motion~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: front_end/interFrameTracks~%front_end/cvMatch[] tracks ~%sensor_msgs/Image motionInliers~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'windowMatching-response)))
  "Returns full string definition for message of type 'windowMatching-response"
  (cl:format cl:nil "front_end/windowStatus state~%~%~%================================================================================~%MSG: front_end/windowStatus~%front_end/stereoLandmarks[] msgs~%front_end/interFrameTracks[] tracks~%sensor_msgs/Image[] motion~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%================================================================================~%MSG: front_end/interFrameTracks~%front_end/cvMatch[] tracks ~%sensor_msgs/Image motionInliers~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <windowMatching-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <windowMatching-response>))
  "Converts a ROS message object to a list"
  (cl:list 'windowMatching-response
    (cl:cons ':state (state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'windowMatching)))
  'windowMatching-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'windowMatching)))
  'windowMatching-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'windowMatching)))
  "Returns string type for a service object of type '<windowMatching>"
  "front_end/windowMatching")