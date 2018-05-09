;; Auto-generated. Do not edit!


(when (boundp 'front_end::ProcTime)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'ProcTime (find-package "FRONT_END")))
(unless (find-package "FRONT_END::PROCTIME")
  (make-package "FRONT_END::PROCTIME"))

(in-package "ROS")
;;//! \htmlinclude ProcTime.msg.html


(defclass front_end::ProcTime
  :super ros::object
  :slots (_label _seconds ))

(defmethod front_end::ProcTime
  (:init
   (&key
    ((:label __label) "")
    ((:seconds __seconds) 0.0)
    )
   (send-super :init)
   (setq _label (string __label))
   (setq _seconds (float __seconds))
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:seconds
   (&optional __seconds)
   (if __seconds (setq _seconds __seconds)) _seconds)
  (:serialization-length
   ()
   (+
    ;; string _label
    4 (length _label)
    ;; float64 _seconds
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;; float64 _seconds
       (sys::poke _seconds (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _seconds
     (setq _seconds (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get front_end::ProcTime :md5sum-) "adeb5bed2cff8503e6a304382d1eecbf")
(setf (get front_end::ProcTime :datatype-) "front_end/ProcTime")
(setf (get front_end::ProcTime :definition-)
      "string label
float64 seconds

")



(provide :front_end/ProcTime "adeb5bed2cff8503e6a304382d1eecbf")


