; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude ProcTime.msg.html

(cl:defclass <ProcTime> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:string
    :initform "")
   (seconds
    :reader seconds
    :initarg :seconds
    :type cl:float
    :initform 0.0))
)

(cl:defclass ProcTime (<ProcTime>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcTime>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcTime)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<ProcTime> is deprecated: use front_end-msg:ProcTime instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <ProcTime>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:label-val is deprecated.  Use front_end-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'seconds-val :lambda-list '(m))
(cl:defmethod seconds-val ((m <ProcTime>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:seconds-val is deprecated.  Use front_end-msg:seconds instead.")
  (seconds m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcTime>) ostream)
  "Serializes a message object of type '<ProcTime>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'seconds))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcTime>) istream)
  "Deserializes a message object of type '<ProcTime>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'seconds) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcTime>)))
  "Returns string type for a message object of type '<ProcTime>"
  "front_end/ProcTime")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcTime)))
  "Returns string type for a message object of type 'ProcTime"
  "front_end/ProcTime")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcTime>)))
  "Returns md5sum for a message object of type '<ProcTime>"
  "adeb5bed2cff8503e6a304382d1eecbf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcTime)))
  "Returns md5sum for a message object of type 'ProcTime"
  "adeb5bed2cff8503e6a304382d1eecbf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcTime>)))
  "Returns full string definition for message of type '<ProcTime>"
  (cl:format cl:nil "string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcTime)))
  "Returns full string definition for message of type 'ProcTime"
  (cl:format cl:nil "string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcTime>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcTime>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcTime
    (cl:cons ':label (label msg))
    (cl:cons ':seconds (seconds msg))
))
