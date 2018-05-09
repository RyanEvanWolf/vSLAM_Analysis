;; Auto-generated. Do not edit!


(when (boundp 'slam_analysis::updatePoseVisual)
  (if (not (find-package "SLAM_ANALYSIS"))
    (make-package "SLAM_ANALYSIS"))
  (shadow 'updatePoseVisual (find-package "SLAM_ANALYSIS")))
(unless (find-package "SLAM_ANALYSIS::UPDATEPOSEVISUAL")
  (make-package "SLAM_ANALYSIS::UPDATEPOSEVISUAL"))
(unless (find-package "SLAM_ANALYSIS::UPDATEPOSEVISUALREQUEST")
  (make-package "SLAM_ANALYSIS::UPDATEPOSEVISUALREQUEST"))
(unless (find-package "SLAM_ANALYSIS::UPDATEPOSEVISUALRESPONSE")
  (make-package "SLAM_ANALYSIS::UPDATEPOSEVISUALRESPONSE"))

(in-package "ROS")





(defclass slam_analysis::updatePoseVisualRequest
  :super ros::object
  :slots (_latest ))

(defmethod slam_analysis::updatePoseVisualRequest
  (:init
   (&key
    ((:latest __latest) (instance slam_analysis::plotFrame :init))
    )
   (send-super :init)
   (setq _latest __latest)
   self)
  (:latest
   (&rest __latest)
   (if (keywordp (car __latest))
       (send* _latest __latest)
     (progn
       (if __latest (setq _latest (car __latest)))
       _latest)))
  (:serialization-length
   ()
   (+
    ;; slam_analysis/plotFrame _latest
    (send _latest :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; slam_analysis/plotFrame _latest
       (send _latest :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; slam_analysis/plotFrame _latest
     (send _latest :deserialize buf ptr-) (incf ptr- (send _latest :serialization-length))
   ;;
   self)
  )

(defclass slam_analysis::updatePoseVisualResponse
  :super ros::object
  :slots ())

(defmethod slam_analysis::updatePoseVisualResponse
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

(defclass slam_analysis::updatePoseVisual
  :super ros::object
  :slots ())

(setf (get slam_analysis::updatePoseVisual :md5sum-) "c46665824f7184fd974e046eada6d32e")
(setf (get slam_analysis::updatePoseVisual :datatype-) "slam_analysis/updatePoseVisual")
(setf (get slam_analysis::updatePoseVisual :request) slam_analysis::updatePoseVisualRequest)
(setf (get slam_analysis::updatePoseVisual :response) slam_analysis::updatePoseVisualResponse)

(defmethod slam_analysis::updatePoseVisualRequest
  (:response () (instance slam_analysis::updatePoseVisualResponse :init)))

(setf (get slam_analysis::updatePoseVisualRequest :md5sum-) "c46665824f7184fd974e046eada6d32e")
(setf (get slam_analysis::updatePoseVisualRequest :datatype-) "slam_analysis/updatePoseVisualRequest")
(setf (get slam_analysis::updatePoseVisualRequest :definition-)
      "slam_analysis/plotFrame latest

================================================================================
MSG: slam_analysis/plotFrame
front_end/Homography delta

================================================================================
MSG: front_end/Homography
float64[] data 
---

")

(setf (get slam_analysis::updatePoseVisualResponse :md5sum-) "c46665824f7184fd974e046eada6d32e")
(setf (get slam_analysis::updatePoseVisualResponse :datatype-) "slam_analysis/updatePoseVisualResponse")
(setf (get slam_analysis::updatePoseVisualResponse :definition-)
      "slam_analysis/plotFrame latest

================================================================================
MSG: slam_analysis/plotFrame
front_end/Homography delta

================================================================================
MSG: front_end/Homography
float64[] data 
---

")



(provide :slam_analysis/updatePoseVisual "c46665824f7184fd974e046eada6d32e")


