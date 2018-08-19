
(cl:in-package :asdf)

(defsystem "front_end-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :front_end-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "getStereoFeatures" :depends-on ("_package_getStereoFeatures"))
    (:file "_package_getStereoFeatures" :depends-on ("_package"))
    (:file "singleImageDetection" :depends-on ("_package_singleImageDetection"))
    (:file "_package_singleImageDetection" :depends-on ("_package"))
    (:file "stereoMatching" :depends-on ("_package_stereoMatching"))
    (:file "_package_stereoMatching" :depends-on ("_package"))
    (:file "windowMatching" :depends-on ("_package_windowMatching"))
    (:file "_package_windowMatching" :depends-on ("_package"))
    (:file "~detectCurrent" :depends-on ("_package_~detectCurrent"))
    (:file "_package_~detectCurrent" :depends-on ("_package"))
    (:file "~setDetector" :depends-on ("_package_~setDetector"))
    (:file "_package_~setDetector" :depends-on ("_package"))
    (:file "~singleImageDescription" :depends-on ("_package_~singleImageDescription"))
    (:file "_package_~singleImageDescription" :depends-on ("_package"))
    (:file "~singleImageExtraction" :depends-on ("_package_~singleImageExtraction"))
    (:file "_package_~singleImageExtraction" :depends-on ("_package"))
    (:file "~singleStereo" :depends-on ("_package_~singleStereo"))
    (:file "_package_~singleStereo" :depends-on ("_package"))
  ))