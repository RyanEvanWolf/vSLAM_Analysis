; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude interFrameTracks.msg.html

(cl:defclass <interFrameTracks> (roslisp-msg-protocol:ros-message)
  ((tracks
    :reader tracks
    :initarg :tracks
    :type (cl:vector front_end-msg:cvMatch)
   :initform (cl:make-array 0 :element-type 'front_end-msg:cvMatch :initial-element (cl:make-instance 'front_end-msg:cvMatch)))
   (motionInliers
    :reader motionInliers
    :initarg :motionInliers
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass interFrameTracks (<interFrameTracks>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <interFrameTracks>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'interFrameTracks)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<interFrameTracks> is deprecated: use front_end-msg:interFrameTracks instead.")))

(cl:ensure-generic-function 'tracks-val :lambda-list '(m))
(cl:defmethod tracks-val ((m <interFrameTracks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:tracks-val is deprecated.  Use front_end-msg:tracks instead.")
  (tracks m))

(cl:ensure-generic-function 'motionInliers-val :lambda-list '(m))
(cl:defmethod motionInliers-val ((m <interFrameTracks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:motionInliers-val is deprecated.  Use front_end-msg:motionInliers instead.")
  (motionInliers m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <interFrameTracks>) ostream)
  "Serializes a message object of type '<interFrameTracks>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tracks))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motionInliers) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <interFrameTracks>) istream)
  "Deserializes a message object of type '<interFrameTracks>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tracks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tracks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:cvMatch))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motionInliers) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<interFrameTracks>)))
  "Returns string type for a message object of type '<interFrameTracks>"
  "front_end/interFrameTracks")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'interFrameTracks)))
  "Returns string type for a message object of type 'interFrameTracks"
  "front_end/interFrameTracks")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<interFrameTracks>)))
  "Returns md5sum for a message object of type '<interFrameTracks>"
  "75c31d94db7747501fccc4f90c044a01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'interFrameTracks)))
  "Returns md5sum for a message object of type 'interFrameTracks"
  "75c31d94db7747501fccc4f90c044a01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<interFrameTracks>)))
  "Returns full string definition for message of type '<interFrameTracks>"
  (cl:format cl:nil "front_end/cvMatch[] tracks ~%sensor_msgs/Image motionInliers~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'interFrameTracks)))
  "Returns full string definition for message of type 'interFrameTracks"
  (cl:format cl:nil "front_end/cvMatch[] tracks ~%sensor_msgs/Image motionInliers~%================================================================================~%MSG: front_end/cvMatch~%uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <interFrameTracks>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tracks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motionInliers))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <interFrameTracks>))
  "Converts a ROS message object to a list"
  (cl:list 'interFrameTracks
    (cl:cons ':tracks (tracks msg))
    (cl:cons ':motionInliers (motionInliers msg))
))
