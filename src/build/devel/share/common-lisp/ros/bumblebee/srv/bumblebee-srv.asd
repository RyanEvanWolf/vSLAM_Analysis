
(cl:in-package :asdf)

(defsystem "bumblebee-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "getCameraInfo" :depends-on ("_package_getCameraInfo"))
    (:file "_package_getCameraInfo" :depends-on ("_package"))
    (:file "getIdealBaseline" :depends-on ("_package_getIdealBaseline"))
    (:file "_package_getIdealBaseline" :depends-on ("_package"))
    (:file "getOffset" :depends-on ("_package_getOffset"))
    (:file "_package_getOffset" :depends-on ("_package"))
    (:file "getQ" :depends-on ("_package_getQ"))
    (:file "_package_getQ" :depends-on ("_package"))
    (:file "getRectificationMap" :depends-on ("_package_getRectificationMap"))
    (:file "_package_getRectificationMap" :depends-on ("_package"))
  ))