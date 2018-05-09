; Auto-generated. Do not edit!


(cl:in-package viso_extractor-msg)


;//! \htmlinclude pMatch.msg.html

(cl:defclass <pMatch> (roslisp-msg-protocol:ros-message)
  ((u1p
    :reader u1p
    :initarg :u1p
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (v1p
    :reader v1p
    :initarg :v1p
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (i1p
    :reader i1p
    :initarg :i1p
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (u2p
    :reader u2p
    :initarg :u2p
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (v2p
    :reader v2p
    :initarg :v2p
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (i2p
    :reader i2p
    :initarg :i2p
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (u1c
    :reader u1c
    :initarg :u1c
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (v1c
    :reader v1c
    :initarg :v1c
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (i1c
    :reader i1c
    :initarg :i1c
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (u2c
    :reader u2c
    :initarg :u2c
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (v2c
    :reader v2c
    :initarg :v2c
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (i2c
    :reader i2c
    :initarg :i2c
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32)))
)

(cl:defclass pMatch (<pMatch>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pMatch>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pMatch)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name viso_extractor-msg:<pMatch> is deprecated: use viso_extractor-msg:pMatch instead.")))

(cl:ensure-generic-function 'u1p-val :lambda-list '(m))
(cl:defmethod u1p-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:u1p-val is deprecated.  Use viso_extractor-msg:u1p instead.")
  (u1p m))

(cl:ensure-generic-function 'v1p-val :lambda-list '(m))
(cl:defmethod v1p-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:v1p-val is deprecated.  Use viso_extractor-msg:v1p instead.")
  (v1p m))

(cl:ensure-generic-function 'i1p-val :lambda-list '(m))
(cl:defmethod i1p-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:i1p-val is deprecated.  Use viso_extractor-msg:i1p instead.")
  (i1p m))

(cl:ensure-generic-function 'u2p-val :lambda-list '(m))
(cl:defmethod u2p-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:u2p-val is deprecated.  Use viso_extractor-msg:u2p instead.")
  (u2p m))

(cl:ensure-generic-function 'v2p-val :lambda-list '(m))
(cl:defmethod v2p-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:v2p-val is deprecated.  Use viso_extractor-msg:v2p instead.")
  (v2p m))

(cl:ensure-generic-function 'i2p-val :lambda-list '(m))
(cl:defmethod i2p-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:i2p-val is deprecated.  Use viso_extractor-msg:i2p instead.")
  (i2p m))

(cl:ensure-generic-function 'u1c-val :lambda-list '(m))
(cl:defmethod u1c-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:u1c-val is deprecated.  Use viso_extractor-msg:u1c instead.")
  (u1c m))

(cl:ensure-generic-function 'v1c-val :lambda-list '(m))
(cl:defmethod v1c-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:v1c-val is deprecated.  Use viso_extractor-msg:v1c instead.")
  (v1c m))

(cl:ensure-generic-function 'i1c-val :lambda-list '(m))
(cl:defmethod i1c-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:i1c-val is deprecated.  Use viso_extractor-msg:i1c instead.")
  (i1c m))

(cl:ensure-generic-function 'u2c-val :lambda-list '(m))
(cl:defmethod u2c-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:u2c-val is deprecated.  Use viso_extractor-msg:u2c instead.")
  (u2c m))

(cl:ensure-generic-function 'v2c-val :lambda-list '(m))
(cl:defmethod v2c-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:v2c-val is deprecated.  Use viso_extractor-msg:v2c instead.")
  (v2c m))

(cl:ensure-generic-function 'i2c-val :lambda-list '(m))
(cl:defmethod i2c-val ((m <pMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader viso_extractor-msg:i2c-val is deprecated.  Use viso_extractor-msg:i2c instead.")
  (i2c m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pMatch>) ostream)
  "Serializes a message object of type '<pMatch>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'u1p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'v1p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'i1p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'u2p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'v2p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'i2p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'u1c) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'v1c) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'i1c) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'u2c) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'v2c) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'i2c) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pMatch>) istream)
  "Deserializes a message object of type '<pMatch>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'u1p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'v1p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'i1p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'u2p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'v2p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'i2p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'u1c) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'v1c) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'i1c) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'u2c) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'v2c) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'i2c) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pMatch>)))
  "Returns string type for a message object of type '<pMatch>"
  "viso_extractor/pMatch")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pMatch)))
  "Returns string type for a message object of type 'pMatch"
  "viso_extractor/pMatch")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pMatch>)))
  "Returns md5sum for a message object of type '<pMatch>"
  "83f4f899dee21ad25ff19f486f6fe1c6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pMatch)))
  "Returns md5sum for a message object of type 'pMatch"
  "83f4f899dee21ad25ff19f486f6fe1c6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pMatch>)))
  "Returns full string definition for message of type '<pMatch>"
  (cl:format cl:nil "std_msgs/Float32 u1p~%std_msgs/Float32 v1p~%std_msgs/Int32 i1p~%std_msgs/Float32 u2p~%std_msgs/Float32 v2p~%std_msgs/Int32 i2p~%std_msgs/Float32 u1c~%std_msgs/Float32 v1c~%std_msgs/Int32 i1c~%std_msgs/Float32 u2c~%std_msgs/Float32 v2c~%std_msgs/Int32 i2c~%~%================================================================================~%MSG: std_msgs/Float32~%float32 data~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pMatch)))
  "Returns full string definition for message of type 'pMatch"
  (cl:format cl:nil "std_msgs/Float32 u1p~%std_msgs/Float32 v1p~%std_msgs/Int32 i1p~%std_msgs/Float32 u2p~%std_msgs/Float32 v2p~%std_msgs/Int32 i2p~%std_msgs/Float32 u1c~%std_msgs/Float32 v1c~%std_msgs/Int32 i1c~%std_msgs/Float32 u2c~%std_msgs/Float32 v2c~%std_msgs/Int32 i2c~%~%================================================================================~%MSG: std_msgs/Float32~%float32 data~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pMatch>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'u1p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'v1p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'i1p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'u2p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'v2p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'i2p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'u1c))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'v1c))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'i1c))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'u2c))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'v2c))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'i2c))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pMatch>))
  "Converts a ROS message object to a list"
  (cl:list 'pMatch
    (cl:cons ':u1p (u1p msg))
    (cl:cons ':v1p (v1p msg))
    (cl:cons ':i1p (i1p msg))
    (cl:cons ':u2p (u2p msg))
    (cl:cons ':v2p (v2p msg))
    (cl:cons ':i2p (i2p msg))
    (cl:cons ':u1c (u1c msg))
    (cl:cons ':v1c (v1c msg))
    (cl:cons ':i1c (i1c msg))
    (cl:cons ':u2c (u2c msg))
    (cl:cons ':v2c (v2c msg))
    (cl:cons ':i2c (i2c msg))
))
