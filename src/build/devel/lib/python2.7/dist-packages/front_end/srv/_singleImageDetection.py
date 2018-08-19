# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from front_end/singleImageDetectionRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg
import sensor_msgs.msg

class singleImageDetectionRequest(genpy.Message):
  _md5sum = "a769e27b885c5f5c528a5bba8cc9e67c"
  _type = "front_end/singleImageDetectionRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string[] detID
bool returnKP
sensor_msgs/Image leftImg
sensor_msgs/Image rightImg

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
  __slots__ = ['detID','returnKP','leftImg','rightImg']
  _slot_types = ['string[]','bool','sensor_msgs/Image','sensor_msgs/Image']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       detID,returnKP,leftImg,rightImg

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(singleImageDetectionRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.detID is None:
        self.detID = []
      if self.returnKP is None:
        self.returnKP = False
      if self.leftImg is None:
        self.leftImg = sensor_msgs.msg.Image()
      if self.rightImg is None:
        self.rightImg = sensor_msgs.msg.Image()
    else:
      self.detID = []
      self.returnKP = False
      self.leftImg = sensor_msgs.msg.Image()
      self.rightImg = sensor_msgs.msg.Image()

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
      length = len(self.detID)
      buff.write(_struct_I.pack(length))
      for val1 in self.detID:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      _x = self
      buff.write(_get_struct_B3I().pack(_x.returnKP, _x.leftImg.header.seq, _x.leftImg.header.stamp.secs, _x.leftImg.header.stamp.nsecs))
      _x = self.leftImg.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.leftImg.height, _x.leftImg.width))
      _x = self.leftImg.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.leftImg.is_bigendian, _x.leftImg.step))
      _x = self.leftImg.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.rightImg.header.seq, _x.rightImg.header.stamp.secs, _x.rightImg.header.stamp.nsecs))
      _x = self.rightImg.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.rightImg.height, _x.rightImg.width))
      _x = self.rightImg.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.rightImg.is_bigendian, _x.rightImg.step))
      _x = self.rightImg.data
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
      if self.leftImg is None:
        self.leftImg = sensor_msgs.msg.Image()
      if self.rightImg is None:
        self.rightImg = sensor_msgs.msg.Image()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.detID = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.detID.append(val1)
      _x = self
      start = end
      end += 13
      (_x.returnKP, _x.leftImg.header.seq, _x.leftImg.header.stamp.secs, _x.leftImg.header.stamp.nsecs,) = _get_struct_B3I().unpack(str[start:end])
      self.returnKP = bool(self.returnKP)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.leftImg.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.leftImg.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.leftImg.height, _x.leftImg.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.leftImg.encoding = str[start:end].decode('utf-8')
      else:
        self.leftImg.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.leftImg.is_bigendian, _x.leftImg.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.leftImg.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.rightImg.header.seq, _x.rightImg.header.stamp.secs, _x.rightImg.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.rightImg.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.rightImg.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.rightImg.height, _x.rightImg.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.rightImg.encoding = str[start:end].decode('utf-8')
      else:
        self.rightImg.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.rightImg.is_bigendian, _x.rightImg.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.rightImg.data = str[start:end]
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
      length = len(self.detID)
      buff.write(_struct_I.pack(length))
      for val1 in self.detID:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      _x = self
      buff.write(_get_struct_B3I().pack(_x.returnKP, _x.leftImg.header.seq, _x.leftImg.header.stamp.secs, _x.leftImg.header.stamp.nsecs))
      _x = self.leftImg.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.leftImg.height, _x.leftImg.width))
      _x = self.leftImg.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.leftImg.is_bigendian, _x.leftImg.step))
      _x = self.leftImg.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.rightImg.header.seq, _x.rightImg.header.stamp.secs, _x.rightImg.header.stamp.nsecs))
      _x = self.rightImg.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.rightImg.height, _x.rightImg.width))
      _x = self.rightImg.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.rightImg.is_bigendian, _x.rightImg.step))
      _x = self.rightImg.data
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
      if self.leftImg is None:
        self.leftImg = sensor_msgs.msg.Image()
      if self.rightImg is None:
        self.rightImg = sensor_msgs.msg.Image()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.detID = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.detID.append(val1)
      _x = self
      start = end
      end += 13
      (_x.returnKP, _x.leftImg.header.seq, _x.leftImg.header.stamp.secs, _x.leftImg.header.stamp.nsecs,) = _get_struct_B3I().unpack(str[start:end])
      self.returnKP = bool(self.returnKP)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.leftImg.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.leftImg.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.leftImg.height, _x.leftImg.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.leftImg.encoding = str[start:end].decode('utf-8')
      else:
        self.leftImg.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.leftImg.is_bigendian, _x.leftImg.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.leftImg.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.rightImg.header.seq, _x.rightImg.header.stamp.secs, _x.rightImg.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.rightImg.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.rightImg.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.rightImg.height, _x.rightImg.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.rightImg.encoding = str[start:end].decode('utf-8')
      else:
        self.rightImg.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.rightImg.is_bigendian, _x.rightImg.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.rightImg.data = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_BI = None
def _get_struct_BI():
    global _struct_BI
    if _struct_BI is None:
        _struct_BI = struct.Struct("<BI")
    return _struct_BI
_struct_B3I = None
def _get_struct_B3I():
    global _struct_B3I
    if _struct_B3I is None:
        _struct_B3I = struct.Struct("<B3I")
    return _struct_B3I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from front_end/singleImageDetectionResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import front_end.msg

class singleImageDetectionResponse(genpy.Message):
  _md5sum = "818a37b3eec0230db61f52d78803c13e"
  _type = "front_end/singleImageDetectionResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """front_end/frameDetection[] outputFrames


================================================================================
MSG: front_end/frameDetection
front_end/kPoint[] leftFeatures
string detID
uint16 nLeft
float32 l_xAvg
float32 l_yAvg
float32 l_xStd
float32 l_yStd
front_end/kPoint[] rightFeatures
uint16 nRight
float32 r_xAvg
float32 r_yAvg
float32 r_xStd
float32 r_yStd
front_end/ProcTime[] processingTime 

================================================================================
MSG: front_end/kPoint
float32 x
float32 y
float32 size
float32 angle
float32 response
int32 octave
int32 class_id

================================================================================
MSG: front_end/ProcTime
string label
float64 seconds
"""
  __slots__ = ['outputFrames']
  _slot_types = ['front_end/frameDetection[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       outputFrames

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(singleImageDetectionResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.outputFrames is None:
        self.outputFrames = []
    else:
      self.outputFrames = []

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
      length = len(self.outputFrames)
      buff.write(_struct_I.pack(length))
      for val1 in self.outputFrames:
        length = len(val1.leftFeatures)
        buff.write(_struct_I.pack(length))
        for val2 in val1.leftFeatures:
          _x = val2
          buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        _x = val1.detID
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.pack('<I%ss'%length, length, _x))
        _x = val1
        buff.write(_get_struct_H4f().pack(_x.nLeft, _x.l_xAvg, _x.l_yAvg, _x.l_xStd, _x.l_yStd))
        length = len(val1.rightFeatures)
        buff.write(_struct_I.pack(length))
        for val2 in val1.rightFeatures:
          _x = val2
          buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        _x = val1
        buff.write(_get_struct_H4f().pack(_x.nRight, _x.r_xAvg, _x.r_yAvg, _x.r_xStd, _x.r_yStd))
        length = len(val1.processingTime)
        buff.write(_struct_I.pack(length))
        for val2 in val1.processingTime:
          _x = val2.label
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          buff.write(_get_struct_d().pack(val2.seconds))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.outputFrames is None:
        self.outputFrames = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.outputFrames = []
      for i in range(0, length):
        val1 = front_end.msg.frameDetection()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.leftFeatures = []
        for i in range(0, length):
          val2 = front_end.msg.kPoint()
          _x = val2
          start = end
          end += 28
          (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
          val1.leftFeatures.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.detID = str[start:end].decode('utf-8')
        else:
          val1.detID = str[start:end]
        _x = val1
        start = end
        end += 18
        (_x.nLeft, _x.l_xAvg, _x.l_yAvg, _x.l_xStd, _x.l_yStd,) = _get_struct_H4f().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.rightFeatures = []
        for i in range(0, length):
          val2 = front_end.msg.kPoint()
          _x = val2
          start = end
          end += 28
          (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
          val1.rightFeatures.append(val2)
        _x = val1
        start = end
        end += 18
        (_x.nRight, _x.r_xAvg, _x.r_yAvg, _x.r_xStd, _x.r_yStd,) = _get_struct_H4f().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.processingTime = []
        for i in range(0, length):
          val2 = front_end.msg.ProcTime()
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2.label = str[start:end].decode('utf-8')
          else:
            val2.label = str[start:end]
          start = end
          end += 8
          (val2.seconds,) = _get_struct_d().unpack(str[start:end])
          val1.processingTime.append(val2)
        self.outputFrames.append(val1)
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
      length = len(self.outputFrames)
      buff.write(_struct_I.pack(length))
      for val1 in self.outputFrames:
        length = len(val1.leftFeatures)
        buff.write(_struct_I.pack(length))
        for val2 in val1.leftFeatures:
          _x = val2
          buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        _x = val1.detID
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.pack('<I%ss'%length, length, _x))
        _x = val1
        buff.write(_get_struct_H4f().pack(_x.nLeft, _x.l_xAvg, _x.l_yAvg, _x.l_xStd, _x.l_yStd))
        length = len(val1.rightFeatures)
        buff.write(_struct_I.pack(length))
        for val2 in val1.rightFeatures:
          _x = val2
          buff.write(_get_struct_5f2i().pack(_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id))
        _x = val1
        buff.write(_get_struct_H4f().pack(_x.nRight, _x.r_xAvg, _x.r_yAvg, _x.r_xStd, _x.r_yStd))
        length = len(val1.processingTime)
        buff.write(_struct_I.pack(length))
        for val2 in val1.processingTime:
          _x = val2.label
          length = len(_x)
          if python3 or type(_x) == unicode:
            _x = _x.encode('utf-8')
            length = len(_x)
          buff.write(struct.pack('<I%ss'%length, length, _x))
          buff.write(_get_struct_d().pack(val2.seconds))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.outputFrames is None:
        self.outputFrames = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.outputFrames = []
      for i in range(0, length):
        val1 = front_end.msg.frameDetection()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.leftFeatures = []
        for i in range(0, length):
          val2 = front_end.msg.kPoint()
          _x = val2
          start = end
          end += 28
          (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
          val1.leftFeatures.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.detID = str[start:end].decode('utf-8')
        else:
          val1.detID = str[start:end]
        _x = val1
        start = end
        end += 18
        (_x.nLeft, _x.l_xAvg, _x.l_yAvg, _x.l_xStd, _x.l_yStd,) = _get_struct_H4f().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.rightFeatures = []
        for i in range(0, length):
          val2 = front_end.msg.kPoint()
          _x = val2
          start = end
          end += 28
          (_x.x, _x.y, _x.size, _x.angle, _x.response, _x.octave, _x.class_id,) = _get_struct_5f2i().unpack(str[start:end])
          val1.rightFeatures.append(val2)
        _x = val1
        start = end
        end += 18
        (_x.nRight, _x.r_xAvg, _x.r_yAvg, _x.r_xStd, _x.r_yStd,) = _get_struct_H4f().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.processingTime = []
        for i in range(0, length):
          val2 = front_end.msg.ProcTime()
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2.label = str[start:end].decode('utf-8')
          else:
            val2.label = str[start:end]
          start = end
          end += 8
          (val2.seconds,) = _get_struct_d().unpack(str[start:end])
          val1.processingTime.append(val2)
        self.outputFrames.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_H4f = None
def _get_struct_H4f():
    global _struct_H4f
    if _struct_H4f is None:
        _struct_H4f = struct.Struct("<H4f")
    return _struct_H4f
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
class singleImageDetection(object):
  _type          = 'front_end/singleImageDetection'
  _md5sum = 'a394ddda8400e32e0cbdb38aaf30224b'
  _request_class  = singleImageDetectionRequest
  _response_class = singleImageDetectionResponse
