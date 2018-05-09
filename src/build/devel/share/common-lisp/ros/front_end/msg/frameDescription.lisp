; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude frameDescription.msg.html

(cl:defclass <frameDescription> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass frameDescription (<frameDescription>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <frameDescription>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'frameDescription)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<frameDescription> is deprecated: use front_end-msg:frameDescription instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <frameDescription>) ostream)
  "Serializes a message object of type '<frameDescription>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <frameDescription>) istream)
  "Deserializes a message object of type '<frameDescription>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<frameDescription>)))
  "Returns string type for a message object of type '<frameDescription>"
  "front_end/frameDescription")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'frameDescription)))
  "Returns string type for a message object of type 'frameDescription"
  "front_end/frameDescription")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<frameDescription>)))
  "Returns md5sum for a message object of type '<frameDescription>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'frameDescription)))
  "Returns md5sum for a message object of type 'frameDescription"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<frameDescription>)))
  "Returns full string definition for message of type '<frameDescription>"
  (cl:format cl:nil " ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'frameDescription)))
  "Returns full string definition for message of type 'frameDescription"
  (cl:format cl:nil " ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <frameDescription>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <frameDescription>))
  "Converts a ROS message object to a list"
  (cl:list 'frameDescription
))
