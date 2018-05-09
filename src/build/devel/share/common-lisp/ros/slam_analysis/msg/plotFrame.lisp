; Auto-generated. Do not edit!


(cl:in-package slam_analysis-msg)


;//! \htmlinclude plotFrame.msg.html

(cl:defclass <plotFrame> (roslisp-msg-protocol:ros-message)
  ((delta
    :reader delta
    :initarg :delta
    :type front_end-msg:Homography
    :initform (cl:make-instance 'front_end-msg:Homography)))
)

(cl:defclass plotFrame (<plotFrame>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plotFrame>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plotFrame)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slam_analysis-msg:<plotFrame> is deprecated: use slam_analysis-msg:plotFrame instead.")))

(cl:ensure-generic-function 'delta-val :lambda-list '(m))
(cl:defmethod delta-val ((m <plotFrame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slam_analysis-msg:delta-val is deprecated.  Use slam_analysis-msg:delta instead.")
  (delta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plotFrame>) ostream)
  "Serializes a message object of type '<plotFrame>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'delta) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plotFrame>) istream)
  "Deserializes a message object of type '<plotFrame>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'delta) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plotFrame>)))
  "Returns string type for a message object of type '<plotFrame>"
  "slam_analysis/plotFrame")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotFrame)))
  "Returns string type for a message object of type 'plotFrame"
  "slam_analysis/plotFrame")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plotFrame>)))
  "Returns md5sum for a message object of type '<plotFrame>"
  "92c2da79f439e73ded798f48cae9cb47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plotFrame)))
  "Returns md5sum for a message object of type 'plotFrame"
  "92c2da79f439e73ded798f48cae9cb47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plotFrame>)))
  "Returns full string definition for message of type '<plotFrame>"
  (cl:format cl:nil "front_end/Homography delta~%~%================================================================================~%MSG: front_end/Homography~%float64[] data ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plotFrame)))
  "Returns full string definition for message of type 'plotFrame"
  (cl:format cl:nil "front_end/Homography delta~%~%================================================================================~%MSG: front_end/Homography~%float64[] data ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plotFrame>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'delta))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plotFrame>))
  "Converts a ROS message object to a list"
  (cl:list 'plotFrame
    (cl:cons ':delta (delta msg))
))
