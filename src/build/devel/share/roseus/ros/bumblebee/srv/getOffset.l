;; Auto-generated. Do not edit!


(when (boundp 'bumblebee::getOffset)
  (if (not (find-package "BUMBLEBEE"))
    (make-package "BUMBLEBEE"))
  (shadow 'getOffset (find-package "BUMBLEBEE")))
(unless (find-package "BUMBLEBEE::GETOFFSET")
  (make-package "BUMBLEBEE::GETOFFSET"))
(unless (find-package "BUMBLEBEE::GETOFFSETREQUEST")
  (make-package "BUMBLEBEE::GETOFFSETREQUEST"))
(unless (find-package "BUMBLEBEE::GETOFFSETRESPONSE")
  (make-package "BUMBLEBEE::GETOFFSETRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass bumblebee::getOffsetRequest
  :super ros::object
  :slots ())

(defmethod bumblebee::getOffsetRequest
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

(defclass bumblebee::getOffsetResponse
  :super ros::object
  :slots (_left _right ))

(defmethod bumblebee::getOffsetResponse
  (:init
   (&key
    ((:left __left) (instance sensor_msgs::RegionOfInterest :init))
    ((:right __right) (instance sensor_msgs::RegionOfInterest :init))
    )
   (send-super :init)
   (setq _left __left)
   (setq _right __right)
   self)
  (:left
   (&rest __left)
   (if (keywordp (car __left))
       (send* _left __left)
     (progn
       (if __left (setq _left (car __left)))
       _left)))
  (:right
   (&rest __right)
   (if (keywordp (car __right))
       (send* _right __right)
     (progn
       (if __right (setq _right (car __right)))
       _right)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/RegionOfInterest _left
    (send _left :serialization-length)
    ;; sensor_msgs/RegionOfInterest _right
    (send _right :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/RegionOfInterest _left
       (send _left :serialize s)
     ;; sensor_msgs/RegionOfInterest _right
       (send _right :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/RegionOfInterest _left
     (send _left :deserialize buf ptr-) (incf ptr- (send _left :serialization-length))
   ;; sensor_msgs/RegionOfInterest _right
     (send _right :deserialize buf ptr-) (incf ptr- (send _right :serialization-length))
   ;;
   self)
  )

(defclass bumblebee::getOffset
  :super ros::object
  :slots ())

(setf (get bumblebee::getOffset :md5sum-) "e0fde965a1b7161594fc69b01cf6bc87")
(setf (get bumblebee::getOffset :datatype-) "bumblebee/getOffset")
(setf (get bumblebee::getOffset :request) bumblebee::getOffsetRequest)
(setf (get bumblebee::getOffset :response) bumblebee::getOffsetResponse)

(defmethod bumblebee::getOffsetRequest
  (:response () (instance bumblebee::getOffsetResponse :init)))

(setf (get bumblebee::getOffsetRequest :md5sum-) "e0fde965a1b7161594fc69b01cf6bc87")
(setf (get bumblebee::getOffsetRequest :datatype-) "bumblebee/getOffsetRequest")
(setf (get bumblebee::getOffsetRequest :definition-)
      "---
sensor_msgs/RegionOfInterest left
sensor_msgs/RegionOfInterest right


================================================================================
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the \"raw\"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify
")

(setf (get bumblebee::getOffsetResponse :md5sum-) "e0fde965a1b7161594fc69b01cf6bc87")
(setf (get bumblebee::getOffsetResponse :datatype-) "bumblebee/getOffsetResponse")
(setf (get bumblebee::getOffsetResponse :definition-)
      "---
sensor_msgs/RegionOfInterest left
sensor_msgs/RegionOfInterest right


================================================================================
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the \"raw\"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify
")



(provide :bumblebee/getOffset "e0fde965a1b7161594fc69b01cf6bc87")


