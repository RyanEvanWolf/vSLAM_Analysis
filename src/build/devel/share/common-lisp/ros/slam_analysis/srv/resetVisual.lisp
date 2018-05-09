; Auto-generated. Do not edit!


(cl:in-package slam_analysis-srv)


;//! \htmlinclude resetVisual-request.msg.html

(cl:defclass <resetVisual-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass resetVisual-request (<resetVisual-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetVisual-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetVisual-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_analysis-srv:<resetVisual-request> is deprecated: use slam_analysis-srv:resetVisual-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetVisual-request>) ostream)
  "Serializes a message object of type '<resetVisual-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetVisual-request>) istream)
  "Deserializes a message object of type '<resetVisual-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetVisual-request>)))
  "Returns string type for a service object of type '<resetVisual-request>"
  "slam_analysis/resetVisualRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetVisual-request)))
  "Returns string type for a service object of type 'resetVisual-request"
  "slam_analysis/resetVisualRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetVisual-request>)))
  "Returns md5sum for a message object of type '<resetVisual-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetVisual-request)))
  "Returns md5sum for a message object of type 'resetVisual-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetVisual-request>)))
  "Returns full string definition for message of type '<resetVisual-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetVisual-request)))
  "Returns full string definition for message of type 'resetVisual-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetVisual-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetVisual-request>))
  "Converts a ROS message object to a list"
  (cl:list 'resetVisual-request
))
;//! \htmlinclude resetVisual-response.msg.html

(cl:defclass <resetVisual-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass resetVisual-response (<resetVisual-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetVisual-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetVisual-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_analysis-srv:<resetVisual-response> is deprecated: use slam_analysis-srv:resetVisual-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetVisual-response>) ostream)
  "Serializes a message object of type '<resetVisual-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetVisual-response>) istream)
  "Deserializes a message object of type '<resetVisual-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetVisual-response>)))
  "Returns string type for a service object of type '<resetVisual-response>"
  "slam_analysis/resetVisualResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetVisual-response)))
  "Returns string type for a service object of type 'resetVisual-response"
  "slam_analysis/resetVisualResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetVisual-response>)))
  "Returns md5sum for a message object of type '<resetVisual-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetVisual-response)))
  "Returns md5sum for a message object of type 'resetVisual-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetVisual-response>)))
  "Returns full string definition for message of type '<resetVisual-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetVisual-response)))
  "Returns full string definition for message of type 'resetVisual-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetVisual-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetVisual-response>))
  "Converts a ROS message object to a list"
  (cl:list 'resetVisual-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'resetVisual)))
  'resetVisual-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'resetVisual)))
  'resetVisual-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetVisual)))
  "Returns string type for a service object of type '<resetVisual>"
  "slam_analysis/resetVisual")