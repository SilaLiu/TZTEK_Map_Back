
(cl:in-package :asdf)

(defsystem "fixposition_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Speed" :depends-on ("_package_Speed"))
    (:file "_package_Speed" :depends-on ("_package"))
    (:file "VRTK" :depends-on ("_package_VRTK"))
    (:file "_package_VRTK" :depends-on ("_package"))
  ))