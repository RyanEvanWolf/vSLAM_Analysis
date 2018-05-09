;; Auto-generated. Do not edit!


(when (boundp 'front_end::frameDescription)
  (if (not (find-package "FRONT_END"))
    (make-package "FRONT_END"))
  (shadow 'frameDescription (find-package "FRONT_END")))
(unless (find-package "FRONT_END::FRAMEDESCRIPTION")
  (make-package "FRONT_END::FRAMEDESCRIPTION"))

(in-package "ROS")
;;//! \htmlinclude frameDescription.msg.html


(defclass front_end::frameDescription
  :super ros::object
  :slots ())

(defmethod front_end::frameDescription
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

(setf (get front_end::frameDescription :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get front_end::frameDescription :datatype-) "front_end/frameDescription")
(setf (get front_end::frameDescription :definition-)
      " 

")



(provide :front_end/frameDescription "d41d8cd98f00b204e9800998ecf8427e")


