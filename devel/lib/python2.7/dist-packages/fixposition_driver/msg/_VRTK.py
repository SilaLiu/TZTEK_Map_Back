# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from fixposition_driver/VRTK.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class VRTK(genpy.Message):
  _md5sum = "7cbe0f9d1cf38ef055ff94d17cb82078"
  _type = "fixposition_driver/VRTK"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """####################################################################################################
#
#    Copyright (c) 2022  ___     ___
#                       \\  \\  /  /
#                        \\  \\/  /
#                         /  /\\  \\
#                        /__/  \\__\\  Fixposition AG
#
####################################################################################################
#
# Fixposition VRTK Message
#
#
####################################################################################################

Header header
string pose_frame                               # frame of the pose values [pose, quaternion]
string kin_frame                                # frame of the kinematic values [linear/angular velocity, acceleration]
geometry_msgs/PoseWithCovariance pose           # position, orientation
geometry_msgs/TwistWithCovariance velocity      # linear, angular
geometry_msgs/Vector3 acceleration              # linear acceleration

uint16 fusion_status                            # field for the fusion status
uint16 imu_bias_status                          # field for the IMU bias status
uint16 gnss_status                              # field for the gnss status
uint16 wheelspeed_status                        # field for the wheelspeed status
string version                                  # Fixposition software version

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z"""
  __slots__ = ['header','pose_frame','kin_frame','pose','velocity','acceleration','fusion_status','imu_bias_status','gnss_status','wheelspeed_status','version']
  _slot_types = ['std_msgs/Header','string','string','geometry_msgs/PoseWithCovariance','geometry_msgs/TwistWithCovariance','geometry_msgs/Vector3','uint16','uint16','uint16','uint16','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,pose_frame,kin_frame,pose,velocity,acceleration,fusion_status,imu_bias_status,gnss_status,wheelspeed_status,version

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(VRTK, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.pose_frame is None:
        self.pose_frame = ''
      if self.kin_frame is None:
        self.kin_frame = ''
      if self.pose is None:
        self.pose = geometry_msgs.msg.PoseWithCovariance()
      if self.velocity is None:
        self.velocity = geometry_msgs.msg.TwistWithCovariance()
      if self.acceleration is None:
        self.acceleration = geometry_msgs.msg.Vector3()
      if self.fusion_status is None:
        self.fusion_status = 0
      if self.imu_bias_status is None:
        self.imu_bias_status = 0
      if self.gnss_status is None:
        self.gnss_status = 0
      if self.wheelspeed_status is None:
        self.wheelspeed_status = 0
      if self.version is None:
        self.version = ''
    else:
      self.header = std_msgs.msg.Header()
      self.pose_frame = ''
      self.kin_frame = ''
      self.pose = geometry_msgs.msg.PoseWithCovariance()
      self.velocity = geometry_msgs.msg.TwistWithCovariance()
      self.acceleration = geometry_msgs.msg.Vector3()
      self.fusion_status = 0
      self.imu_bias_status = 0
      self.gnss_status = 0
      self.wheelspeed_status = 0
      self.version = ''

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.pose_frame
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.kin_frame
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_7d().pack(_x.pose.pose.position.x, _x.pose.pose.position.y, _x.pose.pose.position.z, _x.pose.pose.orientation.x, _x.pose.pose.orientation.y, _x.pose.pose.orientation.z, _x.pose.pose.orientation.w))
      buff.write(_get_struct_36d().pack(*self.pose.covariance))
      _x = self
      buff.write(_get_struct_6d().pack(_x.velocity.twist.linear.x, _x.velocity.twist.linear.y, _x.velocity.twist.linear.z, _x.velocity.twist.angular.x, _x.velocity.twist.angular.y, _x.velocity.twist.angular.z))
      buff.write(_get_struct_36d().pack(*self.velocity.covariance))
      _x = self
      buff.write(_get_struct_3d4H().pack(_x.acceleration.x, _x.acceleration.y, _x.acceleration.z, _x.fusion_status, _x.imu_bias_status, _x.gnss_status, _x.wheelspeed_status))
      _x = self.version
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.pose is None:
        self.pose = geometry_msgs.msg.PoseWithCovariance()
      if self.velocity is None:
        self.velocity = geometry_msgs.msg.TwistWithCovariance()
      if self.acceleration is None:
        self.acceleration = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.pose_frame = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.pose_frame = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.kin_frame = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.kin_frame = str[start:end]
      _x = self
      start = end
      end += 56
      (_x.pose.pose.position.x, _x.pose.pose.position.y, _x.pose.pose.position.z, _x.pose.pose.orientation.x, _x.pose.pose.orientation.y, _x.pose.pose.orientation.z, _x.pose.pose.orientation.w,) = _get_struct_7d().unpack(str[start:end])
      start = end
      end += 288
      self.pose.covariance = _get_struct_36d().unpack(str[start:end])
      _x = self
      start = end
      end += 48
      (_x.velocity.twist.linear.x, _x.velocity.twist.linear.y, _x.velocity.twist.linear.z, _x.velocity.twist.angular.x, _x.velocity.twist.angular.y, _x.velocity.twist.angular.z,) = _get_struct_6d().unpack(str[start:end])
      start = end
      end += 288
      self.velocity.covariance = _get_struct_36d().unpack(str[start:end])
      _x = self
      start = end
      end += 32
      (_x.acceleration.x, _x.acceleration.y, _x.acceleration.z, _x.fusion_status, _x.imu_bias_status, _x.gnss_status, _x.wheelspeed_status,) = _get_struct_3d4H().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.version = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.version = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.pose_frame
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.kin_frame
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_7d().pack(_x.pose.pose.position.x, _x.pose.pose.position.y, _x.pose.pose.position.z, _x.pose.pose.orientation.x, _x.pose.pose.orientation.y, _x.pose.pose.orientation.z, _x.pose.pose.orientation.w))
      buff.write(self.pose.covariance.tostring())
      _x = self
      buff.write(_get_struct_6d().pack(_x.velocity.twist.linear.x, _x.velocity.twist.linear.y, _x.velocity.twist.linear.z, _x.velocity.twist.angular.x, _x.velocity.twist.angular.y, _x.velocity.twist.angular.z))
      buff.write(self.velocity.covariance.tostring())
      _x = self
      buff.write(_get_struct_3d4H().pack(_x.acceleration.x, _x.acceleration.y, _x.acceleration.z, _x.fusion_status, _x.imu_bias_status, _x.gnss_status, _x.wheelspeed_status))
      _x = self.version
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.pose is None:
        self.pose = geometry_msgs.msg.PoseWithCovariance()
      if self.velocity is None:
        self.velocity = geometry_msgs.msg.TwistWithCovariance()
      if self.acceleration is None:
        self.acceleration = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.pose_frame = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.pose_frame = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.kin_frame = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.kin_frame = str[start:end]
      _x = self
      start = end
      end += 56
      (_x.pose.pose.position.x, _x.pose.pose.position.y, _x.pose.pose.position.z, _x.pose.pose.orientation.x, _x.pose.pose.orientation.y, _x.pose.pose.orientation.z, _x.pose.pose.orientation.w,) = _get_struct_7d().unpack(str[start:end])
      start = end
      end += 288
      self.pose.covariance = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=36)
      _x = self
      start = end
      end += 48
      (_x.velocity.twist.linear.x, _x.velocity.twist.linear.y, _x.velocity.twist.linear.z, _x.velocity.twist.angular.x, _x.velocity.twist.angular.y, _x.velocity.twist.angular.z,) = _get_struct_6d().unpack(str[start:end])
      start = end
      end += 288
      self.velocity.covariance = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=36)
      _x = self
      start = end
      end += 32
      (_x.acceleration.x, _x.acceleration.y, _x.acceleration.z, _x.fusion_status, _x.imu_bias_status, _x.gnss_status, _x.wheelspeed_status,) = _get_struct_3d4H().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.version = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.version = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_36d = None
def _get_struct_36d():
    global _struct_36d
    if _struct_36d is None:
        _struct_36d = struct.Struct("<36d")
    return _struct_36d
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3d4H = None
def _get_struct_3d4H():
    global _struct_3d4H
    if _struct_3d4H is None:
        _struct_3d4H = struct.Struct("<3d4H")
    return _struct_3d4H
_struct_6d = None
def _get_struct_6d():
    global _struct_6d
    if _struct_6d is None:
        _struct_6d = struct.Struct("<6d")
    return _struct_6d
_struct_7d = None
def _get_struct_7d():
    global _struct_7d
    if _struct_7d is None:
        _struct_7d = struct.Struct("<7d")
    return _struct_7d