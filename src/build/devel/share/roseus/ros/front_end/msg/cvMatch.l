;; Auto-generated. Do not edit!


(when (boundp 'front_end::cvMatch)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'cvMatch (find-package "FRONT_END")))
(unless (find-package "FRONT_END::CVMATCH")
  (make-package "FRONT_END::CVMATCH"))

(in-package "ROS")
;;//! \htmlinclude cvMatch.msg.html


(defclass front_end::cvMatch
  :super ros::object
  :slots (_queryIdx _trainIdx _imgIdx _distance ))

(defmethod front_end::cvMatch
  (:init
   (&key
    ((:queryIdx __queryIdx) 0)
    ((:trainIdx __trainIdx) 0)
    ((:imgIdx __imgIdx) 0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _queryIdx (round __queryIdx))
   (setq _trainIdx (round __trainIdx))
   (setq _imgIdx (round __imgIdx))
   (setq _distance (float __distance))
   self)
  (:queryIdx
   (&optional __queryIdx)
   (if __queryIdx (setq _queryIdx __queryIdx)) _queryIdx)
  (:trainIdx
   (&optional __trainIdx)
   (if __trainIdx (setq _trainIdx __trainIdx)) _trainIdx)
  (:imgIdx
   (&optional __imgIdx)
   (if __imgIdx (setq _imgIdx __imgIdx)) _imgIdx)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; uint32 _queryIdx
    4
    ;; uint32 _trainIdx
    4
    ;; uint32 _imgIdx
    4
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _queryIdx
       (write-long _queryIdx s)
     ;; uint32 _trainIdx
       (write-long _trainIdx s)
     ;; uint32 _imgIdx
       (write-long _imgIdx s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _queryIdx
     (setq _queryIdx (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _trainIdx
     (setq _trainIdx (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _imgIdx
     (setq _imgIdx (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get front_end::cvMatch :md5sum-) "1c8d600ac557f1a63783116fb9567511")
(setf (get front_end::cvMatch :datatype-) "front_end/cvMatch")
(setf (get front_end::cvMatch :definition-)
      "uint32 queryIdx
uint32 trainIdx
uint32 imgIdx
float32 distance

")



(provide :front_end/cvMatch "1c8d600ac557f1a63783116fb9567511")


