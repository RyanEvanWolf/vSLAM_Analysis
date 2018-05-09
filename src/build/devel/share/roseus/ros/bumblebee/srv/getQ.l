;; Auto-generated. Do not edit!


(when (boundp 'bumblebee::getQ)
  (if (not (find-package "BUMBLEBEE"))
    (make-package "BUMBLEBEE"))
  (shadow 'getQ (find-package "BUMBLEBEE")))
(unless (find-package "BUMBLEBEE::GETQ")
  (make-package "BUMBLEBEE::GETQ"))
(unless (find-package "BUMBLEBEE::GETQREQUEST")
  (make-package "BUMBLEBEE::GETQREQUEST"))
(unless (find-package "BUMBLEBEE::GETQRESPONSE")
  (make-package "BUMBLEBEE::GETQRESPONSE"))

(in-package "ROS")





(defclass bumblebee::getQRequest
  :super ros::object
  :slots ())

(defmethod bumblebee::getQRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass bumblebee::getQResponse
  :super ros::object
  :slots (_Q ))

(defmethod bumblebee::getQResponse
  (:init
   (&key
    ((:Q __Q) (make-array 16 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _Q __Q)
   self)
  (:Q
   (&optional __Q)
   (if __Q (setq _Q __Q)) _Q)
  (:serialization-length
   ()
   (+
    ;; float64[16] _Q
    (* 8    16)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[16] _Q
     (dotimes (i 16)
       (sys::poke (elt _Q i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[16] _Q
   (dotimes (i (length _Q))
     (setf (elt _Q i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass bumblebee::getQ
  :super ros::object
  :slots ())

(setf (get bumblebee::getQ :md5sum-) "ac38f58782c00220a4ce872420ec2e93")
(setf (get bumblebee::getQ :datatype-) "bumblebee/getQ")
(setf (get bumblebee::getQ :request) bumblebee::getQRequest)
(setf (get bumblebee::getQ :response) bumblebee::getQResponse)

(defmethod bumblebee::getQRequest
  (:response () (instance bumblebee::getQResponse :init)))

(setf (get bumblebee::getQRequest :md5sum-) "ac38f58782c00220a4ce872420ec2e93")
(setf (get bumblebee::getQRequest :datatype-) "bumblebee/getQRequest")
(setf (get bumblebee::getQRequest :definition-)
      "---
float64[16] Q

")

(setf (get bumblebee::getQResponse :md5sum-) "ac38f58782c00220a4ce872420ec2e93")
(setf (get bumblebee::getQResponse :datatype-) "bumblebee/getQResponse")
(setf (get bumblebee::getQResponse :definition-)
      "---
float64[16] Q

")



(provide :bumblebee/getQ "ac38f58782c00220a4ce872420ec2e93")


