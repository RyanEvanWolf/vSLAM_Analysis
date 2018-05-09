// Generated by gencpp from file front_end/singleImageDetectionResponse.msg
// DO NOT EDIT!


#ifndef FRONT_END_MESSAGE_SINGLEIMAGEDETECTIONRESPONSE_H
#define FRONT_END_MESSAGE_SINGLEIMAGEDETECTIONRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <front_end/frameDetection.h>

namespace front_end
{
template <class ContainerAllocator>
struct singleImageDetectionResponse_
{
  typedef singleImageDetectionResponse_<ContainerAllocator> Type;

  singleImageDetectionResponse_()
    : outputFrames()  {
    }
  singleImageDetectionResponse_(const ContainerAllocator& _alloc)
    : outputFrames(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::front_end::frameDetection_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::front_end::frameDetection_<ContainerAllocator> >::other >  _outputFrames_type;
  _outputFrames_type outputFrames;




  typedef boost::shared_ptr< ::front_end::singleImageDetectionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::front_end::singleImageDetectionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct singleImageDetectionResponse_

typedef ::front_end::singleImageDetectionResponse_<std::allocator<void> > singleImageDetectionResponse;

typedef boost::shared_ptr< ::front_end::singleImageDetectionResponse > singleImageDetectionResponsePtr;
typedef boost::shared_ptr< ::front_end::singleImageDetectionResponse const> singleImageDetectionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::front_end::singleImageDetectionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace front_end

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'front_end': ['/home/ryan/git/vSLAM_Analysis/src/front_end/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::front_end::singleImageDetectionResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::front_end::singleImageDetectionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::front_end::singleImageDetectionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6fc97d3ab2e9ba441043d078dbb98455";
  }

  static const char* value(const ::front_end::singleImageDetectionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6fc97d3ab2e9ba44ULL;
  static const uint64_t static_value2 = 0x1043d078dbb98455ULL;
};

template<class ContainerAllocator>
struct DataType< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "front_end/singleImageDetectionResponse";
  }

  static const char* value(const ::front_end::singleImageDetectionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "front_end/frameDetection[] outputFrames\n\
\n\
\n\
================================================================================\n\
MSG: front_end/frameDetection\n\
front_end/kPoint[] leftFeatures\n\
uint16 nLeft\n\
float32 l_xAvg\n\
float32 l_yAvg\n\
float32 l_xStd\n\
float32 l_yStd\n\
front_end/kPoint[] rightFeatures\n\
uint16 nRight\n\
float32 r_xAvg\n\
float32 r_yAvg\n\
float32 r_xStd\n\
float32 r_yStd\n\
front_end/ProcTime[] processingTime \n\
\n\
================================================================================\n\
MSG: front_end/kPoint\n\
float32 x\n\
float32 y\n\
float32 size\n\
float32 angle\n\
float32 response\n\
int32 octave\n\
int32 class_id\n\
sensor_msgs/Image[] descriptors\n\
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
\n\
================================================================================\n\
MSG: front_end/ProcTime\n\
string label\n\
float64 seconds\n\
";
  }

  static const char* value(const ::front_end::singleImageDetectionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.outputFrames);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct singleImageDetectionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::front_end::singleImageDetectionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::front_end::singleImageDetectionResponse_<ContainerAllocator>& v)
  {
    s << indent << "outputFrames[]" << std::endl;
    for (size_t i = 0; i < v.outputFrames.size(); ++i)
    {
      s << indent << "  outputFrames[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::front_end::frameDetection_<ContainerAllocator> >::stream(s, indent + "    ", v.outputFrames[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRONT_END_MESSAGE_SINGLEIMAGEDETECTIONRESPONSE_H
