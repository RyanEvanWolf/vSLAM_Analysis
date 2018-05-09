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
let kPoint = require('./kPoint.js');

//-----------------------------------------------------------

class loopStereoFrame {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.frame_id = null;
      this.curve_id = null;
      this.processingTime = null;
      this.leftFeatures = null;
      this.rightFeatures = null;
    }
    else {
      if (initObj.hasOwnProperty('frame_id')) {
        this.frame_id = initObj.frame_id
      }
      else {
        this.frame_id = 0;
      }
      if (initObj.hasOwnProperty('curve_id')) {
        this.curve_id = initObj.curve_id
      }
      else {
        this.curve_id = '';
      }
      if (initObj.hasOwnProperty('processingTime')) {
        this.processingTime = initObj.processingTime
      }
      else {
        this.processingTime = [];
      }
      if (initObj.hasOwnProperty('leftFeatures')) {
        this.leftFeatures = initObj.leftFeatures
      }
      else {
        this.leftFeatures = [];
      }
      if (initObj.hasOwnProperty('rightFeatures')) {
        this.rightFeatures = initObj.rightFeatures
      }
      else {
        this.rightFeatures = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type loopStereoFrame
    // Serialize message field [frame_id]
    bufferOffset = _serializer.int32(obj.frame_id, buffer, bufferOffset);
    // Serialize message field [curve_id]
    bufferOffset = _serializer.string(obj.curve_id, buffer, bufferOffset);
    // Serialize message field [processingTime]
    // Serialize the length for message field [processingTime]
    bufferOffset = _serializer.uint32(obj.processingTime.length, buffer, bufferOffset);
    obj.processingTime.forEach((val) => {
      bufferOffset = ProcTime.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [leftFeatures]
    // Serialize the length for message field [leftFeatures]
    bufferOffset = _serializer.uint32(obj.leftFeatures.length, buffer, bufferOffset);
    obj.leftFeatures.forEach((val) => {
      bufferOffset = kPoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [rightFeatures]
    // Serialize the length for message field [rightFeatures]
    bufferOffset = _serializer.uint32(obj.rightFeatures.length, buffer, bufferOffset);
    obj.rightFeatures.forEach((val) => {
      bufferOffset = kPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type loopStereoFrame
    let len;
    let data = new loopStereoFrame(null);
    // Deserialize message field [frame_id]
    data.frame_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [curve_id]
    data.curve_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [processingTime]
    // Deserialize array length for message field [processingTime]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.processingTime = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.processingTime[i] = ProcTime.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [leftFeatures]
    // Deserialize array length for message field [leftFeatures]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.leftFeatures = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.leftFeatures[i] = kPoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [rightFeatures]
    // Deserialize array length for message field [rightFeatures]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rightFeatures = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rightFeatures[i] = kPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.curve_id.length;
    object.processingTime.forEach((val) => {
      length += ProcTime.getMessageSize(val);
    });
    object.leftFeatures.forEach((val) => {
      length += kPoint.getMessageSize(val);
    });
    object.rightFeatures.forEach((val) => {
      length += kPoint.getMessageSize(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/loopStereoFrame';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a52e277306b94a230f130fabeb9b1a7a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 frame_id
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new loopStereoFrame(null);
    if (msg.frame_id !== undefined) {
      resolved.frame_id = msg.frame_id;
    }
    else {
      resolved.frame_id = 0
    }

    if (msg.curve_id !== undefined) {
      resolved.curve_id = msg.curve_id;
    }
    else {
      resolved.curve_id = ''
    }

    if (msg.processingTime !== undefined) {
      resolved.processingTime = new Array(msg.processingTime.length);
      for (let i = 0; i < resolved.processingTime.length; ++i) {
        resolved.processingTime[i] = ProcTime.Resolve(msg.processingTime[i]);
      }
    }
    else {
      resolved.processingTime = []
    }

    if (msg.leftFeatures !== undefined) {
      resolved.leftFeatures = new Array(msg.leftFeatures.length);
      for (let i = 0; i < resolved.leftFeatures.length; ++i) {
        resolved.leftFeatures[i] = kPoint.Resolve(msg.leftFeatures[i]);
      }
    }
    else {
      resolved.leftFeatures = []
    }

    if (msg.rightFeatures !== undefined) {
      resolved.rightFeatures = new Array(msg.rightFeatures.length);
      for (let i = 0; i < resolved.rightFeatures.length; ++i) {
        resolved.rightFeatures[i] = kPoint.Resolve(msg.rightFeatures[i]);
      }
    }
    else {
      resolved.rightFeatures = []
    }

    return resolved;
    }
};

module.exports = loopStereoFrame;
