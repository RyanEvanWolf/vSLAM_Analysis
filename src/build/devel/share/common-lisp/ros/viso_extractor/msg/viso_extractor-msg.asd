
(cl:in-package :asdf)

(defsystem "viso_extractor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "VisoFrame" :depends-on ("_package_VisoFrame"))
    (:file "_package_VisoFrame" :depends-on ("_package"))
    (:file "pMatch" :depends-on ("_package_pMatch"))
    (:file "_package_pMatch" :depends-on ("_package"))
  ))