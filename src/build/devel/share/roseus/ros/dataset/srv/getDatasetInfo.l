;; Auto-generated. Do not edit!


(when (boundp 'dataset::getDatasetInfo)
  (if (not (find-package "DATASET"))
    (make-package "DATASET"))
  (shadow 'getDatasetInfo (find-package "DATASET")))
(unless (find-package "DATASET::GETDATASETINFO")
  (make-package "DATASET::GETDATASETINFO"))
(unless (find-package "DATASET::GETDATASETINFOREQUEST")
  (make-package "DATASET::GETDATASETINFOREQUEST"))
(unless (find-package "DATASET::GETDATASETINFORESPONSE")
  (make-package "DATASET::GETDATASETINFORESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dataset::getDatasetInfoRequest
  :super ros::object
  :slots ())

(defmethod dataset::getDatasetInfoRequest
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

(defclass dataset::getDatasetInfoResponse
  :super ros::object
  :slots (_rootFolder _currentIndex _imageName _status ))

(defmethod dataset::getDatasetInfoResponse
  (:init
   (&key
    ((:rootFolder __rootFolder) (instance std_msgs::String :init))
    ((:currentIndex __currentIndex) (instance std_msgs::Int32 :init))
    ((:imageName __imageName) (instance std_msgs::String :init))
    ((:status __status) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _rootFolder __rootFolder)
   (setq _currentIndex __currentIndex)
   (setq _imageName __imageName)
   (setq _status __status)
   self)
  (:rootFolder
   (&rest __rootFolder)
   (if (keywordp (car __rootFolder))
       (send* _rootFolder __rootFolder)
     (progn
       (if __rootFolder (setq _rootFolder (car __rootFolder)))
       _rootFolder)))
  (:currentIndex
   (&rest __currentIndex)
   (if (keywordp (car __currentIndex))
       (send* _currentIndex __currentIndex)
     (progn
       (if __currentIndex (setq _currentIndex (car __currentIndex)))
       _currentIndex)))
  (:imageName
   (&rest __imageName)
   (if (keywordp (car __imageName))
       (send* _imageName __imageName)
     (progn
       (if __imageName (setq _imageName (car __imageName)))
       _imageName)))
  (:status
   (&rest __status)
   (if (keywordp (car __status))
       (send* _status __status)
     (progn
       (if __status (setq _status (car __status)))
       _status)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _rootFolder
    (send _rootFolder :serialization-length)
    ;; std_msgs/Int32 _currentIndex
    (send _currentIndex :serialization-length)
    ;; std_msgs/String _imageName
    (send _imageName :serialization-length)
    ;; std_msgs/String _status
    (send _status :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _rootFolder
       (send _rootFolder :serialize s)
     ;; std_msgs/Int32 _currentIndex
       (send _currentIndex :serialize s)
     ;; std_msgs/String _imageName
       (send _imageName :serialize s)
     ;; std_msgs/String _status
       (send _status :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _rootFolder
     (send _rootFolder :deserialize buf ptr-) (incf ptr- (send _rootFolder :serialization-length))
   ;; std_msgs/Int32 _currentIndex
     (send _currentIndex :deserialize buf ptr-) (incf ptr- (send _currentIndex :serialization-length))
   ;; std_msgs/String _imageName
     (send _imageName :deserialize buf ptr-) (incf ptr- (send _imageName :serialization-length))
   ;; std_msgs/String _status
     (send _status :deserialize buf ptr-) (incf ptr- (send _status :serialization-length))
   ;;
   self)
  )

(defclass dataset::getDatasetInfo
  :super ros::object
  :slots ())

(setf (get dataset::getDatasetInfo :md5sum-) "a7e2ecfb328c516284c8b826e6c2925f")
(setf (get dataset::getDatasetInfo :datatype-) "dataset/getDatasetInfo")
(setf (get dataset::getDatasetInfo :request) dataset::getDatasetInfoRequest)
(setf (get dataset::getDatasetInfo :response) dataset::getDatasetInfoResponse)

(defmethod dataset::getDatasetInfoRequest
  (:response () (instance dataset::getDatasetInfoResponse :init)))

(setf (get dataset::getDatasetInfoRequest :md5sum-) "a7e2ecfb328c516284c8b826e6c2925f")
(setf (get dataset::getDatasetInfoRequest :datatype-) "dataset/getDatasetInfoRequest")
(setf (get dataset::getDatasetInfoRequest :definition-)
      "---
std_msgs/String rootFolder
std_msgs/Int32 currentIndex
std_msgs/String imageName
std_msgs/String status


================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Int32
")

(setf (get dataset::getDatasetInfoResponse :md5sum-) "a7e2ecfb328c516284c8b826e6c2925f")
(setf (get dataset::getDatasetInfoResponse :datatype-) "dataset/getDatasetInfoResponse")
(setf (get dataset::getDatasetInfoResponse :definition-)
      "---
std_msgs/String rootFolder
std_msgs/Int32 currentIndex
std_msgs/String imageName
std_msgs/String status


================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Int32
")



(provide :dataset/getDatasetInfo "a7e2ecfb328c516284c8b826e6c2925f")


