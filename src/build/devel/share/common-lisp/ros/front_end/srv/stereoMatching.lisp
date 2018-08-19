; Auto-generated. Do not edit!


(cl:in-package front_end-srv)


;//! \htmlinclude stereoMatching-request.msg.html

(cl:defclass <stereoMatching-request> (roslisp-msg-protocol:ros-message)
  ((frame
    :reader frame
    :initarg :frame
    :type front_end-msg:stereoFeatures
    :initform (cl:make-instance 'front_end-msg:stereoFeatures)))
)

(cl:defclass stereoMatching-request (<stereoMatching-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stereoMatching-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stereoMatching-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<stereoMatching-request> is deprecated: use front_end-srv:stereoMatching-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <stereoMatching-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:frame-val is deprecated.  Use front_end-srv:frame instead.")
  (frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stereoMatching-request>) ostream)
  "Serializes a message object of type '<stereoMatching-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'frame) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stereoMatching-request>) istream)
  "Deserializes a message object of type '<stereoMatching-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'frame) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stereoMatching-request>)))
  "Returns string type for a service object of type '<stereoMatching-request>"
  "front_end/stereoMatchingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stereoMatching-request)))
  "Returns string type for a service object of type 'stereoMatching-request"
  "front_end/stereoMatchingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stereoMatching-request>)))
  "Returns md5sum for a message object of type '<stereoMatching-request>"
  "75348319ccc3f979d087d64d783a5ddc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stereoMatching-request)))
  "Returns md5sum for a message object of type 'stereoMatching-request"
  "75348319ccc3f979d087d64d783a5ddc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stereoMatching-request>)))
  "Returns full string definition for message of type '<stereoMatching-request>"
  (cl:format cl:nil "front_end/stereoFeatures frame~%~%================================================================================~%MSG: front_end/stereoFeatures~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/ProcTime[] proc~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stereoMatching-request)))
  "Returns full string definition for message of type 'stereoMatching-request"
  (cl:format cl:nil "front_end/stereoFeatures frame~%~%================================================================================~%MSG: front_end/stereoFeatures~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/ProcTime[] proc~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stereoMatching-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stereoMatching-request>))
  "Converts a ROS message object to a list"
  (cl:list 'stereoMatching-request
    (cl:cons ':frame (frame msg))
))
;//! \htmlinclude stereoMatching-response.msg.html

(cl:defclass <stereoMatching-response> (roslisp-msg-protocol:ros-message)
  ((out
    :reader out
    :initarg :out
    :type front_end-msg:stereoLandmarks
    :initform (cl:make-instance 'front_end-msg:stereoLandmarks)))
)

(cl:defclass stereoMatching-response (<stereoMatching-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stereoMatching-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stereoMatching-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-srv:<stereoMatching-response> is deprecated: use front_end-srv:stereoMatching-response instead.")))

(cl:ensure-generic-function 'out-val :lambda-list '(m))
(cl:defmethod out-val ((m <stereoMatching-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-srv:out-val is deprecated.  Use front_end-srv:out instead.")
  (out m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stereoMatching-response>) ostream)
  "Serializes a message object of type '<stereoMatching-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'out) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stereoMatching-response>) istream)
  "Deserializes a message object of type '<stereoMatching-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'out) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stereoMatching-response>)))
  "Returns string type for a service object of type '<stereoMatching-response>"
  "front_end/stereoMatchingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stereoMatching-response)))
  "Returns string type for a service object of type 'stereoMatching-response"
  "front_end/stereoMatchingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stereoMatching-response>)))
  "Returns md5sum for a message object of type '<stereoMatching-response>"
  "75348319ccc3f979d087d64d783a5ddc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stereoMatching-response)))
  "Returns md5sum for a message object of type 'stereoMatching-response"
  "75348319ccc3f979d087d64d783a5ddc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stereoMatching-response>)))
  "Returns full string definition for message of type '<stereoMatching-response>"
  (cl:format cl:nil "front_end/stereoLandmarks out~%~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stereoMatching-response)))
  "Returns full string definition for message of type 'stereoMatching-response"
  (cl:format cl:nil "front_end/stereoLandmarks out~%~%~%================================================================================~%MSG: front_end/stereoLandmarks~%string detID~%string descrID~%front_end/kPoint[] leftFeatures~%sensor_msgs/Image leftDescr~%front_end/kPoint[] rightFeatures~%sensor_msgs/Image rightDescr~%front_end/cvMatch[] matches~%front_end/ProcTime[] proc~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stereoMatching-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'out))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stereoMatching-response>))
  "Converts a ROS message object to a list"
  (cl:list 'stereoMatching-response
    (cl:cons ':out (out msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'stereoMatching)))
  'stereoMatching-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'stereoMatching)))
  'stereoMatching-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stereoMatching)))
  "Returns string type for a service object of type '<stereoMatching>"
  "front_end/stereoMatching")