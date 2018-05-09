// Auto-generated. Do not edit!

// (in-package front_end.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ProcTime = require('./ProcTime.js');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class Descriptors {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.proc = null;
      this.descriptID = null;
      this.left_featureMask = null;
      this.right_featureMask = null;
      this.leftDescriptors = null;
      this.rightDescriptors = null;
    }
    else {
      if (initObj.hasOwnProperty('proc')) {
        this.proc = initObj.proc
      }
      else {
        this.proc = [];
      }
      if (initObj.hasOwnProperty('descriptID')) {
        this.descriptID = initObj.descriptID
      }
      else {
        this.descriptID = 0;
      }
      if (initObj.hasOwnProperty('left_featureMask')) {
        this.left_featureMask = initObj.left_featureMask
      }
      else {
        this.left_featureMask = [];
      }
      if (initObj.hasOwnProperty('right_featureMask')) {
        this.right_featureMask = initObj.right_featureMask
      }
      else {
        this.right_featureMask = [];
      }
      if (initObj.hasOwnProperty('leftDescriptors')) {
        this.leftDescriptors = initObj.leftDescriptors
      }
      else {
        this.leftDescriptors = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('rightDescriptors')) {
        this.rightDescriptors = initObj.rightDescriptors
      }
      else {
        this.rightDescriptors = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Descriptors
    // Serialize message field [proc]
    // Serialize the length for message field [proc]
    bufferOffset = _serializer.uint32(obj.proc.length, buffer, bufferOffset);
    obj.proc.forEach((val) => {
      bufferOffset = ProcTime.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [descriptID]
    bufferOffset = _serializer.int32(obj.descriptID, buffer, bufferOffset);
    // Serialize message field [left_featureMask]
    bufferOffset = _arraySerializer.int32(obj.left_featureMask, buffer, bufferOffset, null);
    // Serialize message field [right_featureMask]
    bufferOffset = _arraySerializer.int32(obj.right_featureMask, buffer, bufferOffset, null);
    // Serialize message field [leftDescriptors]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftDescriptors, buffer, bufferOffset);
    // Serialize message field [rightDescriptors]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightDescriptors, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Descriptors
    let len;
    let data = new Descriptors(null);
    // Deserialize message field [proc]
    // Deserialize array length for message field [proc]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.proc = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.proc[i] = ProcTime.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [descriptID]
    data.descriptID = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [left_featureMask]
    data.left_featureMask = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [right_featureMask]
    data.right_featureMask = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [leftDescriptors]
    data.leftDescriptors = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightDescriptors]
    data.rightDescriptors = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.proc.forEach((val) => {
      length += ProcTime.getMessageSize(val);
    });
    length += 4 * object.left_featureMask.length;
    length += 4 * object.right_featureMask.length;
    length += sensor_msgs.msg.Image.getMessageSize(object.leftDescriptors);
    length += sensor_msgs.msg.Image.getMessageSize(object.rightDescriptors);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/Descriptors';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eea05d4f348e83d7c6137f4b35cc7e3b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/ProcTime[] proc
    int32 descriptID
    int32[] left_featureMask
    int32[] right_featureMask
    sensor_msgs/Image leftDescriptors
    sensor_msgs/Image rightDescriptors
    
    ================================================================================
    MSG: front_end/ProcTime
    string label
    float64 seconds
    
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
    const resolved = new Descriptors(null);
    if (msg.proc !== undefined) {
      resolved.proc = new Array(msg.proc.length);
      for (let i = 0; i < resolved.proc.length; ++i) {
        resolved.proc[i] = ProcTime.Resolve(msg.proc[i]);
      }
    }
    else {
      resolved.proc = []
    }

    if (msg.descriptID !== undefined) {
      resolved.descriptID = msg.descriptID;
    }
    else {
      resolved.descriptID = 0
    }

    if (msg.left_featureMask !== undefined) {
      resolved.left_featureMask = msg.left_featureMask;
    }
    else {
      resolved.left_featureMask = []
    }

    if (msg.right_featureMask !== undefined) {
      resolved.right_featureMask = msg.right_featureMask;
    }
    else {
      resolved.right_featureMask = []
    }

    if (msg.leftDescriptors !== undefined) {
      resolved.leftDescriptors = sensor_msgs.msg.Image.Resolve(msg.leftDescriptors)
    }
    else {
      resolved.leftDescriptors = new sensor_msgs.msg.Image()
    }

    if (msg.rightDescriptors !== undefined) {
      resolved.rightDescriptors = sensor_msgs.msg.Image.Resolve(msg.rightDescriptors)
    }
    else {
      resolved.rightDescriptors = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = Descriptors;
