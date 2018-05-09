// Generated by gencpp from file bumblebee/getRectificationMapRequest.msg
// DO NOT EDIT!


#ifndef BUMBLEBEE_MESSAGE_GETRECTIFICATIONMAPREQUEST_H
#define BUMBLEBEE_MESSAGE_GETRECTIFICATIONMAPREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace bumblebee
{
template <class ContainerAllocator>
struct getRectificationMapRequest_
{
  typedef getRectificationMapRequest_<ContainerAllocator> Type;

  getRectificationMapRequest_()
    : floatingPoint(false)  {
    }
  getRectificationMapRequest_(const ContainerAllocator& _alloc)
    : floatingPoint(false)  {
  (void)_alloc;
    }



   typedef uint8_t _floatingPoint_type;
  _floatingPoint_type floatingPoint;




  typedef boost::shared_ptr< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> const> ConstPtr;

}; // struct getRectificationMapRequest_

typedef ::bumblebee::getRectificationMapRequest_<std::allocator<void> > getRectificationMapRequest;

typedef boost::shared_ptr< ::bumblebee::getRectificationMapRequest > getRectificationMapRequestPtr;
typedef boost::shared_ptr< ::bumblebee::getRectificationMapRequest const> getRectificationMapRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bumblebee::getRectificationMapRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "44275c614efeea013018e080d3646251";
  }

  static const char* value(const ::bumblebee::getRectificationMapRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x44275c614efeea01ULL;
  static const uint64_t static_value2 = 0x3018e080d3646251ULL;
};

template<class ContainerAllocator>
struct DataType< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bumblebee/getRectificationMapRequest";
  }

  static const char* value(const ::bumblebee::getRectificationMapRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool floatingPoint\n\
";
  }

  static const char* value(const ::bumblebee::getRectificationMapRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.floatingPoint);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct getRectificationMapRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bumblebee::getRectificationMapRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::bumblebee::getRectificationMapRequest_<ContainerAllocator>& v)
  {
    s << indent << "floatingPoint: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.floatingPoint);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BUMBLEBEE_MESSAGE_GETRECTIFICATIONMAPREQUEST_H
