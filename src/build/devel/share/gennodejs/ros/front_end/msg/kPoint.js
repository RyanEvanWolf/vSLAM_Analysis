// Auto-generated. Do not edit!

// (in-package front_end.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class kPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.size = null;
      this.angle = null;
      this.response = null;
      this.octave = null;
      this.class_id = null;
      this.descriptors = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0.0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = 0.0;
      }
      if (initObj.hasOwnProperty('octave')) {
        this.octave = initObj.octave
      }
      else {
        this.octave = 0;
      }
      if (initObj.hasOwnProperty('class_id')) {
        this.class_id = initObj.class_id
      }
      else {
        this.class_id = 0;
      }
      if (initObj.hasOwnProperty('descriptors')) {
        this.descriptors = initObj.descriptors
      }
      else {
        this.descriptors = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type kPoint
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = _serializer.float32(obj.size, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    // Serialize message field [response]
    bufferOffset = _serializer.float32(obj.response, buffer, bufferOffset);
    // Serialize message field [octave]
    bufferOffset = _serializer.int32(obj.octave, buffer, bufferOffset);
    // Serialize message field [class_id]
    bufferOffset = _serializer.int32(obj.class_id, buffer, bufferOffset);
    // Serialize message field [descriptors]
    // Serialize the length for message field [descriptors]
    bufferOffset = _serializer.uint32(obj.descriptors.length, buffer, bufferOffset);
    obj.descriptors.forEach((val) => {
      bufferOffset = sensor_msgs.msg.Image.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type kPoint
    let len;
    let data = new kPoint(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [response]
    data.response = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [octave]
    data.octave = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [class_id]
    data.class_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [descriptors]
    // Deserialize array length for message field [descriptors]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.descriptors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.descriptors[i] = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.descriptors.forEach((val) => {
      length += sensor_msgs.msg.Image.getMessageSize(val);
    });
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/kPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '42809bfff6ca27b1c8dd8bc19c75a12c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new kPoint(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0.0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = 0.0
    }

    if (msg.octave !== undefined) {
      resolved.octave = msg.octave;
    }
    else {
      resolved.octave = 0
    }

    if (msg.class_id !== undefined) {
      resolved.class_id = msg.class_id;
    }
    else {
      resolved.class_id = 0
    }

    if (msg.descriptors !== undefined) {
      resolved.descriptors = new Array(msg.descriptors.length);
      for (let i = 0; i < resolved.descriptors.length; ++i) {
        resolved.descriptors[i] = sensor_msgs.msg.Image.Resolve(msg.descriptors[i]);
      }
    }
    else {
      resolved.descriptors = []
    }

    return resolved;
    }
};

module.exports = kPoint;
