;; Auto-generated. Do not edit!


(when (boundp 'slam_analysis::resetVisual)
  (if (not (find-package "SLAM_ANALYSIS"))
    (make-package "SLAM_ANALYSIS"))
  (shadow 'resetVisual (find-package "SLAM_ANALYSIS")))
(unless (find-package "SLAM_ANALYSIS::RESETVISUAL")
  (make-package "SLAM_ANALYSIS::RESETVISUAL"))
(unless (find-package "SLAM_ANALYSIS::RESETVISUALREQUEST")
  (make-package "SLAM_ANALYSIS::RESETVISUALREQUEST"))
(unless (find-package "SLAM_ANALYSIS::RESETVISUALRESPONSE")
  (make-package "SLAM_ANALYSIS::RESETVISUALRESPONSE"))

(in-package "ROS")





(defclass slam_analysis::resetVisualRequest
  :super ros::object
  :slots ())

(defmethod slam_analysis::resetVisualRequest
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

(defclass slam_analysis::resetVisualResponse
  :super ros::object
  :slots ())

(defmethod slam_analysis::resetVisualResponse
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

(defclass slam_analysis::resetVisual
  :super ros::object
  :slots ())

(setf (get slam_analysis::resetVisual :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get slam_analysis::resetVisual :datatype-) "slam_analysis/resetVisual")
(setf (get slam_analysis::resetVisual :request) slam_analysis::resetVisualRequest)
(setf (get slam_analysis::resetVisual :response) slam_analysis::resetVisualResponse)

(defmethod slam_analysis::resetVisualRequest
  (:response () (instance slam_analysis::resetVisualResponse :init)))

(setf (get slam_analysis::resetVisualRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get slam_analysis::resetVisualRequest :datatype-) "slam_analysis/resetVisualRequest")
(setf (get slam_analysis::resetVisualRequest :definition-)
      "---

")

(setf (get slam_analysis::resetVisualResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get slam_analysis::resetVisualResponse :datatype-) "slam_analysis/resetVisualResponse")
(setf (get slam_analysis::resetVisualResponse :definition-)
      "---

")



(provide :slam_analysis/resetVisual "d41d8cd98f00b204e9800998ecf8427e")


