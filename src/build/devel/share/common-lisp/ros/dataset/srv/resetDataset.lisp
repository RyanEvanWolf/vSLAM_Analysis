; Auto-generated. Do not edit!


(cl:in-package dataset-srv)


;//! \htmlinclude resetDataset-request.msg.html

(cl:defclass <resetDataset-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass resetDataset-request (<resetDataset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetDataset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetDataset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<resetDataset-request> is deprecated: use dataset-srv:resetDataset-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetDataset-request>) ostream)
  "Serializes a message object of type '<resetDataset-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetDataset-request>) istream)
  "Deserializes a message object of type '<resetDataset-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetDataset-request>)))
  "Returns string type for a service object of type '<resetDataset-request>"
  "dataset/resetDatasetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetDataset-request)))
  "Returns string type for a service object of type 'resetDataset-request"
  "dataset/resetDatasetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetDataset-request>)))
  "Returns md5sum for a message object of type '<resetDataset-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetDataset-request)))
  "Returns md5sum for a message object of type 'resetDataset-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetDataset-request>)))
  "Returns full string definition for message of type '<resetDataset-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetDataset-request)))
  "Returns full string definition for message of type 'resetDataset-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetDataset-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetDataset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'resetDataset-request
))
;//! \htmlinclude resetDataset-response.msg.html

(cl:defclass <resetDataset-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass resetDataset-response (<resetDataset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetDataset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetDataset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dataset-srv:<resetDataset-response> is deprecated: use dataset-srv:resetDataset-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetDataset-response>) ostream)
  "Serializes a message object of type '<resetDataset-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetDataset-response>) istream)
  "Deserializes a message object of type '<resetDataset-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetDataset-response>)))
  "Returns string type for a service object of type '<resetDataset-response>"
  "dataset/resetDatasetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetDataset-response)))
  "Returns string type for a service object of type 'resetDataset-response"
  "dataset/resetDatasetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetDataset-response>)))
  "Returns md5sum for a message object of type '<resetDataset-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetDataset-response)))
  "Returns md5sum for a message object of type 'resetDataset-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetDataset-response>)))
  "Returns full string definition for message of type '<resetDataset-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetDataset-response)))
  "Returns full string definition for message of type 'resetDataset-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetDataset-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetDataset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'resetDataset-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'resetDataset)))
  'resetDataset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'resetDataset)))
  'resetDataset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetDataset)))
  "Returns string type for a service object of type '<resetDataset>"
  "dataset/resetDataset")