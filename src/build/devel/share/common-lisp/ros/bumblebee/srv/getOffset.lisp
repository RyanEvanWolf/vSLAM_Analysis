; Auto-generated. Do not edit!


(cl:in-package bumblebee-srv)


;//! \htmlinclude getOffset-request.msg.html

(cl:defclass <getOffset-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass getOffset-request (<getOffset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getOffset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getOffset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bumblebee-srv:<getOffset-request> is deprecated: use bumblebee-srv:getOffset-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getOffset-request>) ostream)
  "Serializes a message object of type '<getOffset-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getOffset-request>) istream)
  "Deserializes a message object of type '<getOffset-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getOffset-request>)))
  "Returns string type for a service object of type '<getOffset-request>"
  "bumblebee/getOffsetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getOffset-request)))
  "Returns string type for a service object of type 'getOffset-request"
  "bumblebee/getOffsetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getOffset-request>)))
  "Returns md5sum for a message object of type '<getOffset-request>"
  "e0fde965a1b7161594fc69b01cf6bc87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getOffset-request)))
  "Returns md5sum for a message object of type 'getOffset-request"
  "e0fde965a1b7161594fc69b01cf6bc87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getOffset-request>)))
  "Returns full string definition for message of type '<getOffset-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getOffset-request)))
  "Returns full string definition for message of type 'getOffset-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getOffset-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getOffset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'getOffset-request
))
;//! \htmlinclude getOffset-response.msg.html

(cl:defclass <getOffset-response> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type sensor_msgs-msg:RegionOfInterest
    :initform (cl:make-instance 'sensor_msgs-msg:RegionOfInterest))
   (right
    :reader right
    :initarg :right
    :type sensor_msgs-msg:RegionOfInterest
    :initform (cl:make-instance 'sensor_msgs-msg:RegionOfInterest)))
)

(cl:defclass getOffset-response (<getOffset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <getOffset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'getOffset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bumblebee-srv:<getOffset-response> is deprecated: use bumblebee-srv:getOffset-response instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <getOffset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:left-val is deprecated.  Use bumblebee-srv:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <getOffset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bumblebee-srv:right-val is deprecated.  Use bumblebee-srv:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <getOffset-response>) ostream)
  "Serializes a message object of type '<getOffset-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <getOffset-response>) istream)
  "Deserializes a message object of type '<getOffset-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<getOffset-response>)))
  "Returns string type for a service object of type '<getOffset-response>"
  "bumblebee/getOffsetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getOffset-response)))
  "Returns string type for a service object of type 'getOffset-response"
  "bumblebee/getOffsetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<getOffset-response>)))
  "Returns md5sum for a message object of type '<getOffset-response>"
  "e0fde965a1b7161594fc69b01cf6bc87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'getOffset-response)))
  "Returns md5sum for a message object of type 'getOffset-response"
  "e0fde965a1b7161594fc69b01cf6bc87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<getOffset-response>)))
  "Returns full string definition for message of type '<getOffset-response>"
  (cl:format cl:nil "sensor_msgs/RegionOfInterest left~%sensor_msgs/RegionOfInterest right~%~%~%================================================================================~%MSG: sensor_msgs/RegionOfInterest~%# This message is used to specify a region of interest within an image.~%#~%# When used to specify the ROI setting of the camera when the image was~%# taken, the height and width fields should either match the height and~%# width fields for the associated image; or height = width = 0~%# indicates that the full resolution image was captured.~%~%uint32 x_offset  # Leftmost pixel of the ROI~%                 # (0 if the ROI includes the left edge of the image)~%uint32 y_offset  # Topmost pixel of the ROI~%                 # (0 if the ROI includes the top edge of the image)~%uint32 height    # Height of ROI~%uint32 width     # Width of ROI~%~%# True if a distinct rectified ROI should be calculated from the \"raw\"~%# ROI in this message. Typically this should be False if the full image~%# is captured (ROI not used), and True if a subwindow is captured (ROI~%# used).~%bool do_rectify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'getOffset-response)))
  "Returns full string definition for message of type 'getOffset-response"
  (cl:format cl:nil "sensor_msgs/RegionOfInterest left~%sensor_msgs/RegionOfInterest right~%~%~%================================================================================~%MSG: sensor_msgs/RegionOfInterest~%# This message is used to specify a region of interest within an image.~%#~%# When used to specify the ROI setting of the camera when the image was~%# taken, the height and width fields should either match the height and~%# width fields for the associated image; or height = width = 0~%# indicates that the full resolution image was captured.~%~%uint32 x_offset  # Leftmost pixel of the ROI~%                 # (0 if the ROI includes the left edge of the image)~%uint32 y_offset  # Topmost pixel of the ROI~%                 # (0 if the ROI includes the top edge of the image)~%uint32 height    # Height of ROI~%uint32 width     # Width of ROI~%~%# True if a distinct rectified ROI should be calculated from the \"raw\"~%# ROI in this message. Typically this should be False if the full image~%# is captured (ROI not used), and True if a subwindow is captured (ROI~%# used).~%bool do_rectify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <getOffset-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <getOffset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'getOffset-response
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'getOffset)))
  'getOffset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'getOffset)))
  'getOffset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'getOffset)))
  "Returns string type for a service object of type '<getOffset>"
  "bumblebee/getOffset")