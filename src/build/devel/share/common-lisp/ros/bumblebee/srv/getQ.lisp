; Auto-generated. Do not edit!


(cl:in-package bumblebee-srv)


;//! \htmlinclude getQ-request.msg.html

(cl:defclass <getQ-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass getQ-request (<getQ-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getQ-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getQ-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bumblebee-srv:<getQ-request> is deprecated: use bumblebee-srv:getQ-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getQ-request>) ostream)
  "Serializes a message object of type '<getQ-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getQ-request>) istream)
  "Deserializes a message object of type '<getQ-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getQ-request>)))
  "Returns string type for a service object of type '<getQ-request>"
  "bumblebee/getQRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getQ-request)))
  "Returns string type for a service object of type 'getQ-request"
  "bumblebee/getQRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getQ-request>)))
  "Returns md5sum for a message object of type '<getQ-request>"
  "ac38f58782c00220a4ce872420ec2e93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getQ-request)))
  "Returns md5sum for a message object of type 'getQ-request"
  "ac38f58782c00220a4ce872420ec2e93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getQ-request>)))
  "Returns full string definition for message of type '<getQ-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getQ-request)))
  "Returns full string definition for message of type 'getQ-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getQ-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getQ-request>))
  "Converts a ROS message object to a list"
  (cl:list 'getQ-request
))
;//! \htmlinclude getQ-response.msg.html

(cl:defclass <getQ-response> (roslisp-msg-protocol:ros-message)
  ((Q
    :reader Q
    :initarg :Q
    :type (cl:vector cl:float)
   :initform (cl:make-array 16 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass getQ-response (<getQ-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getQ-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getQ-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bumblebee-srv:<getQ-response> is deprecated: use bumblebee-srv:getQ-response instead.")))

(cl:ensure-generic-function 'Q-val :lambda-list '(m))
(cl:defmethod Q-val ((m <getQ-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:Q-val is deprecated.  Use bumblebee-srv:Q instead.")
  (Q m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getQ-response>) ostream)
  "Serializes a message object of type '<getQ-response>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'Q))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getQ-response>) istream)
  "Deserializes a message object of type '<getQ-response>"
  (cl:setf (cl:slot-value msg 'Q) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'Q)))
    (cl:dotimes (i 16)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getQ-response>)))
  "Returns string type for a service object of type '<getQ-response>"
  "bumblebee/getQResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getQ-response)))
  "Returns string type for a service object of type 'getQ-response"
  "bumblebee/getQResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getQ-response>)))
  "Returns md5sum for a message object of type '<getQ-response>"
  "ac38f58782c00220a4ce872420ec2e93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getQ-response)))
  "Returns md5sum for a message object of type 'getQ-response"
  "ac38f58782c00220a4ce872420ec2e93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getQ-response>)))
  "Returns full string definition for message of type '<getQ-response>"
  (cl:format cl:nil "float64[16] Q~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getQ-response)))
  "Returns full string definition for message of type 'getQ-response"
  (cl:format cl:nil "float64[16] Q~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getQ-response>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'Q) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getQ-response>))
  "Converts a ROS message object to a list"
  (cl:list 'getQ-response
    (cl:cons ':Q (Q msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'getQ)))
  'getQ-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'getQ)))
  'getQ-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getQ)))
  "Returns string type for a service object of type '<getQ>"
  "bumblebee/getQ")