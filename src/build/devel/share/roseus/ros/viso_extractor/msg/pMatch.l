;; Auto-generated. Do not edit!


(when (boundp 'viso_extractor::pMatch)
  (if (not (find-package "VISO_EXTRACTOR"))
    (make-package "VISO_EXTRACTOR"))
  (shadow 'pMatch (find-package "VISO_EXTRACTOR")))
(unless (find-package "VISO_EXTRACTOR::PMATCH")
  (make-package "VISO_EXTRACTOR::PMATCH"))

(in-package "ROS")
;;//! \htmlinclude pMatch.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass viso_extractor::pMatch
  :super ros::object
  :slots (_u1p _v1p _i1p _u2p _v2p _i2p _u1c _v1c _i1c _u2c _v2c _i2c ))

(defmethod viso_extractor::pMatch
  (:init
   (&key
    ((:u1p __u1p) (instance std_msgs::Float32 :init))
    ((:v1p __v1p) (instance std_msgs::Float32 :init))
    ((:i1p __i1p) (instance std_msgs::Int32 :init))
    ((:u2p __u2p) (instance std_msgs::Float32 :init))
    ((:v2p __v2p) (instance std_msgs::Float32 :init))
    ((:i2p __i2p) (instance std_msgs::Int32 :init))
    ((:u1c __u1c) (instance std_msgs::Float32 :init))
    ((:v1c __v1c) (instance std_msgs::Float32 :init))
    ((:i1c __i1c) (instance std_msgs::Int32 :init))
    ((:u2c __u2c) (instance std_msgs::Float32 :init))
    ((:v2c __v2c) (instance std_msgs::Float32 :init))
    ((:i2c __i2c) (instance std_msgs::Int32 :init))
    )
   (send-super :init)
   (setq _u1p __u1p)
   (setq _v1p __v1p)
   (setq _i1p __i1p)
   (setq _u2p __u2p)
   (setq _v2p __v2p)
   (setq _i2p __i2p)
   (setq _u1c __u1c)
   (setq _v1c __v1c)
   (setq _i1c __i1c)
   (setq _u2c __u2c)
   (setq _v2c __v2c)
   (setq _i2c __i2c)
   self)
  (:u1p
   (&rest __u1p)
   (if (keywordp (car __u1p))
       (send* _u1p __u1p)
     (progn
       (if __u1p (setq _u1p (car __u1p)))
       _u1p)))
  (:v1p
   (&rest __v1p)
   (if (keywordp (car __v1p))
       (send* _v1p __v1p)
     (progn
       (if __v1p (setq _v1p (car __v1p)))
       _v1p)))
  (:i1p
   (&rest __i1p)
   (if (keywordp (car __i1p))
       (send* _i1p __i1p)
     (progn
       (if __i1p (setq _i1p (car __i1p)))
       _i1p)))
  (:u2p
   (&rest __u2p)
   (if (keywordp (car __u2p))
       (send* _u2p __u2p)
     (progn
       (if __u2p (setq _u2p (car __u2p)))
       _u2p)))
  (:v2p
   (&rest __v2p)
   (if (keywordp (car __v2p))
       (send* _v2p __v2p)
     (progn
       (if __v2p (setq _v2p (car __v2p)))
       _v2p)))
  (:i2p
   (&rest __i2p)
   (if (keywordp (car __i2p))
       (send* _i2p __i2p)
     (progn
       (if __i2p (setq _i2p (car __i2p)))
       _i2p)))
  (:u1c
   (&rest __u1c)
   (if (keywordp (car __u1c))
       (send* _u1c __u1c)
     (progn
       (if __u1c (setq _u1c (car __u1c)))
       _u1c)))
  (:v1c
   (&rest __v1c)
   (if (keywordp (car __v1c))
       (send* _v1c __v1c)
     (progn
       (if __v1c (setq _v1c (car __v1c)))
       _v1c)))
  (:i1c
   (&rest __i1c)
   (if (keywordp (car __i1c))
       (send* _i1c __i1c)
     (progn
       (if __i1c (setq _i1c (car __i1c)))
       _i1c)))
  (:u2c
   (&rest __u2c)
   (if (keywordp (car __u2c))
       (send* _u2c __u2c)
     (progn
       (if __u2c (setq _u2c (car __u2c)))
       _u2c)))
  (:v2c
   (&rest __v2c)
   (if (keywordp (car __v2c))
       (send* _v2c __v2c)
     (progn
       (if __v2c (setq _v2c (car __v2c)))
       _v2c)))
  (:i2c
   (&rest __i2c)
   (if (keywordp (car __i2c))
       (send* _i2c __i2c)
     (progn
       (if __i2c (setq _i2c (car __i2c)))
       _i2c)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float32 _u1p
    (send _u1p :serialization-length)
    ;; std_msgs/Float32 _v1p
    (send _v1p :serialization-length)
    ;; std_msgs/Int32 _i1p
    (send _i1p :serialization-length)
    ;; std_msgs/Float32 _u2p
    (send _u2p :serialization-length)
    ;; std_msgs/Float32 _v2p
    (send _v2p :serialization-length)
    ;; std_msgs/Int32 _i2p
    (send _i2p :serialization-length)
    ;; std_msgs/Float32 _u1c
    (send _u1c :serialization-length)
    ;; std_msgs/Float32 _v1c
    (send _v1c :serialization-length)
    ;; std_msgs/Int32 _i1c
    (send _i1c :serialization-length)
    ;; std_msgs/Float32 _u2c
    (send _u2c :serialization-length)
    ;; std_msgs/Float32 _v2c
    (send _v2c :serialization-length)
    ;; std_msgs/Int32 _i2c
    (send _i2c :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float32 _u1p
       (send _u1p :serialize s)
     ;; std_msgs/Float32 _v1p
       (send _v1p :serialize s)
     ;; std_msgs/Int32 _i1p
       (send _i1p :serialize s)
     ;; std_msgs/Float32 _u2p
       (send _u2p :serialize s)
     ;; std_msgs/Float32 _v2p
       (send _v2p :serialize s)
     ;; std_msgs/Int32 _i2p
       (send _i2p :serialize s)
     ;; std_msgs/Float32 _u1c
       (send _u1c :serialize s)
     ;; std_msgs/Float32 _v1c
       (send _v1c :serialize s)
     ;; std_msgs/Int32 _i1c
       (send _i1c :serialize s)
     ;; std_msgs/Float32 _u2c
       (send _u2c :serialize s)
     ;; std_msgs/Float32 _v2c
       (send _v2c :serialize s)
     ;; std_msgs/Int32 _i2c
       (send _i2c :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float32 _u1p
     (send _u1p :deserialize buf ptr-) (incf ptr- (send _u1p :serialization-length))
   ;; std_msgs/Float32 _v1p
     (send _v1p :deserialize buf ptr-) (incf ptr- (send _v1p :serialization-length))
   ;; std_msgs/Int32 _i1p
     (send _i1p :deserialize buf ptr-) (incf ptr- (send _i1p :serialization-length))
   ;; std_msgs/Float32 _u2p
     (send _u2p :deserialize buf ptr-) (incf ptr- (send _u2p :serialization-length))
   ;; std_msgs/Float32 _v2p
     (send _v2p :deserialize buf ptr-) (incf ptr- (send _v2p :serialization-length))
   ;; std_msgs/Int32 _i2p
     (send _i2p :deserialize buf ptr-) (incf ptr- (send _i2p :serialization-length))
   ;; std_msgs/Float32 _u1c
     (send _u1c :deserialize buf ptr-) (incf ptr- (send _u1c :serialization-length))
   ;; std_msgs/Float32 _v1c
     (send _v1c :deserialize buf ptr-) (incf ptr- (send _v1c :serialization-length))
   ;; std_msgs/Int32 _i1c
     (send _i1c :deserialize buf ptr-) (incf ptr- (send _i1c :serialization-length))
   ;; std_msgs/Float32 _u2c
     (send _u2c :deserialize buf ptr-) (incf ptr- (send _u2c :serialization-length))
   ;; std_msgs/Float32 _v2c
     (send _v2c :deserialize buf ptr-) (incf ptr- (send _v2c :serialization-length))
   ;; std_msgs/Int32 _i2c
     (send _i2c :deserialize buf ptr-) (incf ptr- (send _i2c :serialization-length))
   ;;
   self)
  )

(setf (get viso_extractor::pMatch :md5sum-) "83f4f899dee21ad25ff19f486f6fe1c6")
(setf (get viso_extractor::pMatch :datatype-) "viso_extractor/pMatch")
(setf (get viso_extractor::pMatch :definition-)
      "std_msgs/Float32 u1p
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

================================================================================
MSG: std_msgs/Float32
float32 data
================================================================================
MSG: std_msgs/Int32
int32 data
")



(provide :viso_extractor/pMatch "83f4f899dee21ad25ff19f486f6fe1c6")


