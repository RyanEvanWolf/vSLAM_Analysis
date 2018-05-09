; Auto-generated. Do not edit!


(cl:in-package dataset-srv)


;//! \htmlinclude publishImage-request.msg.html

(cl:defclass <publishImage-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass publishImage-request (<publishImage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <publishImage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'publishImage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<publishImage-request> is deprecated: use dataset-srv:publishImage-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <publishImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:command-val is deprecated.  Use dataset-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <publishImage-request>) ostream)
  "Serializes a message object of type '<publishImage-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'command) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <publishImage-request>) istream)
  "Deserializes a message object of type '<publishImage-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'command) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<publishImage-request>)))
  "Returns string type for a service object of type '<publishImage-request>"
  "dataset/publishImageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'publishImage-request)))
  "Returns string type for a service object of type 'publishImage-request"
  "dataset/publishImageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<publishImage-request>)))
  "Returns md5sum for a message object of type '<publishImage-request>"
  "cdf090c379ad13ac3ab0237145174f96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'publishImage-request)))
  "Returns md5sum for a message object of type 'publishImage-request"
  "cdf090c379ad13ac3ab0237145174f96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<publishImage-request>)))
  "Returns full string definition for message of type '<publishImage-request>"
  (cl:format cl:nil "std_msgs/String command~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'publishImage-request)))
  "Returns full string definition for message of type 'publishImage-request"
  (cl:format cl:nil "std_msgs/String command~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <publishImage-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <publishImage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'publishImage-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude publishImage-response.msg.html

(cl:defclass <publishImage-response> (roslisp-msg-protocol:ros-message)
  ((currentIndex
    :reader currentIndex
    :initarg :currentIndex
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (status
    :reader status
    :initarg :status
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass publishImage-response (<publishImage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <publishImage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'publishImage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<publishImage-response> is deprecated: use dataset-srv:publishImage-response instead.")))

(cl:ensure-generic-function 'currentIndex-val :lambda-list '(m))
(cl:defmethod currentIndex-val ((m <publishImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:currentIndex-val is deprecated.  Use dataset-srv:currentIndex instead.")
  (currentIndex m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <publishImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:status-val is deprecated.  Use dataset-srv:status instead.")
  (status m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <publishImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:success-val is deprecated.  Use dataset-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <publishImage-response>) ostream)
  "Serializes a message object of type '<publishImage-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'currentIndex) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'status) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <publishImage-response>) istream)
  "Deserializes a message object of type '<publishImage-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'currentIndex) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'status) istream)
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<publishImage-response>)))
  "Returns string type for a service object of type '<publishImage-response>"
  "dataset/publishImageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'publishImage-response)))
  "Returns string type for a service object of type 'publishImage-response"
  "dataset/publishImageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<publishImage-response>)))
  "Returns md5sum for a message object of type '<publishImage-response>"
  "cdf090c379ad13ac3ab0237145174f96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'publishImage-response)))
  "Returns md5sum for a message object of type 'publishImage-response"
  "cdf090c379ad13ac3ab0237145174f96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<publishImage-response>)))
  "Returns full string definition for message of type '<publishImage-response>"
  (cl:format cl:nil "std_msgs/Int32 currentIndex~%std_msgs/String status~%bool success~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'publishImage-response)))
  "Returns full string definition for message of type 'publishImage-response"
  (cl:format cl:nil "std_msgs/Int32 currentIndex~%std_msgs/String status~%bool success~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <publishImage-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'currentIndex))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'status))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <publishImage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'publishImage-response
    (cl:cons ':currentIndex (currentIndex msg))
    (cl:cons ':status (status msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'publishImage)))
  'publishImage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'publishImage)))
  'publishImage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'publishImage)))
  "Returns string type for a service object of type '<publishImage>"
  "dataset/publishImage")