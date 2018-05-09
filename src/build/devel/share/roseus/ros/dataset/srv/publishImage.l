;; Auto-generated. Do not edit!


(when (boundp 'dataset::publishImage)
  (if (not (find-package "DATASET"))
    (make-package "DATASET"))
  (shadow 'publishImage (find-package "DATASET")))
(unless (find-package "DATASET::PUBLISHIMAGE")
  (make-package "DATASET::PUBLISHIMAGE"))
(unless (find-package "DATASET::PUBLISHIMAGEREQUEST")
  (make-package "DATASET::PUBLISHIMAGEREQUEST"))
(unless (find-package "DATASET::PUBLISHIMAGERESPONSE")
  (make-package "DATASET::PUBLISHIMAGERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dataset::publishImageRequest
  :super ros::object
  :slots (_command ))

(defmethod dataset::publishImageRequest
  (:init
   (&key
    ((:command __command) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _command __command)
   self)
  (:command
   (&rest __command)
   (if (keywordp (car __command))
       (send* _command __command)
     (progn
       (if __command (setq _command (car __command)))
       _command)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _command
    (send _command :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _command
       (send _command :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _command
     (send _command :deserialize buf ptr-) (incf ptr- (send _command :serialization-length))
   ;;
   self)
  )

(defclass dataset::publishImageResponse
  :super ros::object
  :slots (_currentIndex _status _success ))

(defmethod dataset::publishImageResponse
  (:init
   (&key
    ((:currentIndex __currentIndex) (instance std_msgs::Int32 :init))
    ((:status __status) (instance std_msgs::String :init))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _currentIndex __currentIndex)
   (setq _status __status)
   (setq _success __success)
   self)
  (:currentIndex
   (&rest __currentIndex)
   (if (keywordp (car __currentIndex))
       (send* _currentIndex __currentIndex)
     (progn
       (if __currentIndex (setq _currentIndex (car __currentIndex)))
       _currentIndex)))
  (:status
   (&rest __status)
   (if (keywordp (car __status))
       (send* _status __status)
     (progn
       (if __status (setq _status (car __status)))
       _status)))
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int32 _currentIndex
    (send _currentIndex :serialization-length)
    ;; std_msgs/String _status
    (send _status :serialization-length)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32 _currentIndex
       (send _currentIndex :serialize s)
     ;; std_msgs/String _status
       (send _status :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32 _currentIndex
     (send _currentIndex :deserialize buf ptr-) (incf ptr- (send _currentIndex :serialization-length))
   ;; std_msgs/String _status
     (send _status :deserialize buf ptr-) (incf ptr- (send _status :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass dataset::publishImage
  :super ros::object
  :slots ())

(setf (get dataset::publishImage :md5sum-) "cdf090c379ad13ac3ab0237145174f96")
(setf (get dataset::publishImage :datatype-) "dataset/publishImage")
(setf (get dataset::publishImage :request) dataset::publishImageRequest)
(setf (get dataset::publishImage :response) dataset::publishImageResponse)

(defmethod dataset::publishImageRequest
  (:response () (instance dataset::publishImageResponse :init)))

(setf (get dataset::publishImageRequest :md5sum-) "cdf090c379ad13ac3ab0237145174f96")
(setf (get dataset::publishImageRequest :datatype-) "dataset/publishImageRequest")
(setf (get dataset::publishImageRequest :definition-)
      "std_msgs/String command

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/Int32 currentIndex
std_msgs/String status
bool success

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/String
string data
")

(setf (get dataset::publishImageResponse :md5sum-) "cdf090c379ad13ac3ab0237145174f96")
(setf (get dataset::publishImageResponse :datatype-) "dataset/publishImageResponse")
(setf (get dataset::publishImageResponse :definition-)
      "std_msgs/String command

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/Int32 currentIndex
std_msgs/String status
bool success

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/String
string data
")



(provide :dataset/publishImage "cdf090c379ad13ac3ab0237145174f96")


