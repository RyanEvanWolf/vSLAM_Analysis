;; Auto-generated. Do not edit!


(when (boundp 'front_end::Homography)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'Homography (find-package "FRONT_END")))
(unless (find-package "FRONT_END::HOMOGRAPHY")
  (make-package "FRONT_END::HOMOGRAPHY"))

(in-package "ROS")
;;//! \htmlinclude Homography.msg.html


(defclass front_end::Homography
  :super ros::object
  :slots (_data ))

(defmethod front_end::Homography
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get front_end::Homography :md5sum-) "788898178a3da2c3718461eecda8f714")
(setf (get front_end::Homography :datatype-) "front_end/Homography")
(setf (get front_end::Homography :definition-)
      "float64[] data 

")



(provide :front_end/Homography "788898178a3da2c3718461eecda8f714")


