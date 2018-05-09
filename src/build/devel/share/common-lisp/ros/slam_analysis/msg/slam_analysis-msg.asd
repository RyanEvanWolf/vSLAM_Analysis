
(cl:in-package :asdf)

(defsystem "slam_analysis-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :front_end-msg
)
  :components ((:file "_package")
    (:file "plotFrame" :depends-on ("_package_plotFrame"))
    (:file "_package_plotFrame" :depends-on ("_package"))
  ))