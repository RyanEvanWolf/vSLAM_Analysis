; Auto-generated. Do not edit!


(cl:in-package front_end-msg)


;//! \htmlinclude frameDetection.msg.html

(cl:defclass <frameDetection> (roslisp-msg-protocol:ros-message)
  ((leftFeatures
    :reader leftFeatures
    :initarg :leftFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (detID
    :reader detID
    :initarg :detID
    :type cl:string
    :initform "")
   (nLeft
    :reader nLeft
    :initarg :nLeft
    :type cl:fixnum
    :initform 0)
   (l_xAvg
    :reader l_xAvg
    :initarg :l_xAvg
    :type cl:float
    :initform 0.0)
   (l_yAvg
    :reader l_yAvg
    :initarg :l_yAvg
    :type cl:float
    :initform 0.0)
   (l_xStd
    :reader l_xStd
    :initarg :l_xStd
    :type cl:float
    :initform 0.0)
   (l_yStd
    :reader l_yStd
    :initarg :l_yStd
    :type cl:float
    :initform 0.0)
   (rightFeatures
    :reader rightFeatures
    :initarg :rightFeatures
    :type (cl:vector front_end-msg:kPoint)
   :initform (cl:make-array 0 :element-type 'front_end-msg:kPoint :initial-element (cl:make-instance 'front_end-msg:kPoint)))
   (nRight
    :reader nRight
    :initarg :nRight
    :type cl:fixnum
    :initform 0)
   (r_xAvg
    :reader r_xAvg
    :initarg :r_xAvg
    :type cl:float
    :initform 0.0)
   (r_yAvg
    :reader r_yAvg
    :initarg :r_yAvg
    :type cl:float
    :initform 0.0)
   (r_xStd
    :reader r_xStd
    :initarg :r_xStd
    :type cl:float
    :initform 0.0)
   (r_yStd
    :reader r_yStd
    :initarg :r_yStd
    :type cl:float
    :initform 0.0)
   (processingTime
    :reader processingTime
    :initarg :processingTime
    :type (cl:vector front_end-msg:ProcTime)
   :initform (cl:make-array 0 :element-type 'front_end-msg:ProcTime :initial-element (cl:make-instance 'front_end-msg:ProcTime))))
)

(cl:defclass frameDetection (<frameDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <frameDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'frameDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name front_end-msg:<frameDetection> is deprecated: use front_end-msg:frameDetection instead.")))

(cl:ensure-generic-function 'leftFeatures-val :lambda-list '(m))
(cl:defmethod leftFeatures-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:leftFeatures-val is deprecated.  Use front_end-msg:leftFeatures instead.")
  (leftFeatures m))

(cl:ensure-generic-function 'detID-val :lambda-list '(m))
(cl:defmethod detID-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:detID-val is deprecated.  Use front_end-msg:detID instead.")
  (detID m))

(cl:ensure-generic-function 'nLeft-val :lambda-list '(m))
(cl:defmethod nLeft-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:nLeft-val is deprecated.  Use front_end-msg:nLeft instead.")
  (nLeft m))

(cl:ensure-generic-function 'l_xAvg-val :lambda-list '(m))
(cl:defmethod l_xAvg-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:l_xAvg-val is deprecated.  Use front_end-msg:l_xAvg instead.")
  (l_xAvg m))

(cl:ensure-generic-function 'l_yAvg-val :lambda-list '(m))
(cl:defmethod l_yAvg-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:l_yAvg-val is deprecated.  Use front_end-msg:l_yAvg instead.")
  (l_yAvg m))

(cl:ensure-generic-function 'l_xStd-val :lambda-list '(m))
(cl:defmethod l_xStd-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:l_xStd-val is deprecated.  Use front_end-msg:l_xStd instead.")
  (l_xStd m))

(cl:ensure-generic-function 'l_yStd-val :lambda-list '(m))
(cl:defmethod l_yStd-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:l_yStd-val is deprecated.  Use front_end-msg:l_yStd instead.")
  (l_yStd m))

(cl:ensure-generic-function 'rightFeatures-val :lambda-list '(m))
(cl:defmethod rightFeatures-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:rightFeatures-val is deprecated.  Use front_end-msg:rightFeatures instead.")
  (rightFeatures m))

(cl:ensure-generic-function 'nRight-val :lambda-list '(m))
(cl:defmethod nRight-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:nRight-val is deprecated.  Use front_end-msg:nRight instead.")
  (nRight m))

(cl:ensure-generic-function 'r_xAvg-val :lambda-list '(m))
(cl:defmethod r_xAvg-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:r_xAvg-val is deprecated.  Use front_end-msg:r_xAvg instead.")
  (r_xAvg m))

(cl:ensure-generic-function 'r_yAvg-val :lambda-list '(m))
(cl:defmethod r_yAvg-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:r_yAvg-val is deprecated.  Use front_end-msg:r_yAvg instead.")
  (r_yAvg m))

(cl:ensure-generic-function 'r_xStd-val :lambda-list '(m))
(cl:defmethod r_xStd-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:r_xStd-val is deprecated.  Use front_end-msg:r_xStd instead.")
  (r_xStd m))

(cl:ensure-generic-function 'r_yStd-val :lambda-list '(m))
(cl:defmethod r_yStd-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:r_yStd-val is deprecated.  Use front_end-msg:r_yStd instead.")
  (r_yStd m))

(cl:ensure-generic-function 'processingTime-val :lambda-list '(m))
(cl:defmethod processingTime-val ((m <frameDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader front_end-msg:processingTime-val is deprecated.  Use front_end-msg:processingTime instead.")
  (processingTime m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <frameDetection>) ostream)
  "Serializes a message object of type '<frameDetection>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'leftFeatures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'leftFeatures))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'detID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'detID))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeft)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeft)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'l_xAvg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'l_yAvg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'l_xStd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'l_yStd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rightFeatures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rightFeatures))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRight)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRight)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r_xAvg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r_yAvg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r_xStd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r_yStd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'processingTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'processingTime))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <frameDetection>) istream)
  "Deserializes a message object of type '<frameDetection>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'leftFeatures) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'leftFeatures)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:kPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'detID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLeft)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nLeft)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'l_xAvg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'l_yAvg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'l_xStd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'l_yStd) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rightFeatures) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rightFeatures)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:kPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nRight)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nRight)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_xAvg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_yAvg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_xStd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_yStd) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'processingTime) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'processingTime)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'front_end-msg:ProcTime))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<frameDetection>)))
  "Returns string type for a message object of type '<frameDetection>"
  "front_end/frameDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'frameDetection)))
  "Returns string type for a message object of type 'frameDetection"
  "front_end/frameDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<frameDetection>)))
  "Returns md5sum for a message object of type '<frameDetection>"
  "c89ff5835b42d14d6becea0d41610e82")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'frameDetection)))
  "Returns md5sum for a message object of type 'frameDetection"
  "c89ff5835b42d14d6becea0d41610e82")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<frameDetection>)))
  "Returns full string definition for message of type '<frameDetection>"
  (cl:format cl:nil "front_end/kPoint[] leftFeatures~%string detID~%uint16 nLeft~%float32 l_xAvg~%float32 l_yAvg~%float32 l_xStd~%float32 l_yStd~%front_end/kPoint[] rightFeatures~%uint16 nRight~%float32 r_xAvg~%float32 r_yAvg~%float32 r_xStd~%float32 r_yStd~%front_end/ProcTime[] processingTime ~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'frameDetection)))
  "Returns full string definition for message of type 'frameDetection"
  (cl:format cl:nil "front_end/kPoint[] leftFeatures~%string detID~%uint16 nLeft~%float32 l_xAvg~%float32 l_yAvg~%float32 l_xStd~%float32 l_yStd~%front_end/kPoint[] rightFeatures~%uint16 nRight~%float32 r_xAvg~%float32 r_yAvg~%float32 r_xStd~%float32 r_yStd~%front_end/ProcTime[] processingTime ~%~%================================================================================~%MSG: front_end/kPoint~%float32 x~%float32 y~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%~%================================================================================~%MSG: front_end/ProcTime~%string label~%float64 seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <frameDetection>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'leftFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'detID))
     2
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rightFeatures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     2
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'processingTime) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <frameDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'frameDetection
    (cl:cons ':leftFeatures (leftFeatures msg))
    (cl:cons ':detID (detID msg))
    (cl:cons ':nLeft (nLeft msg))
    (cl:cons ':l_xAvg (l_xAvg msg))
    (cl:cons ':l_yAvg (l_yAvg msg))
    (cl:cons ':l_xStd (l_xStd msg))
    (cl:cons ':l_yStd (l_yStd msg))
    (cl:cons ':rightFeatures (rightFeatures msg))
    (cl:cons ':nRight (nRight msg))
    (cl:cons ':r_xAvg (r_xAvg msg))
    (cl:cons ':r_yAvg (r_yAvg msg))
    (cl:cons ':r_xStd (r_xStd msg))
    (cl:cons ':r_yStd (r_yStd msg))
    (cl:cons ':processingTime (processingTime msg))
))
