// Generated by gencpp from file dataset/updateImageResponse.msg
// DO NOT EDIT!


#ifndef DATASET_MESSAGE_UPDATEIMAGERESPONSE_H
#define DATASET_MESSAGE_UPDATEIMAGERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace dataset
{
template <class ContainerAllocator>
struct updateImageResponse_
{
  typedef updateImageResponse_<ContainerAllocator> Type;

  updateImageResponse_()
    {
    }
  updateImageResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }






  typedef boost::shared_ptr< ::dataset::updateImageResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dataset::updateImageResponse_<ContainerAllocator> const> ConstPtr;

}; // struct updateImageResponse_

typedef ::dataset::updateImageResponse_<std::allocator<void> > updateImageResponse;

typedef boost::shared_ptr< ::dataset::updateImageResponse > updateImageResponsePtr;
typedef boost::shared_ptr< ::dataset::updateImageResponse const> updateImageResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dataset::updateImageResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dataset::updateImageResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace dataset

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'front_end': ['/home/ryan/git/vSLAM_Analysis/src/front_end/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::dataset::updateImageResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dataset::updateImageResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dataset::updateImageResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dataset::updateImageResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dataset::updateImageResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dataset::updateImageResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dataset::updateImageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::dataset::updateImageResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::dataset::updateImageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dataset/updateImageResponse";
  }

  static const char* value(const ::dataset::updateImageResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dataset::updateImageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::dataset::updateImageResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dataset::updateImageResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct updateImageResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dataset::updateImageResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::dataset::updateImageResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // DATASET_MESSAGE_UPDATEIMAGERESPONSE_H
