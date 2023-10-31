// Generated by gencpp from file fixposition_driver/VRTK.msg
// DO NOT EDIT!


#ifndef FIXPOSITION_DRIVER_MESSAGE_VRTK_H
#define FIXPOSITION_DRIVER_MESSAGE_VRTK_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <geometry_msgs/TwistWithCovariance.h>
#include <geometry_msgs/Vector3.h>

namespace fixposition_driver
{
template <class ContainerAllocator>
struct VRTK_
{
  typedef VRTK_<ContainerAllocator> Type;

  VRTK_()
    : header()
    , pose_frame()
    , kin_frame()
    , pose()
    , velocity()
    , acceleration()
    , fusion_status(0)
    , imu_bias_status(0)
    , gnss_status(0)
    , wheelspeed_status(0)
    , version()  {
    }
  VRTK_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , pose_frame(_alloc)
    , kin_frame(_alloc)
    , pose(_alloc)
    , velocity(_alloc)
    , acceleration(_alloc)
    , fusion_status(0)
    , imu_bias_status(0)
    , gnss_status(0)
    , wheelspeed_status(0)
    , version(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _pose_frame_type;
  _pose_frame_type pose_frame;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _kin_frame_type;
  _kin_frame_type kin_frame;

   typedef  ::geometry_msgs::PoseWithCovariance_<ContainerAllocator>  _pose_type;
  _pose_type pose;

   typedef  ::geometry_msgs::TwistWithCovariance_<ContainerAllocator>  _velocity_type;
  _velocity_type velocity;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _acceleration_type;
  _acceleration_type acceleration;

   typedef uint16_t _fusion_status_type;
  _fusion_status_type fusion_status;

   typedef uint16_t _imu_bias_status_type;
  _imu_bias_status_type imu_bias_status;

   typedef uint16_t _gnss_status_type;
  _gnss_status_type gnss_status;

   typedef uint16_t _wheelspeed_status_type;
  _wheelspeed_status_type wheelspeed_status;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _version_type;
  _version_type version;





  typedef boost::shared_ptr< ::fixposition_driver::VRTK_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::fixposition_driver::VRTK_<ContainerAllocator> const> ConstPtr;

}; // struct VRTK_

typedef ::fixposition_driver::VRTK_<std::allocator<void> > VRTK;

typedef boost::shared_ptr< ::fixposition_driver::VRTK > VRTKPtr;
typedef boost::shared_ptr< ::fixposition_driver::VRTK const> VRTKConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::fixposition_driver::VRTK_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::fixposition_driver::VRTK_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::fixposition_driver::VRTK_<ContainerAllocator1> & lhs, const ::fixposition_driver::VRTK_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.pose_frame == rhs.pose_frame &&
    lhs.kin_frame == rhs.kin_frame &&
    lhs.pose == rhs.pose &&
    lhs.velocity == rhs.velocity &&
    lhs.acceleration == rhs.acceleration &&
    lhs.fusion_status == rhs.fusion_status &&
    lhs.imu_bias_status == rhs.imu_bias_status &&
    lhs.gnss_status == rhs.gnss_status &&
    lhs.wheelspeed_status == rhs.wheelspeed_status &&
    lhs.version == rhs.version;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::fixposition_driver::VRTK_<ContainerAllocator1> & lhs, const ::fixposition_driver::VRTK_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace fixposition_driver

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::fixposition_driver::VRTK_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::fixposition_driver::VRTK_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fixposition_driver::VRTK_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fixposition_driver::VRTK_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fixposition_driver::VRTK_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fixposition_driver::VRTK_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::fixposition_driver::VRTK_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7cbe0f9d1cf38ef055ff94d17cb82078";
  }

  static const char* value(const ::fixposition_driver::VRTK_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7cbe0f9d1cf38ef0ULL;
  static const uint64_t static_value2 = 0x55ff94d17cb82078ULL;
};

template<class ContainerAllocator>
struct DataType< ::fixposition_driver::VRTK_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fixposition_driver/VRTK";
  }

  static const char* value(const ::fixposition_driver::VRTK_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::fixposition_driver::VRTK_<ContainerAllocator> >
{
  static const char* value()
  {
    return "####################################################################################################\n"
"#\n"
"#    Copyright (c) 2022  ___     ___\n"
"#                       \\\\  \\\\  /  /\n"
"#                        \\\\  \\\\/  /\n"
"#                         /  /\\\\  \\\\\n"
"#                        /__/  \\\\__\\\\  Fixposition AG\n"
"#\n"
"####################################################################################################\n"
"#\n"
"# Fixposition VRTK Message\n"
"#\n"
"#\n"
"####################################################################################################\n"
"\n"
"Header header\n"
"string pose_frame                               # frame of the pose values [pose, quaternion]\n"
"string kin_frame                                # frame of the kinematic values [linear/angular velocity, acceleration]\n"
"geometry_msgs/PoseWithCovariance pose           # position, orientation\n"
"geometry_msgs/TwistWithCovariance velocity      # linear, angular\n"
"geometry_msgs/Vector3 acceleration              # linear acceleration\n"
"\n"
"uint16 fusion_status                            # field for the fusion status\n"
"uint16 imu_bias_status                          # field for the IMU bias status\n"
"uint16 gnss_status                              # field for the gnss status\n"
"uint16 wheelspeed_status                        # field for the wheelspeed status\n"
"string version                                  # Fixposition software version\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseWithCovariance\n"
"# This represents a pose in free space with uncertainty.\n"
"\n"
"Pose pose\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/TwistWithCovariance\n"
"# This expresses velocity in free space with uncertainty.\n"
"\n"
"Twist twist\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Twist\n"
"# This expresses velocity in free space broken into its linear and angular parts.\n"
"Vector3  linear\n"
"Vector3  angular\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::fixposition_driver::VRTK_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::fixposition_driver::VRTK_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.pose_frame);
      stream.next(m.kin_frame);
      stream.next(m.pose);
      stream.next(m.velocity);
      stream.next(m.acceleration);
      stream.next(m.fusion_status);
      stream.next(m.imu_bias_status);
      stream.next(m.gnss_status);
      stream.next(m.wheelspeed_status);
      stream.next(m.version);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VRTK_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::fixposition_driver::VRTK_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::fixposition_driver::VRTK_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "pose_frame: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.pose_frame);
    s << indent << "kin_frame: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.kin_frame);
    s << indent << "pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseWithCovariance_<ContainerAllocator> >::stream(s, indent + "  ", v.pose);
    s << indent << "velocity: ";
    s << std::endl;
    Printer< ::geometry_msgs::TwistWithCovariance_<ContainerAllocator> >::stream(s, indent + "  ", v.velocity);
    s << indent << "acceleration: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.acceleration);
    s << indent << "fusion_status: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.fusion_status);
    s << indent << "imu_bias_status: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.imu_bias_status);
    s << indent << "gnss_status: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.gnss_status);
    s << indent << "wheelspeed_status: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.wheelspeed_status);
    s << indent << "version: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.version);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FIXPOSITION_DRIVER_MESSAGE_VRTK_H
