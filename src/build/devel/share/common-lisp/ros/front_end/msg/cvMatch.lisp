; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude cvMatch.msg.html

(cl:defclass <cvMatch> (roslisp-msg-protocol:ros-message)
  ((queryIdx
    :reader queryIdx
    :initarg :queryIdx
    :type cl:integer
    :initform 0)
   (trainIdx
    :reader trainIdx
    :initarg :trainIdx
    :type cl:integer
    :initform 0)
   (imgIdx
    :reader imgIdx
    :initarg :imgIdx
    :type cl:integer
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass cvMatch (<cvMatch>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cvMatch>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cvMatch)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<cvMatch> is deprecated: use front_end-msg:cvMatch instead.")))

(cl:ensure-generic-function 'queryIdx-val :lambda-list '(m))
(cl:defmethod queryIdx-val ((m <cvMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:queryIdx-val is deprecated.  Use front_end-msg:queryIdx instead.")
  (queryIdx m))

(cl:ensure-generic-function 'trainIdx-val :lambda-list '(m))
(cl:defmethod trainIdx-val ((m <cvMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:trainIdx-val is deprecated.  Use front_end-msg:trainIdx instead.")
  (trainIdx m))

(cl:ensure-generic-function 'imgIdx-val :lambda-list '(m))
(cl:defmethod imgIdx-val ((m <cvMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:imgIdx-val is deprecated.  Use front_end-msg:imgIdx instead.")
  (imgIdx m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <cvMatch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:distance-val is deprecated.  Use front_end-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cvMatch>) ostream)
  "Serializes a message object of type '<cvMatch>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queryIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'queryIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'queryIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'queryIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trainIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'trainIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'trainIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'trainIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'imgIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'imgIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'imgIdx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'imgIdx)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cvMatch>) istream)
  "Deserializes a message object of type '<cvMatch>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queryIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'queryIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'queryIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'queryIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trainIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'trainIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'trainIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'trainIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'imgIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'imgIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'imgIdx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'imgIdx)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cvMatch>)))
  "Returns string type for a message object of type '<cvMatch>"
  "front_end/cvMatch")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cvMatch)))
  "Returns string type for a message object of type 'cvMatch"
  "front_end/cvMatch")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cvMatch>)))
  "Returns md5sum for a message object of type '<cvMatch>"
  "1c8d600ac557f1a63783116fb9567511")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cvMatch)))
  "Returns md5sum for a message object of type 'cvMatch"
  "1c8d600ac557f1a63783116fb9567511")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cvMatch>)))
  "Returns full string definition for message of type '<cvMatch>"
  (cl:format cl:nil "uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cvMatch)))
  "Returns full string definition for message of type 'cvMatch"
  (cl:format cl:nil "uint32 queryIdx~%uint32 trainIdx~%uint32 imgIdx~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cvMatch>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cvMatch>))
  "Converts a ROS message object to a list"
  (cl:list 'cvMatch
    (cl:cons ':queryIdx (queryIdx msg))
    (cl:cons ':trainIdx (trainIdx msg))
    (cl:cons ':imgIdx (imgIdx msg))
    (cl:cons ':distance (distance msg))
))
