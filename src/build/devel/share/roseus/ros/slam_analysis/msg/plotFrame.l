;; Auto-generated. Do not edit!


(when (boundp 'slam_analysis::plotFrame)
  (if (not (find-package "SLAM_ANALYSIS"))
    (make-package "SLAM_ANALYSIS"))
  (shadow 'plotFrame (find-package "SLAM_ANALYSIS")))
(unless (find-package "SLAM_ANALYSIS::PLOTFRAME")
  (make-package "SLAM_ANALYSIS::PLOTFRAME"))

(in-package "ROS")
;;//! \htmlinclude plotFrame.msg.html
(if (not (find-package "FRONT_END"))
  (ros::roseus-add-msgs "front_end"))


(defclass slam_analysis::plotFrame
  :super ros::object
  :slots (_delta ))

(defmethod slam_analysis::plotFrame
  (:init
   (&key
    ((:delta __delta) (instance front_end::Homography :init))
    )
   (send-super :init)
   (setq _delta __delta)
   self)
  (:delta
   (&rest __delta)
   (if (keywordp (car __delta))
       (send* _delta __delta)
     (progn
       (if __delta (setq _delta (car __delta)))
       _delta)))
  (:serialization-length
   ()
   (+
    ;; front_end/Homography _delta
    (send _delta :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; front_end/Homography _delta
       (send _delta :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; front_end/Homography _delta
     (send _delta :deserialize buf ptr-) (incf ptr- (send _delta :serialization-length))
   ;;
   self)
  )

(setf (get slam_analysis::plotFrame :md5sum-) "92c2da79f439e73ded798f48cae9cb47")
(setf (get slam_analysis::plotFrame :datatype-) "slam_analysis/plotFrame")
(setf (get slam_analysis::plotFrame :definition-)
      "front_end/Homography delta

================================================================================
MSG: front_end/Homography
float64[] data 

")



(provide :slam_analysis/plotFrame "92c2da79f439e73ded798f48cae9cb47")


