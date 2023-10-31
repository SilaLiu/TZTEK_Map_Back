; Auto-generated. Do not edit!


(cl:in-package fixposition_driver-msg)


;//! \htmlinclude VRTK.msg.html

(cl:defclass <VRTK> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose_frame
    :reader pose_frame
    :initarg :pose_frame
    :type cl:string
    :initform "")
   (kin_frame
    :reader kin_frame
    :initarg :kin_frame
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseWithCovariance
    :initform (cl:make-instance 'geometry_msgs-msg:PoseWithCovariance))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:TwistWithCovariance
    :initform (cl:make-instance 'geometry_msgs-msg:TwistWithCovariance))
   (acceleration
    :reader acceleration
    :initarg :acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (fusion_status
    :reader fusion_status
    :initarg :fusion_status
    :type cl:fixnum
    :initform 0)
   (imu_bias_status
    :reader imu_bias_status
    :initarg :imu_bias_status
    :type cl:fixnum
    :initform 0)
   (gnss_status
    :reader gnss_status
    :initarg :gnss_status
    :type cl:fixnum
    :initform 0)
   (wheelspeed_status
    :reader wheelspeed_status
    :initarg :wheelspeed_status
    :type cl:fixnum
    :initform 0)
   (version
    :reader version
    :initarg :version
    :type cl:string
    :initform ""))
)

(cl:defclass VRTK (<VRTK>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VRTK>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VRTK)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fixposition_driver-msg:<VRTK> is deprecated: use fixposition_driver-msg:VRTK instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:header-val is deprecated.  Use fixposition_driver-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose_frame-val :lambda-list '(m))
(cl:defmethod pose_frame-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:pose_frame-val is deprecated.  Use fixposition_driver-msg:pose_frame instead.")
  (pose_frame m))

(cl:ensure-generic-function 'kin_frame-val :lambda-list '(m))
(cl:defmethod kin_frame-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:kin_frame-val is deprecated.  Use fixposition_driver-msg:kin_frame instead.")
  (kin_frame m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:pose-val is deprecated.  Use fixposition_driver-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:velocity-val is deprecated.  Use fixposition_driver-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'acceleration-val :lambda-list '(m))
(cl:defmethod acceleration-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:acceleration-val is deprecated.  Use fixposition_driver-msg:acceleration instead.")
  (acceleration m))

(cl:ensure-generic-function 'fusion_status-val :lambda-list '(m))
(cl:defmethod fusion_status-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:fusion_status-val is deprecated.  Use fixposition_driver-msg:fusion_status instead.")
  (fusion_status m))

(cl:ensure-generic-function 'imu_bias_status-val :lambda-list '(m))
(cl:defmethod imu_bias_status-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:imu_bias_status-val is deprecated.  Use fixposition_driver-msg:imu_bias_status instead.")
  (imu_bias_status m))

(cl:ensure-generic-function 'gnss_status-val :lambda-list '(m))
(cl:defmethod gnss_status-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:gnss_status-val is deprecated.  Use fixposition_driver-msg:gnss_status instead.")
  (gnss_status m))

(cl:ensure-generic-function 'wheelspeed_status-val :lambda-list '(m))
(cl:defmethod wheelspeed_status-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:wheelspeed_status-val is deprecated.  Use fixposition_driver-msg:wheelspeed_status instead.")
  (wheelspeed_status m))

(cl:ensure-generic-function 'version-val :lambda-list '(m))
(cl:defmethod version-val ((m <VRTK>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fixposition_driver-msg:version-val is deprecated.  Use fixposition_driver-msg:version instead.")
  (version m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VRTK>) ostream)
  "Serializes a message object of type '<VRTK>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'pose_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'pose_frame))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'kin_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'kin_frame))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'acceleration) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fusion_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fusion_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'imu_bias_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'imu_bias_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gnss_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'gnss_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheelspeed_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wheelspeed_status)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'version))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VRTK>) istream)
  "Deserializes a message object of type '<VRTK>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pose_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'pose_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'kin_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'kin_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'acceleration) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fusion_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fusion_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'imu_bias_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'imu_bias_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gnss_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'gnss_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wheelspeed_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wheelspeed_status)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VRTK>)))
  "Returns string type for a message object of type '<VRTK>"
  "fixposition_driver/VRTK")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VRTK)))
  "Returns string type for a message object of type 'VRTK"
  "fixposition_driver/VRTK")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VRTK>)))
  "Returns md5sum for a message object of type '<VRTK>"
  "7cbe0f9d1cf38ef055ff94d17cb82078")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VRTK)))
  "Returns md5sum for a message object of type 'VRTK"
  "7cbe0f9d1cf38ef055ff94d17cb82078")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VRTK>)))
  "Returns full string definition for message of type '<VRTK>"
  (cl:format cl:nil "####################################################################################################~%#~%#    Copyright (c) 2022  ___     ___~%#                       \\\\  \\\\  /  /~%#                        \\\\  \\\\/  /~%#                         /  /\\\\  \\\\~%#                        /__/  \\\\__\\\\  Fixposition AG~%#~%####################################################################################################~%#~%# Fixposition VRTK Message~%#~%#~%####################################################################################################~%~%Header header~%string pose_frame                               # frame of the pose values [pose, quaternion]~%string kin_frame                                # frame of the kinematic values [linear/angular velocity, acceleration]~%geometry_msgs/PoseWithCovariance pose           # position, orientation~%geometry_msgs/TwistWithCovariance velocity      # linear, angular~%geometry_msgs/Vector3 acceleration              # linear acceleration~%~%uint16 fusion_status                            # field for the fusion status~%uint16 imu_bias_status                          # field for the IMU bias status~%uint16 gnss_status                              # field for the gnss status~%uint16 wheelspeed_status                        # field for the wheelspeed status~%string version                                  # Fixposition software version~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VRTK)))
  "Returns full string definition for message of type 'VRTK"
  (cl:format cl:nil "####################################################################################################~%#~%#    Copyright (c) 2022  ___     ___~%#                       \\\\  \\\\  /  /~%#                        \\\\  \\\\/  /~%#                         /  /\\\\  \\\\~%#                        /__/  \\\\__\\\\  Fixposition AG~%#~%####################################################################################################~%#~%# Fixposition VRTK Message~%#~%#~%####################################################################################################~%~%Header header~%string pose_frame                               # frame of the pose values [pose, quaternion]~%string kin_frame                                # frame of the kinematic values [linear/angular velocity, acceleration]~%geometry_msgs/PoseWithCovariance pose           # position, orientation~%geometry_msgs/TwistWithCovariance velocity      # linear, angular~%geometry_msgs/Vector3 acceleration              # linear acceleration~%~%uint16 fusion_status                            # field for the fusion status~%uint16 imu_bias_status                          # field for the IMU bias status~%uint16 gnss_status                              # field for the gnss status~%uint16 wheelspeed_status                        # field for the wheelspeed status~%string version                                  # Fixposition software version~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VRTK>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'pose_frame))
     4 (cl:length (cl:slot-value msg 'kin_frame))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'acceleration))
     2
     2
     2
     2
     4 (cl:length (cl:slot-value msg 'version))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VRTK>))
  "Converts a ROS message object to a list"
  (cl:list 'VRTK
    (cl:cons ':header (header msg))
    (cl:cons ':pose_frame (pose_frame msg))
    (cl:cons ':kin_frame (kin_frame msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':acceleration (acceleration msg))
    (cl:cons ':fusion_status (fusion_status msg))
    (cl:cons ':imu_bias_status (imu_bias_status msg))
    (cl:cons ':gnss_status (gnss_status msg))
    (cl:cons ':wheelspeed_status (wheelspeed_status msg))
    (cl:cons ':version (version msg))
))
