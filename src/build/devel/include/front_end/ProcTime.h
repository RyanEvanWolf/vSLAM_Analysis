// Generated by gencpp from file front_end/ProcTime.msg
// DO NOT EDIT!


#ifndef FRONT_END_MESSAGE_PROCTIME_H
#define FRONT_END_MESSAGE_PROCTIME_H


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
struct ProcTime_
{
  typedef ProcTime_<ContainerAllocator> Type;

  ProcTime_()
    : label()
    , seconds(0.0)  {
    }
  ProcTime_(const ContainerAllocator& _alloc)
    : label(_alloc)
    , seconds(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _label_type;
  _label_type label;

   typedef double _seconds_type;
  _seconds_type seconds;




  typedef boost::shared_ptr< ::front_end::ProcTime_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::front_end::ProcTime_<ContainerAllocator> const> ConstPtr;

}; // struct ProcTime_

typedef ::front_end::ProcTime_<std::allocator<void> > ProcTime;

typedef boost::shared_ptr< ::front_end::ProcTime > ProcTimePtr;
typedef boost::shared_ptr< ::front_end::ProcTime const> ProcTimeConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::front_end::ProcTime_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::front_end::ProcTime_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::front_end::ProcTime_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::front_end::ProcTime_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::front_end::ProcTime_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::front_end::ProcTime_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::front_end::ProcTime_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::front_end::ProcTime_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::front_end::ProcTime_<ContainerAllocator> >
{
  static const char* value()
  {
    return "adeb5bed2cff8503e6a304382d1eecbf";
  }

  static const char* value(const ::front_end::ProcTime_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xadeb5bed2cff8503ULL;
  static const uint64_t static_value2 = 0xe6a304382d1eecbfULL;
};

template<class ContainerAllocator>
struct DataType< ::front_end::ProcTime_<ContainerAllocator> >
{
  static const char* value()
  {
    return "front_end/ProcTime";
  }

  static const char* value(const ::front_end::ProcTime_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::front_end::ProcTime_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string label\n\
float64 seconds\n\
";
  }

  static const char* value(const ::front_end::ProcTime_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::front_end::ProcTime_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.label);
      stream.next(m.seconds);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ProcTime_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::front_end::ProcTime_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::front_end::ProcTime_<ContainerAllocator>& v)
  {
    s << indent << "label: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.label);
    s << indent << "seconds: ";
    Printer<double>::stream(s, indent + "  ", v.seconds);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRONT_END_MESSAGE_PROCTIME_H
