; Auto-generated. Do not edit!


(cl:in-package dataset-srv)


;//! \htmlinclude getDatasetInfo-request.msg.html

(cl:defclass <getDatasetInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass getDatasetInfo-request (<getDatasetInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getDatasetInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getDatasetInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<getDatasetInfo-request> is deprecated: use dataset-srv:getDatasetInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getDatasetInfo-request>) ostream)
  "Serializes a message object of type '<getDatasetInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getDatasetInfo-request>) istream)
  "Deserializes a message object of type '<getDatasetInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getDatasetInfo-request>)))
  "Returns string type for a service object of type '<getDatasetInfo-request>"
  "dataset/getDatasetInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getDatasetInfo-request)))
  "Returns string type for a service object of type 'getDatasetInfo-request"
  "dataset/getDatasetInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getDatasetInfo-request>)))
  "Returns md5sum for a message object of type '<getDatasetInfo-request>"
  "a7e2ecfb328c516284c8b826e6c2925f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getDatasetInfo-request)))
  "Returns md5sum for a message object of type 'getDatasetInfo-request"
  "a7e2ecfb328c516284c8b826e6c2925f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getDatasetInfo-request>)))
  "Returns full string definition for message of type '<getDatasetInfo-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getDatasetInfo-request)))
  "Returns full string definition for message of type 'getDatasetInfo-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getDatasetInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getDatasetInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'getDatasetInfo-request
))
;//! \htmlinclude getDatasetInfo-response.msg.html

(cl:defclass <getDatasetInfo-response> (roslisp-msg-protocol:ros-message)
  ((rootFolder
    :reader rootFolder
    :initarg :rootFolder
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (currentIndex
    :reader currentIndex
    :initarg :currentIndex
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (imageName
    :reader imageName
    :initarg :imageName
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (status
    :reader status
    :initarg :status
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass getDatasetInfo-response (<getDatasetInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getDatasetInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getDatasetInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<getDatasetInfo-response> is deprecated: use dataset-srv:getDatasetInfo-response instead.")))

(cl:ensure-generic-function 'rootFolder-val :lambda-list '(m))
(cl:defmethod rootFolder-val ((m <getDatasetInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:rootFolder-val is deprecated.  Use dataset-srv:rootFolder instead.")
  (rootFolder m))

(cl:ensure-generic-function 'currentIndex-val :lambda-list '(m))
(cl:defmethod currentIndex-val ((m <getDatasetInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:currentIndex-val is deprecated.  Use dataset-srv:currentIndex instead.")
  (currentIndex m))

(cl:ensure-generic-function 'imageName-val :lambda-list '(m))
(cl:defmethod imageName-val ((m <getDatasetInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:imageName-val is deprecated.  Use dataset-srv:imageName instead.")
  (imageName m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <getDatasetInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dataset-srv:status-val is deprecated.  Use dataset-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getDatasetInfo-response>) ostream)
  "Serializes a message object of type '<getDatasetInfo-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rootFolder) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'currentIndex) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imageName) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'status) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getDatasetInfo-response>) istream)
  "Deserializes a message object of type '<getDatasetInfo-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rootFolder) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'currentIndex) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imageName) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'status) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getDatasetInfo-response>)))
  "Returns string type for a service object of type '<getDatasetInfo-response>"
  "dataset/getDatasetInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getDatasetInfo-response)))
  "Returns string type for a service object of type 'getDatasetInfo-response"
  "dataset/getDatasetInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getDatasetInfo-response>)))
  "Returns md5sum for a message object of type '<getDatasetInfo-response>"
  "a7e2ecfb328c516284c8b826e6c2925f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getDatasetInfo-response)))
  "Returns md5sum for a message object of type 'getDatasetInfo-response"
  "a7e2ecfb328c516284c8b826e6c2925f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getDatasetInfo-response>)))
  "Returns full string definition for message of type '<getDatasetInfo-response>"
  (cl:format cl:nil "std_msgs/String rootFolder~%std_msgs/Int32 currentIndex~%std_msgs/String imageName~%std_msgs/String status~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getDatasetInfo-response)))
  "Returns full string definition for message of type 'getDatasetInfo-response"
  (cl:format cl:nil "std_msgs/String rootFolder~%std_msgs/Int32 currentIndex~%std_msgs/String imageName~%std_msgs/String status~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getDatasetInfo-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rootFolder))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'currentIndex))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imageName))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getDatasetInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'getDatasetInfo-response
    (cl:cons ':rootFolder (rootFolder msg))
    (cl:cons ':currentIndex (currentIndex msg))
    (cl:cons ':imageName (imageName msg))
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'getDatasetInfo)))
  'getDatasetInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'getDatasetInfo)))
  'getDatasetInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getDatasetInfo)))
  "Returns string type for a service object of type '<getDatasetInfo>"
  "dataset/getDatasetInfo")