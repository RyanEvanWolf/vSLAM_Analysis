;; Auto-generated. Do not edit!


(when (boundp 'viso_extractor::VisoFrame)
  (if (not (find-package "VISO_EXTRACTOR"))
    (make-package "VISO_EXTRACTOR"))
  (shadow 'VisoFrame (find-package "VISO_EXTRACTOR")))
(unless (find-package "VISO_EXTRACTOR::VISOFRAME")
  (make-package "VISO_EXTRACTOR::VISOFRAME"))

(in-package "ROS")
;;//! \htmlinclude VisoFrame.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass viso_extractor::VisoFrame
  :super ros::object
  :slots (_nMatches _nInliers _time _homography _matches _success ))

(defmethod viso_extractor::VisoFrame
  (:init
   (&key
    ((:nMatches __nMatches) (instance std_msgs::Float32 :init))
    ((:nInliers __nInliers) (instance std_msgs::Float32 :init))
    ((:time __time) (instance std_msgs::Int32 :init))
    ((:homography __homography) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:matches __matches) (let (r) (dotimes (i 0) (push (instance viso_extractor::pMatch :init) r)) r))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _nMatches __nMatches)
   (setq _nInliers __nInliers)
   (setq _time __time)
   (setq _homography __homography)
   (setq _matches __matches)
   (setq _success __success)
   self)
  (:nMatches
   (&rest __nMatches)
   (if (keywordp (car __nMatches))
       (send* _nMatches __nMatches)
     (progn
       (if __nMatches (setq _nMatches (car __nMatches)))
       _nMatches)))
  (:nInliers
   (&rest __nInliers)
   (if (keywordp (car __nInliers))
       (send* _nInliers __nInliers)
     (progn
       (if __nInliers (setq _nInliers (car __nInliers)))
       _nInliers)))
  (:time
   (&rest __time)
   (if (keywordp (car __time))
       (send* _time __time)
     (progn
       (if __time (setq _time (car __time)))
       _time)))
  (:homography
   (&optional __homography)
   (if __homography (setq _homography __homography)) _homography)
  (:matches
   (&rest __matches)
   (if (keywordp (car __matches))
       (send* _matches __matches)
     (progn
       (if __matches (setq _matches (car __matches)))
       _matches)))
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float32 _nMatches
    (send _nMatches :serialization-length)
    ;; std_msgs/Float32 _nInliers
    (send _nInliers :serialization-length)
    ;; std_msgs/Int32 _time
    (send _time :serialization-length)
    ;; float64[] _homography
    (* 8    (length _homography)) 4
    ;; viso_extractor/pMatch[] _matches
    (apply #'+ (send-all _matches :serialization-length)) 4
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float32 _nMatches
       (send _nMatches :serialize s)
     ;; std_msgs/Float32 _nInliers
       (send _nInliers :serialize s)
     ;; std_msgs/Int32 _time
       (send _time :serialize s)
     ;; float64[] _homography
     (write-long (length _homography) s)
     (dotimes (i (length _homography))
       (sys::poke (elt _homography i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; viso_extractor/pMatch[] _matches
     (write-long (length _matches) s)
     (dolist (elem _matches)
       (send elem :serialize s)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float32 _nMatches
     (send _nMatches :deserialize buf ptr-) (incf ptr- (send _nMatches :serialization-length))
   ;; std_msgs/Float32 _nInliers
     (send _nInliers :deserialize buf ptr-) (incf ptr- (send _nInliers :serialization-length))
   ;; std_msgs/Int32 _time
     (send _time :deserialize buf ptr-) (incf ptr- (send _time :serialization-length))
   ;; float64[] _homography
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _homography (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _homography i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; viso_extractor/pMatch[] _matches
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _matches (let (r) (dotimes (i n) (push (instance viso_extractor::pMatch :init) r)) r))
     (dolist (elem- _matches)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get viso_extractor::VisoFrame :md5sum-) "9fdd3a9666d1c582d73af55ae13305e2")
(setf (get viso_extractor::VisoFrame :datatype-) "viso_extractor/VisoFrame")
(setf (get viso_extractor::VisoFrame :definition-)
      " std_msgs/Float32 nMatches
 std_msgs/Float32 nInliers
 std_msgs/Int32 time
 float64[] homography
 viso_extractor/pMatch[] matches
 bool success
================================================================================
MSG: std_msgs/Float32
float32 data
================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: viso_extractor/pMatch
std_msgs/Float32 u1p
std_msgs/Float32 v1p
std_msgs/Int32 i1p
std_msgs/Float32 u2p
std_msgs/Float32 v2p
std_msgs/Int32 i2p
std_msgs/Float32 u1c
std_msgs/Float32 v1c
std_msgs/Int32 i1c
std_msgs/Float32 u2c
std_msgs/Float32 v2c
std_msgs/Int32 i2c

")



(provide :viso_extractor/VisoFrame "9fdd3a9666d1c582d73af55ae13305e2")


