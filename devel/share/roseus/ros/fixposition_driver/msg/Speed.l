;; Auto-generated. Do not edit!


(when (boundp 'fixposition_driver::Speed)
  (if (not (find-package "FIXPOSITION_DRIVER"))
    (make-package "FIXPOSITION_DRIVER"))
  (shadow 'Speed (find-package "FIXPOSITION_DRIVER")))
(unless (find-package "FIXPOSITION_DRIVER::SPEED")
  (make-package "FIXPOSITION_DRIVER::SPEED"))

(in-package "ROS")
;;//! \htmlinclude Speed.msg.html


(defclass fixposition_driver::Speed
  :super ros::object
  :slots (_speeds ))

(defmethod fixposition_driver::Speed
  (:init
   (&key
    ((:speeds __speeds) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _speeds __speeds)
   self)
  (:speeds
   (&optional __speeds)
   (if __speeds (setq _speeds __speeds)) _speeds)
  (:serialization-length
   ()
   (+
    ;; int32[] _speeds
    (* 4    (length _speeds)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _speeds
     (write-long (length _speeds) s)
     (dotimes (i (length _speeds))
       (write-long (elt _speeds i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _speeds
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _speeds (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _speeds i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get fixposition_driver::Speed :md5sum-) "00264f61d2b8d6e211424a49de9947b3")
(setf (get fixposition_driver::Speed :datatype-) "fixposition_driver/Speed")
(setf (get fixposition_driver::Speed :definition-)
      "####################################################################################################
#
#    Copyright (c) 2021  ___     ___
#                       \\\\  \\\\  /  /
#                        \\\\  \\\\/  /
#                         /  /\\\\  \\\\
#                        /__/  \\\\__\\\\  Fixposition AG
#
####################################################################################################
#
# Wheel speed input to Fixposition ROS Driver
#
#
####################################################################################################

# Velocity values in [mm/s] as integer 32bit
# 2 Options:
# Option 1: only one vehicle speed, then only fill a single value as the vehicle speed
# Option 2: Fill in 4 Values of 4 wheels, in the order of FR, FL, RR, RL
int32[] speeds

")



(provide :fixposition_driver/Speed "00264f61d2b8d6e211424a49de9947b3")


