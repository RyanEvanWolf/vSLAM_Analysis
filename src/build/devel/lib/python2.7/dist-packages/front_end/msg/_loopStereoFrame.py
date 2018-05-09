# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from front_end/loopStereoFrame.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import front_end.msg
import std_msgs.msg
import sensor_msgs.msg

class loopStereoFrame(genpy.Message):
  _md5sum = "a52e277306b94a230f130fabeb9b1a7a"
  _type = "front_end/loopStereoFrame"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int32 frame_id
string curve_id
front_end/ProcTime[] processingTime
front_end/kPoint[] leftFeatures
front_end/kPoint[] rightFeatures
 

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds

================================================================================
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id
sensor_msgs/Image[] descriptors
================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

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
# 0: no frame
# 1: global frame
string frame_id
"""
  __slots__ = ['frame_id','curve_id','processingTime','leftFeatures','rightFeatures']
  _slot_types = ['int32','string','front_end/ProcTime[]','front_end/kPoint[]','front_end/kPoint[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       frame_id,curve_id,processingTime,leftFeatures,rightFeatures

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(loopStereoFrame, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.frame_id is None:
        self.frame_id = 0
      if self.curve_id is None:
        self.curve_id = ''
      if self.processingTime is None:
        self.processingTime = []
      if self.leftFeatures is None:
        self.leftFeatures = []
      if self.rightFeatures is None:
        self.rightFeatures = []
    else:
      self.frame_id = 0
      self.curve_id = ''
      self.processingTime = []
      self.leftFeatures = []
      self.rightFeatures = []

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
      buff.write(_get_struct_i().pack(self.frame_id))
      _x = self.curve_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.processingTime)
      buff.write(_struct_I.pack(length))
      for val1 in self.processingTime:
        _x = val1.label
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.pack('<I%ss'%length, length, _x))
        buff.write(_get_struct_d().pack(val1.seconds))
      length = len(self.leftFeatures)
      buff.write(_struct_I.pack(length))
      for val1 in self.leftFeatures:
        _x = val1
        buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        length = len(val1.descriptors)
        buff.write(_struct_I.pack(length))
        for val2 in val1.descriptors:
          _v1 = val2.header
          buff.write(_get_struct_I().pack(_v1.seq))
          _v2 = _v1.stamp
          _x = _v2
          buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
          _x = _v1.frame_id
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_2I().pack(_x.height, _x.width))
          _x = val2.encoding
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_BI().pack(_x.is_bigendian, _x.step))
          _x = val2.data
          length = len(_x)
          # - if encoded as a list instead, serialize as bytes instead of string
          if type(_x) in [list, tuple]:
            buff.write(struct.pack('<I%sB'%length, length, *_x))
          else:
            buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.rightFeatures)
      buff.write(_struct_I.pack(length))
      for val1 in self.rightFeatures:
        _x = val1
        buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        length = len(val1.descriptors)
        buff.write(_struct_I.pack(length))
        for val2 in val1.descriptors:
          _v3 = val2.header
          buff.write(_get_struct_I().pack(_v3.seq))
          _v4 = _v3.stamp
          _x = _v4
          buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
          _x = _v3.frame_id
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_2I().pack(_x.height, _x.width))
          _x = val2.encoding
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_BI().pack(_x.is_bigendian, _x.step))
          _x = val2.data
          length = len(_x)
          # - if encoded as a list instead, serialize as bytes instead of string
          if type(_x) in [list, tuple]:
            buff.write(struct.pack('<I%sB'%length, length, *_x))
          else:
            buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.processingTime is None:
        self.processingTime = None
      if self.leftFeatures is None:
        self.leftFeatures = None
      if self.rightFeatures is None:
        self.rightFeatures = None
      end = 0
      start = end
      end += 4
      (self.frame_id,) = _get_struct_i().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.curve_id = str[start:end].decode('utf-8')
      else:
        self.curve_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.processingTime = []
      for i in range(0, length):
        val1 = front_end.msg.ProcTime()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.label = str[start:end].decode('utf-8')
        else:
          val1.label = str[start:end]
        start = end
        end += 8
        (val1.seconds,) = _get_struct_d().unpack(str[start:end])
        self.processingTime.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.leftFeatures = []
      for i in range(0, length):
        val1 = front_end.msg.kPoint()
        _x = val1
        start = end
        end += 28
        (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.descriptors = []
        for i in range(0, length):
          val2 = sensor_msgs.msg.Image()
          _v5 = val2.header
          start = end
          end += 4
          (_v5.seq,) = _get_struct_I().unpack(str[start:end])
          _v6 = _v5.stamp
          _x = _v6
          start = end
          end += 8
          (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            _v5.frame_id = str[start:end].decode('utf-8')
          else:
            _v5.frame_id = str[start:end]
          _x = val2
          start = end
          end += 8
          (_x.height, _x.width,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2.encoding = str[start:end].decode('utf-8')
          else:
            val2.encoding = str[start:end]
          _x = val2
          start = end
          end += 5
          (_x.is_bigendian, _x.step,) = _get_struct_BI().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          val2.data = str[start:end]
          val1.descriptors.append(val2)
        self.leftFeatures.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.rightFeatures = []
      for i in range(0, length):
        val1 = front_end.msg.kPoint()
        _x = val1
        start = end
        end += 28
        (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.descriptors = []
        for i in range(0, length):
          val2 = sensor_msgs.msg.Image()
          _v7 = val2.header
          start = end
          end += 4
          (_v7.seq,) = _get_struct_I().unpack(str[start:end])
          _v8 = _v7.stamp
          _x = _v8
          start = end
          end += 8
          (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            _v7.frame_id = str[start:end].decode('utf-8')
          else:
            _v7.frame_id = str[start:end]
          _x = val2
          start = end
          end += 8
          (_x.height, _x.width,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2.encoding = str[start:end].decode('utf-8')
          else:
            val2.encoding = str[start:end]
          _x = val2
          start = end
          end += 5
          (_x.is_bigendian, _x.step,) = _get_struct_BI().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          val2.data = str[start:end]
          val1.descriptors.append(val2)
        self.rightFeatures.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      buff.write(_get_struct_i().pack(self.frame_id))
      _x = self.curve_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.processingTime)
      buff.write(_struct_I.pack(length))
      for val1 in self.processingTime:
        _x = val1.label
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.pack('<I%ss'%length, length, _x))
        buff.write(_get_struct_d().pack(val1.seconds))
      length = len(self.leftFeatures)
      buff.write(_struct_I.pack(length))
      for val1 in self.leftFeatures:
        _x = val1
        buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        length = len(val1.descriptors)
        buff.write(_struct_I.pack(length))
        for val2 in val1.descriptors:
          _v9 = val2.header
          buff.write(_get_struct_I().pack(_v9.seq))
          _v10 = _v9.stamp
          _x = _v10
          buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
          _x = _v9.frame_id
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_2I().pack(_x.height, _x.width))
          _x = val2.encoding
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_BI().pack(_x.is_bigendian, _x.step))
          _x = val2.data
          length = len(_x)
          # - if encoded as a list instead, serialize as bytes instead of string
          if type(_x) in [list, tuple]:
            buff.write(struct.pack('<I%sB'%length, length, *_x))
          else:
            buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.rightFeatures)
      buff.write(_struct_I.pack(length))
      for val1 in self.rightFeatures:
        _x = val1
        buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        length = len(val1.descriptors)
        buff.write(_struct_I.pack(length))
        for val2 in val1.descriptors:
          _v11 = val2.header
          buff.write(_get_struct_I().pack(_v11.seq))
          _v12 = _v11.stamp
          _x = _v12
          buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
          _x = _v11.frame_id
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_2I().pack(_x.height, _x.width))
          _x = val2.encoding
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          _x = val2
          buff.write(_get_struct_BI().pack(_x.is_bigendian, _x.step))
          _x = val2.data
          length = len(_x)
          # - if encoded as a list instead, serialize as bytes instead of string
          if type(_x) in [list, tuple]:
            buff.write(struct.pack('<I%sB'%length, length, *_x))
          else:
            buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.processingTime is None:
        self.processingTime = None
      if self.leftFeatures is None:
        self.leftFeatures = None
      if self.rightFeatures is None:
        self.rightFeatures = None
      end = 0
      start = end
      end += 4
      (self.frame_id,) = _get_struct_i().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.curve_id = str[start:end].decode('utf-8')
      else:
        self.curve_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.processingTime = []
      for i in range(0, length):
        val1 = front_end.msg.ProcTime()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.label = str[start:end].decode('utf-8')
        else:
          val1.label = str[start:end]
        start = end
        end += 8
        (val1.seconds,) = _get_struct_d().unpack(str[start:end])
        self.processingTime.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.leftFeatures = []
      for i in range(0, length):
        val1 = front_end.msg.kPoint()
        _x = val1
        start = end
        end += 28
        (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.descriptors = []
        for i in range(0, length):
          val2 = sensor_msgs.msg.Image()
          _v13 = val2.header
          start = end
          end += 4
          (_v13.seq,) = _get_struct_I().unpack(str[start:end])
          _v14 = _v13.stamp
          _x = _v14
          start = end
          end += 8
          (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            _v13.frame_id = str[start:end].decode('utf-8')
          else:
            _v13.frame_id = str[start:end]
          _x = val2
          start = end
          end += 8
          (_x.height, _x.width,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2.encoding = str[start:end].decode('utf-8')
          else:
            val2.encoding = str[start:end]
          _x = val2
          start = end
          end += 5
          (_x.is_bigendian, _x.step,) = _get_struct_BI().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          val2.data = str[start:end]
          val1.descriptors.append(val2)
        self.leftFeatures.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.rightFeatures = []
      for i in range(0, length):
        val1 = front_end.msg.kPoint()
        _x = val1
        start = end
        end += 28
        (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.descriptors = []
        for i in range(0, length):
          val2 = sensor_msgs.msg.Image()
          _v15 = val2.header
          start = end
          end += 4
          (_v15.seq,) = _get_struct_I().unpack(str[start:end])
          _v16 = _v15.stamp
          _x = _v16
          start = end
          end += 8
          (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            _v15.frame_id = str[start:end].decode('utf-8')
          else:
            _v15.frame_id = str[start:end]
          _x = val2
          start = end
          end += 8
          (_x.height, _x.width,) = _get_struct_2I().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2.encoding = str[start:end].decode('utf-8')
          else:
            val2.encoding = str[start:end]
          _x = val2
          start = end
          end += 5
          (_x.is_bigendian, _x.step,) = _get_struct_BI().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          val2.data = str[start:end]
          val1.descriptors.append(val2)
        self.rightFeatures.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_d = None
def _get_struct_d():
    global _struct_d
    if _struct_d is None:
        _struct_d = struct.Struct("<d")
    return _struct_d
_struct_5f2i = None
def _get_struct_5f2i():
    global _struct_5f2i
    if _struct_5f2i is None:
        _struct_5f2i = struct.Struct("<5f2i")
    return _struct_5f2i
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
_struct_BI = None
def _get_struct_BI():
    global _struct_BI
    if _struct_BI is None:
        _struct_BI = struct.Struct("<BI")
    return _struct_BI
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
