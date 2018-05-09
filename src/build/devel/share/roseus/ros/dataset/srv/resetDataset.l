;; Auto-generated. Do not edit!


(when (boundp 'dataset::resetDataset)
  (if (not (find-package "DATASET"))
    (make-package "DATASET"))
  (shadow 'resetDataset (find-package "DATASET")))
(unless (find-package "DATASET::RESETDATASET")
  (make-package "DATASET::RESETDATASET"))
(unless (find-package "DATASET::RESETDATASETREQUEST")
  (make-package "DATASET::RESETDATASETREQUEST"))
(unless (find-package "DATASET::RESETDATASETRESPONSE")
  (make-package "DATASET::RESETDATASETRESPONSE"))

(in-package "ROS")





(defclass dataset::resetDatasetRequest
  :super ros::object
  :slots ())

(defmethod dataset::resetDatasetRequest
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

(defclass dataset::resetDatasetResponse
  :super ros::object
  :slots ())

(defmethod dataset::resetDatasetResponse
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

(defclass dataset::resetDataset
  :super ros::object
  :slots ())

(setf (get dataset::resetDataset :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get dataset::resetDataset :datatype-) "dataset/resetDataset")
(setf (get dataset::resetDataset :request) dataset::resetDatasetRequest)
(setf (get dataset::resetDataset :response) dataset::resetDatasetResponse)

(defmethod dataset::resetDatasetRequest
  (:response () (instance dataset::resetDatasetResponse :init)))

(setf (get dataset::resetDatasetRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get dataset::resetDatasetRequest :datatype-) "dataset/resetDatasetRequest")
(setf (get dataset::resetDatasetRequest :definition-)
      "---


")

(setf (get dataset::resetDatasetResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get dataset::resetDatasetResponse :datatype-) "dataset/resetDatasetResponse")
(setf (get dataset::resetDatasetResponse :definition-)
      "---


")



(provide :dataset/resetDataset "d41d8cd98f00b204e9800998ecf8427e")


