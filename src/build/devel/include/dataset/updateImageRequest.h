// Generated by gencpp from file dataset/updateImageRequest.msg
// DO NOT EDIT!


#ifndef DATASET_MESSAGE_UPDATEIMAGEREQUEST_H
#define DATASET_MESSAGE_UPDATEIMAGEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/String.h>
#include <sensor_msgs/Image.h>

namespace dataset
{
template <class ContainerAllocator>
struct updateImageRequest_
{
  typedef updateImageRequest_<ContainerAllocator> Type;

  updateImageRequest_()
    : windowName()
    , newImage()
    , display(false)  {
    }
  updateImageRequest_(const ContainerAllocator& _alloc)
    : windowName(_alloc)
    , newImage(_alloc)
    , display(false)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::String_<ContainerAllocator>  _windowName_type;
  _windowName_type windowName;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _newImage_type;
  _newImage_type newImage;

   typedef uint8_t _display_type;
  _display_type display;




  typedef boost::shared_ptr< ::dataset::updateImageRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dataset::updateImageRequest_<ContainerAllocator> const> ConstPtr;

}; // struct updateImageRequest_

typedef ::dataset::updateImageRequest_<std::allocator<void> > updateImageRequest;

typedef boost::shared_ptr< ::dataset::updateImageRequest > updateImageRequestPtr;
typedef boost::shared_ptr< ::dataset::updateImageRequest const> updateImageRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dataset::updateImageRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dataset::updateImageRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace dataset

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'front_end': ['/home/ryan/git/vSLAM_Analysis/src/front_end/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::dataset::updateImageRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dataset::updateImageRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dataset::updateImageRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dataset::updateImageRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dataset::updateImageRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dataset::updateImageRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dataset::updateImageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "14086f831f7b9fc93a1aa90e9b41d9a6";
  }

  static const char* value(const ::dataset::updateImageRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x14086f831f7b9fc9ULL;
  static const uint64_t static_value2 = 0x3a1aa90e9b41d9a6ULL;
};

template<class ContainerAllocator>
struct DataType< ::dataset::updateImageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dataset/updateImageRequest";
  }

  static const char* value(const ::dataset::updateImageRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dataset::updateImageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/String windowName\n\
sensor_msgs/Image newImage\n\
bool display\n\
\n\
================================================================================\n\
MSG: std_msgs/String\n\
string data\n\
\n\
================================================================================\n\
MSG: sensor_msgs/Image\n\
# This message contains an uncompressed image\n\
# (0, 0) is at top-left corner of image\n\
#\n\
\n\
Header header        # Header timestamp should be acquisition time of image\n\
                     # Header frame_id should be optical frame of camera\n\
                     # origin of frame should be optical center of cameara\n\
                     # +x should point to the right in the image\n\
                     # +y should point down in the image\n\
                     # +z should point into to plane of the image\n\
                     # If the frame_id here and the frame_id of the CameraInfo\n\
                     # message associated with the image conflict\n\
                     # the behavior is undefined\n\
\n\
uint32 height         # image height, that is, number of rows\n\
uint32 width          # image width, that is, number of columns\n\
\n\
# The legal values for encoding are in file src/image_encodings.cpp\n\
# If you want to standardize a new string format, join\n\
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n\
\n\
string encoding       # Encoding of pixels -- channel meaning, ordering, size\n\
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n\
\n\
uint8 is_bigendian    # is this data bigendian?\n\
uint32 step           # Full row length in bytes\n\
uint8[] data          # actual matrix data, size is (step * rows)\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::dataset::updateImageRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dataset::updateImageRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.windowName);
      stream.next(m.newImage);
      stream.next(m.display);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct updateImageRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dataset::updateImageRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dataset::updateImageRequest_<ContainerAllocator>& v)
  {
    s << indent << "windowName: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.windowName);
    s << indent << "newImage: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.newImage);
    s << indent << "display: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.display);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DATASET_MESSAGE_UPDATEIMAGEREQUEST_H
