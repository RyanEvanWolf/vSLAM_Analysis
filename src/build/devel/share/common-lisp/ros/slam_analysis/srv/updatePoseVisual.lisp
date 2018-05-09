; Auto-generated. Do not edit!


(cl:in-package slam_analysis-srv)


;//! \htmlinclude updatePoseVisual-request.msg.html

(cl:defclass <updatePoseVisual-request> (roslisp-msg-protocol:ros-message)
  ((latest
    :reader latest
    :initarg :latest
    :type slam_analysis-msg:plotFrame
    :initform (cl:make-instance 'slam_analysis-msg:plotFrame)))
)

(cl:defclass updatePoseVisual-request (<updatePoseVisual-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updatePoseVisual-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updatePoseVisual-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_analysis-srv:<updatePoseVisual-request> is deprecated: use slam_analysis-srv:updatePoseVisual-request instead.")))

(cl:ensure-generic-function 'latest-val :lambda-list '(m))
(cl:defmethod latest-val ((m <updatePoseVisual-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_analysis-srv:latest-val is deprecated.  Use slam_analysis-srv:latest instead.")
  (latest m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updatePoseVisual-request>) ostream)
  "Serializes a message object of type '<updatePoseVisual-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'latest) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updatePoseVisual-request>) istream)
  "Deserializes a message object of type '<updatePoseVisual-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'latest) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updatePoseVisual-request>)))
  "Returns string type for a service object of type '<updatePoseVisual-request>"
  "slam_analysis/updatePoseVisualRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updatePoseVisual-request)))
  "Returns string type for a service object of type 'updatePoseVisual-request"
  "slam_analysis/updatePoseVisualRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updatePoseVisual-request>)))
  "Returns md5sum for a message object of type '<updatePoseVisual-request>"
  "c46665824f7184fd974e046eada6d32e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updatePoseVisual-request)))
  "Returns md5sum for a message object of type 'updatePoseVisual-request"
  "c46665824f7184fd974e046eada6d32e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updatePoseVisual-request>)))
  "Returns full string definition for message of type '<updatePoseVisual-request>"
  (cl:format cl:nil "slam_analysis/plotFrame latest~%~%================================================================================~%MSG: slam_analysis/plotFrame~%front_end/Homography delta~%~%================================================================================~%MSG: front_end/Homography~%float64[] data ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updatePoseVisual-request)))
  "Returns full string definition for message of type 'updatePoseVisual-request"
  (cl:format cl:nil "slam_analysis/plotFrame latest~%~%================================================================================~%MSG: slam_analysis/plotFrame~%front_end/Homography delta~%~%================================================================================~%MSG: front_end/Homography~%float64[] data ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updatePoseVisual-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'latest))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updatePoseVisual-request>))
  "Converts a ROS message object to a list"
  (cl:list 'updatePoseVisual-request
    (cl:cons ':latest (latest msg))
))
;//! \htmlinclude updatePoseVisual-response.msg.html

(cl:defclass <updatePoseVisual-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass updatePoseVisual-response (<updatePoseVisual-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updatePoseVisual-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updatePoseVisual-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_analysis-srv:<updatePoseVisual-response> is deprecated: use slam_analysis-srv:updatePoseVisual-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updatePoseVisual-response>) ostream)
  "Serializes a message object of type '<updatePoseVisual-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updatePoseVisual-response>) istream)
  "Deserializes a message object of type '<updatePoseVisual-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updatePoseVisual-response>)))
  "Returns string type for a service object of type '<updatePoseVisual-response>"
  "slam_analysis/updatePoseVisualResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updatePoseVisual-response)))
  "Returns string type for a service object of type 'updatePoseVisual-response"
  "slam_analysis/updatePoseVisualResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updatePoseVisual-response>)))
  "Returns md5sum for a message object of type '<updatePoseVisual-response>"
  "c46665824f7184fd974e046eada6d32e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updatePoseVisual-response)))
  "Returns md5sum for a message object of type 'updatePoseVisual-response"
  "c46665824f7184fd974e046eada6d32e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updatePoseVisual-response>)))
  "Returns full string definition for message of type '<updatePoseVisual-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updatePoseVisual-response)))
  "Returns full string definition for message of type 'updatePoseVisual-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updatePoseVisual-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updatePoseVisual-response>))
  "Converts a ROS message object to a list"
  (cl:list 'updatePoseVisual-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'updatePoseVisual)))
  'updatePoseVisual-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'updatePoseVisual)))
  'updatePoseVisual-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updatePoseVisual)))
  "Returns string type for a service object of type '<updatePoseVisual>"
  "slam_analysis/updatePoseVisual")