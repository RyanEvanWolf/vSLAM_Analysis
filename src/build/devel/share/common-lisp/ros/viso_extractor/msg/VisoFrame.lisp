; Auto-generated. Do not edit!


(cl:in-package viso_extractor-msg)


;//! \htmlinclude VisoFrame.msg.html

(cl:defclass <VisoFrame> (roslisp-msg-protocol:ros-message)
  ((nMatches
    :reader nMatches
    :initarg :nMatches
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (nInliers
    :reader nInliers
    :initarg :nInliers
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (time
    :reader time
    :initarg :time
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (homography
    :reader homography
    :initarg :homography
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (matches
    :reader matches
    :initarg :matches
    :type (cl:vector viso_extractor-msg:pMatch)
   :initform (cl:make-array 0 :element-type 'viso_extractor-msg:pMatch :initial-element (cl:make-instance 'viso_extractor-msg:pMatch)))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass VisoFrame (<VisoFrame>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VisoFrame>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VisoFrame)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name viso_extractor-msg:<VisoFrame> is deprecated: use viso_extractor-msg:VisoFrame instead.")))

(cl:ensure-generic-function 'nMatches-val :lambda-list '(m))
(cl:defmethod nMatches-val ((m <VisoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:nMatches-val is deprecated.  Use viso_extractor-msg:nMatches instead.")
  (nMatches m))

(cl:ensure-generic-function 'nInliers-val :lambda-list '(m))
(cl:defmethod nInliers-val ((m <VisoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:nInliers-val is deprecated.  Use viso_extractor-msg:nInliers instead.")
  (nInliers m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <VisoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:time-val is deprecated.  Use viso_extractor-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'homography-val :lambda-list '(m))
(cl:defmethod homography-val ((m <VisoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:homography-val is deprecated.  Use viso_extractor-msg:homography instead.")
  (homography m))

(cl:ensure-generic-function 'matches-val :lambda-list '(m))
(cl:defmethod matches-val ((m <VisoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:matches-val is deprecated.  Use viso_extractor-msg:matches instead.")
  (matches m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <VisoFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:success-val is deprecated.  Use viso_extractor-msg:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VisoFrame>) ostream)
  "Serializes a message object of type '<VisoFrame>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'nMatches) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'nInliers) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'time) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'homography))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'homography))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'matches))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'matches))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VisoFrame>) istream)
  "Deserializes a message object of type '<VisoFrame>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'nMatches) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'nInliers) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'time) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'homography) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'homography)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'matches) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'matches)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'viso_extractor-msg:pMatch))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VisoFrame>)))
  "Returns string type for a message object of type '<VisoFrame>"
  "viso_extractor/VisoFrame")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VisoFrame)))
  "Returns string type for a message object of type 'VisoFrame"
  "viso_extractor/VisoFrame")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VisoFrame>)))
  "Returns md5sum for a message object of type '<VisoFrame>"
  "9fdd3a9666d1c582d73af55ae13305e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VisoFrame)))
  "Returns md5sum for a message object of type 'VisoFrame"
  "9fdd3a9666d1c582d73af55ae13305e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VisoFrame>)))
  "Returns full string definition for message of type '<VisoFrame>"
  (cl:format cl:nil " std_msgs/Float32 nMatches~% std_msgs/Float32 nInliers~% std_msgs/Int32 time~% float64[] homography~% viso_extractor/pMatch[] matches~% bool success~%================================================================================~%MSG: std_msgs/Float32~%float32 data~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: viso_extractor/pMatch~%std_msgs/Float32 u1p~%std_msgs/Float32 v1p~%std_msgs/Int32 i1p~%std_msgs/Float32 u2p~%std_msgs/Float32 v2p~%std_msgs/Int32 i2p~%std_msgs/Float32 u1c~%std_msgs/Float32 v1c~%std_msgs/Int32 i1c~%std_msgs/Float32 u2c~%std_msgs/Float32 v2c~%std_msgs/Int32 i2c~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VisoFrame)))
  "Returns full string definition for message of type 'VisoFrame"
  (cl:format cl:nil " std_msgs/Float32 nMatches~% std_msgs/Float32 nInliers~% std_msgs/Int32 time~% float64[] homography~% viso_extractor/pMatch[] matches~% bool success~%================================================================================~%MSG: std_msgs/Float32~%float32 data~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: viso_extractor/pMatch~%std_msgs/Float32 u1p~%std_msgs/Float32 v1p~%std_msgs/Int32 i1p~%std_msgs/Float32 u2p~%std_msgs/Float32 v2p~%std_msgs/Int32 i2p~%std_msgs/Float32 u1c~%std_msgs/Float32 v1c~%std_msgs/Int32 i1c~%std_msgs/Float32 u2c~%std_msgs/Float32 v2c~%std_msgs/Int32 i2c~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VisoFrame>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'nMatches))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'nInliers))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'time))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'homography) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'matches) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VisoFrame>))
  "Converts a ROS message object to a list"
  (cl:list 'VisoFrame
    (cl:cons ':nMatches (nMatches msg))
    (cl:cons ':nInliers (nInliers msg))
    (cl:cons ':time (time msg))
    (cl:cons ':homography (homography msg))
    (cl:cons ':matches (matches msg))
    (cl:cons ':success (success msg))
))
