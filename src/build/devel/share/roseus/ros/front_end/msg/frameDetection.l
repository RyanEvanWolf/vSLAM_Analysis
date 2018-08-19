;; Auto-generated. Do not edit!


(when (boundp 'front_end::frameDetection)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'frameDetection (find-package "FRONT_END")))
(unless (find-package "FRONT_END::FRAMEDETECTION")
  (make-package "FRONT_END::FRAMEDETECTION"))

(in-package "ROS")
;;//! \htmlinclude frameDetection.msg.html


(defclass front_end::frameDetection
  :super ros::object
  :slots (_leftFeatures _detID _nLeft _l_xAvg _l_yAvg _l_xStd _l_yStd _rightFeatures _nRight _r_xAvg _r_yAvg _r_xStd _r_yStd _processingTime ))

(defmethod front_end::frameDetection
  (:init
   (&key
    ((:leftFeatures __leftFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:detID __detID) "")
    ((:nLeft __nLeft) 0)
    ((:l_xAvg __l_xAvg) 0.0)
    ((:l_yAvg __l_yAvg) 0.0)
    ((:l_xStd __l_xStd) 0.0)
    ((:l_yStd __l_yStd) 0.0)
    ((:rightFeatures __rightFeatures) (let (r) (dotimes (i 0) (push (instance front_end::kPoint :init) r)) r))
    ((:nRight __nRight) 0)
    ((:r_xAvg __r_xAvg) 0.0)
    ((:r_yAvg __r_yAvg) 0.0)
    ((:r_xStd __r_xStd) 0.0)
    ((:r_yStd __r_yStd) 0.0)
    ((:processingTime __processingTime) (let (r) (dotimes (i 0) (push (instance front_end::ProcTime :init) r)) r))
    )
   (send-super :init)
   (setq _leftFeatures __leftFeatures)
   (setq _detID (string __detID))
   (setq _nLeft (round __nLeft))
   (setq _l_xAvg (float __l_xAvg))
   (setq _l_yAvg (float __l_yAvg))
   (setq _l_xStd (float __l_xStd))
   (setq _l_yStd (float __l_yStd))
   (setq _rightFeatures __rightFeatures)
   (setq _nRight (round __nRight))
   (setq _r_xAvg (float __r_xAvg))
   (setq _r_yAvg (float __r_yAvg))
   (setq _r_xStd (float __r_xStd))
   (setq _r_yStd (float __r_yStd))
   (setq _processingTime __processingTime)
   self)
  (:leftFeatures
   (&rest __leftFeatures)
   (if (keywordp (car __leftFeatures))
       (send* _leftFeatures __leftFeatures)
     (progn
       (if __leftFeatures (setq _leftFeatures (car __leftFeatures)))
       _leftFeatures)))
  (:detID
   (&optional __detID)
   (if __detID (setq _detID __detID)) _detID)
  (:nLeft
   (&optional __nLeft)
   (if __nLeft (setq _nLeft __nLeft)) _nLeft)
  (:l_xAvg
   (&optional __l_xAvg)
   (if __l_xAvg (setq _l_xAvg __l_xAvg)) _l_xAvg)
  (:l_yAvg
   (&optional __l_yAvg)
   (if __l_yAvg (setq _l_yAvg __l_yAvg)) _l_yAvg)
  (:l_xStd
   (&optional __l_xStd)
   (if __l_xStd (setq _l_xStd __l_xStd)) _l_xStd)
  (:l_yStd
   (&optional __l_yStd)
   (if __l_yStd (setq _l_yStd __l_yStd)) _l_yStd)
  (:rightFeatures
   (&rest __rightFeatures)
   (if (keywordp (car __rightFeatures))
       (send* _rightFeatures __rightFeatures)
     (progn
       (if __rightFeatures (setq _rightFeatures (car __rightFeatures)))
       _rightFeatures)))
  (:nRight
   (&optional __nRight)
   (if __nRight (setq _nRight __nRight)) _nRight)
  (:r_xAvg
   (&optional __r_xAvg)
   (if __r_xAvg (setq _r_xAvg __r_xAvg)) _r_xAvg)
  (:r_yAvg
   (&optional __r_yAvg)
   (if __r_yAvg (setq _r_yAvg __r_yAvg)) _r_yAvg)
  (:r_xStd
   (&optional __r_xStd)
   (if __r_xStd (setq _r_xStd __r_xStd)) _r_xStd)
  (:r_yStd
   (&optional __r_yStd)
   (if __r_yStd (setq _r_yStd __r_yStd)) _r_yStd)
  (:processingTime
   (&rest __processingTime)
   (if (keywordp (car __processingTime))
       (send* _processingTime __processingTime)
     (progn
       (if __processingTime (setq _processingTime (car __processingTime)))
       _processingTime)))
  (:serialization-length
   ()
   (+
    ;; front_end/kPoint[] _leftFeatures
    (apply #'+ (send-all _leftFeatures :serialization-length)) 4
    ;; string _detID
    4 (length _detID)
    ;; uint16 _nLeft
    2
    ;; float32 _l_xAvg
    4
    ;; float32 _l_yAvg
    4
    ;; float32 _l_xStd
    4
    ;; float32 _l_yStd
    4
    ;; front_end/kPoint[] _rightFeatures
    (apply #'+ (send-all _rightFeatures :serialization-length)) 4
    ;; uint16 _nRight
    2
    ;; float32 _r_xAvg
    4
    ;; float32 _r_yAvg
    4
    ;; float32 _r_xStd
    4
    ;; float32 _r_yStd
    4
    ;; front_end/ProcTime[] _processingTime
    (apply #'+ (send-all _processingTime :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/kPoint[] _leftFeatures
     (write-long (length _leftFeatures) s)
     (dolist (elem _leftFeatures)
       (send elem :serialize s)
       )
     ;; string _detID
       (write-long (length _detID) s) (princ _detID s)
     ;; uint16 _nLeft
       (write-word _nLeft s)
     ;; float32 _l_xAvg
       (sys::poke _l_xAvg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _l_yAvg
       (sys::poke _l_yAvg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _l_xStd
       (sys::poke _l_xStd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _l_yStd
       (sys::poke _l_yStd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; front_end/kPoint[] _rightFeatures
     (write-long (length _rightFeatures) s)
     (dolist (elem _rightFeatures)
       (send elem :serialize s)
       )
     ;; uint16 _nRight
       (write-word _nRight s)
     ;; float32 _r_xAvg
       (sys::poke _r_xAvg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _r_yAvg
       (sys::poke _r_yAvg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _r_xStd
       (sys::poke _r_xStd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _r_yStd
       (sys::poke _r_yStd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; front_end/ProcTime[] _processingTime
     (write-long (length _processingTime) s)
     (dolist (elem _processingTime)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/kPoint[] _leftFeatures
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _leftFeatures (let (r) (dotimes (i n) (push (instance front_end::kPoint :init) r)) r))
     (dolist (elem- _leftFeatures)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string _detID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _detID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _nLeft
     (setq _nLeft (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _l_xAvg
     (setq _l_xAvg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _l_yAvg
     (setq _l_yAvg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _l_xStd
     (setq _l_xStd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _l_yStd
     (setq _l_yStd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; front_end/kPoint[] _rightFeatures
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rightFeatures (let (r) (dotimes (i n) (push (instance front_end::kPoint :init) r)) r))
     (dolist (elem- _rightFeatures)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint16 _nRight
     (setq _nRight (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _r_xAvg
     (setq _r_xAvg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _r_yAvg
     (setq _r_yAvg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _r_xStd
     (setq _r_xStd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _r_yStd
     (setq _r_yStd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; front_end/ProcTime[] _processingTime
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _processingTime (let (r) (dotimes (i n) (push (instance front_end::ProcTime :init) r)) r))
     (dolist (elem- _processingTime)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get front_end::frameDetection :md5sum-) "c89ff5835b42d14d6becea0d41610e82")
(setf (get front_end::frameDetection :datatype-) "front_end/frameDetection")
(setf (get front_end::frameDetection :definition-)
      "front_end/kPoint[] leftFeatures
string detID
uint16 nLeft
float32 l_xAvg
float32 l_yAvg
float32 l_xStd
float32 l_yStd
front_end/kPoint[] rightFeatures
uint16 nRight
float32 r_xAvg
float32 r_yAvg
float32 r_xStd
float32 r_yStd
front_end/ProcTime[] processingTime 

================================================================================
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds

")



(provide :front_end/frameDetection "c89ff5835b42d14d6becea0d41610e82")


