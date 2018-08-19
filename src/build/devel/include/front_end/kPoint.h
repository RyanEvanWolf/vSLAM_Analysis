// Generated by gencpp from file front_end/kPoint.msg
// DO NOT EDIT!


#ifndef FRONT_END_MESSAGE_KPOINT_H
#define FRONT_END_MESSAGE_KPOINT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace front_end
{
template <class ContainerAllocator>
struct kPoint_
{
  typedef kPoint_<ContainerAllocator> Type;

  kPoint_()
    : x(0.0)
    , y(0.0)
    , size(0.0)
    , angle(0.0)
    , response(0.0)
    , octave(0)
    , class_id(0)  {
    }
  kPoint_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , size(0.0)
    , angle(0.0)
    , response(0.0)
    , octave(0)
    , class_id(0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _size_type;
  _size_type size;

   typedef float _angle_type;
  _angle_type angle;

   typedef float _response_type;
  _response_type response;

   typedef int32_t _octave_type;
  _octave_type octave;

   typedef int32_t _class_id_type;
  _class_id_type class_id;




  typedef boost::shared_ptr< ::front_end::kPoint_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::front_end::kPoint_<ContainerAllocator> const> ConstPtr;

}; // struct kPoint_

typedef ::front_end::kPoint_<std::allocator<void> > kPoint;

typedef boost::shared_ptr< ::front_end::kPoint > kPointPtr;
typedef boost::shared_ptr< ::front_end::kPoint const> kPointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::front_end::kPoint_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::front_end::kPoint_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace front_end

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'front_end': ['/home/ryan/git/vSLAM_Analysis/src/front_end/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::front_end::kPoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::front_end::kPoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::front_end::kPoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::front_end::kPoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::front_end::kPoint_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::front_end::kPoint_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::front_end::kPoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6cdfd0fe8fb759c2e28f776698d1b6c3";
  }

  static const char* value(const ::front_end::kPoint_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6cdfd0fe8fb759c2ULL;
  static const uint64_t static_value2 = 0xe28f776698d1b6c3ULL;
};

template<class ContainerAllocator>
struct DataType< ::front_end::kPoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "front_end/kPoint";
  }

  static const char* value(const ::front_end::kPoint_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::front_end::kPoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n\
float32 y\n\
float32 size\n\
float32 angle\n\
float32 response\n\
int32 octave\n\
int32 class_id\n\
";
  }

  static const char* value(const ::front_end::kPoint_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::front_end::kPoint_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.size);
      stream.next(m.angle);
      stream.next(m.response);
      stream.next(m.octave);
      stream.next(m.class_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct kPoint_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::front_end::kPoint_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::front_end::kPoint_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "size: ";
    Printer<float>::stream(s, indent + "  ", v.size);
    s << indent << "angle: ";
    Printer<float>::stream(s, indent + "  ", v.angle);
    s << indent << "response: ";
    Printer<float>::stream(s, indent + "  ", v.response);
    s << indent << "octave: ";
    Printer<int32_t>::stream(s, indent + "  ", v.octave);
    s << indent << "class_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.class_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRONT_END_MESSAGE_KPOINT_H
