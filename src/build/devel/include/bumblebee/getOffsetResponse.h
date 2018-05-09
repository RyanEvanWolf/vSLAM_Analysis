// Generated by gencpp from file bumblebee/getOffsetResponse.msg
// DO NOT EDIT!


#ifndef BUMBLEBEE_MESSAGE_GETOFFSETRESPONSE_H
#define BUMBLEBEE_MESSAGE_GETOFFSETRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/RegionOfInterest.h>
#include <sensor_msgs/RegionOfInterest.h>

namespace bumblebee
{
template <class ContainerAllocator>
struct getOffsetResponse_
{
  typedef getOffsetResponse_<ContainerAllocator> Type;

  getOffsetResponse_()
    : left()
    , right()  {
    }
  getOffsetResponse_(const ContainerAllocator& _alloc)
    : left(_alloc)
    , right(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::RegionOfInterest_<ContainerAllocator>  _left_type;
  _left_type left;

   typedef  ::sensor_msgs::RegionOfInterest_<ContainerAllocator>  _right_type;
  _right_type right;




  typedef boost::shared_ptr< ::bumblebee::getOffsetResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bumblebee::getOffsetResponse_<ContainerAllocator> const> ConstPtr;

}; // struct getOffsetResponse_

typedef ::bumblebee::getOffsetResponse_<std::allocator<void> > getOffsetResponse;

typedef boost::shared_ptr< ::bumblebee::getOffsetResponse > getOffsetResponsePtr;
typedef boost::shared_ptr< ::bumblebee::getOffsetResponse const> getOffsetResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bumblebee::getOffsetResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bumblebee::getOffsetResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace bumblebee

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bumblebee::getOffsetResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bumblebee::getOffsetResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bumblebee::getOffsetResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e0fde965a1b7161594fc69b01cf6bc87";
  }

  static const char* value(const ::bumblebee::getOffsetResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe0fde965a1b71615ULL;
  static const uint64_t static_value2 = 0x94fc69b01cf6bc87ULL;
};

template<class ContainerAllocator>
struct DataType< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bumblebee/getOffsetResponse";
  }

  static const char* value(const ::bumblebee::getOffsetResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/RegionOfInterest left\n\
sensor_msgs/RegionOfInterest right\n\
\n\
\n\
================================================================================\n\
MSG: sensor_msgs/RegionOfInterest\n\
# This message is used to specify a region of interest within an image.\n\
#\n\
# When used to specify the ROI setting of the camera when the image was\n\
# taken, the height and width fields should either match the height and\n\
# width fields for the associated image; or height = width = 0\n\
# indicates that the full resolution image was captured.\n\
\n\
uint32 x_offset  # Leftmost pixel of the ROI\n\
                 # (0 if the ROI includes the left edge of the image)\n\
uint32 y_offset  # Topmost pixel of the ROI\n\
                 # (0 if the ROI includes the top edge of the image)\n\
uint32 height    # Height of ROI\n\
uint32 width     # Width of ROI\n\
\n\
# True if a distinct rectified ROI should be calculated from the \"raw\"\n\
# ROI in this message. Typically this should be False if the full image\n\
# is captured (ROI not used), and True if a subwindow is captured (ROI\n\
# used).\n\
bool do_rectify\n\
";
  }

  static const char* value(const ::bumblebee::getOffsetResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.left);
      stream.next(m.right);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct getOffsetResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bumblebee::getOffsetResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::bumblebee::getOffsetResponse_<ContainerAllocator>& v)
  {
    s << indent << "left: ";
    s << std::endl;
    Printer< ::sensor_msgs::RegionOfInterest_<ContainerAllocator> >::stream(s, indent + "  ", v.left);
    s << indent << "right: ";
    s << std::endl;
    Printer< ::sensor_msgs::RegionOfInterest_<ContainerAllocator> >::stream(s, indent + "  ", v.right);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BUMBLEBEE_MESSAGE_GETOFFSETRESPONSE_H
