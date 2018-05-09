// Auto-generated. Do not edit!

// (in-package front_end.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let kPoint = require('../msg/kPoint.js');
let Descriptors = require('../msg/Descriptors.js');

//-----------------------------------------------------------

let ProcTime = require('../msg/ProcTime.js');

//-----------------------------------------------------------

class singleStereoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leftFeatures = null;
      this.rightFeatures = null;
      this.descriptors = null;
      this.inputSettings = null;
    }
    else {
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
      if (initObj.hasOwnProperty('descriptors')) {
        this.descriptors = initObj.descriptors
      }
      else {
        this.descriptors = [];
      }
      if (initObj.hasOwnProperty('inputSettings')) {
        this.inputSettings = initObj.inputSettings
      }
      else {
        this.inputSettings = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type singleStereoRequest
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
    // Serialize message field [descriptors]
    // Serialize the length for message field [descriptors]
    bufferOffset = _serializer.uint32(obj.descriptors.length, buffer, bufferOffset);
    obj.descriptors.forEach((val) => {
      bufferOffset = Descriptors.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [inputSettings]
    bufferOffset = _arraySerializer.string(obj.inputSettings, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type singleStereoRequest
    let len;
    let data = new singleStereoRequest(null);
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
    // Deserialize message field [descriptors]
    // Deserialize array length for message field [descriptors]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.descriptors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.descriptors[i] = Descriptors.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [inputSettings]
    data.inputSettings = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.leftFeatures.forEach((val) => {
      length += kPoint.getMessageSize(val);
    });
    object.rightFeatures.forEach((val) => {
      length += kPoint.getMessageSize(val);
    });
    object.descriptors.forEach((val) => {
      length += Descriptors.getMessageSize(val);
    });
    object.inputSettings.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/singleStereoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c0b3cfdc73e352d89b369240163a77d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/kPoint[] leftFeatures
    front_end/kPoint[] rightFeatures
    front_end/Descriptors[] descriptors
    string[] inputSettings
    
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
    
    ================================================================================
    MSG: front_end/Descriptors
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new singleStereoRequest(null);
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

    if (msg.descriptors !== undefined) {
      resolved.descriptors = new Array(msg.descriptors.length);
      for (let i = 0; i < resolved.descriptors.length; ++i) {
        resolved.descriptors[i] = Descriptors.Resolve(msg.descriptors[i]);
      }
    }
    else {
      resolved.descriptors = []
    }

    if (msg.inputSettings !== undefined) {
      resolved.inputSettings = msg.inputSettings;
    }
    else {
      resolved.inputSettings = []
    }

    return resolved;
    }
};

class singleStereoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.proc = null;
    }
    else {
      if (initObj.hasOwnProperty('proc')) {
        this.proc = initObj.proc
      }
      else {
        this.proc = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type singleStereoResponse
    // Serialize message field [proc]
    // Serialize the length for message field [proc]
    bufferOffset = _serializer.uint32(obj.proc.length, buffer, bufferOffset);
    obj.proc.forEach((val) => {
      bufferOffset = ProcTime.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type singleStereoResponse
    let len;
    let data = new singleStereoResponse(null);
    // Deserialize message field [proc]
    // Deserialize array length for message field [proc]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.proc = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.proc[i] = ProcTime.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.proc.forEach((val) => {
      length += ProcTime.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/singleStereoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd97239bdfa60b3aca4bdcfddeef334c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/ProcTime[] proc
    
    
    ================================================================================
    MSG: front_end/ProcTime
    string label
    float64 seconds
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new singleStereoResponse(null);
    if (msg.proc !== undefined) {
      resolved.proc = new Array(msg.proc.length);
      for (let i = 0; i < resolved.proc.length; ++i) {
        resolved.proc[i] = ProcTime.Resolve(msg.proc[i]);
      }
    }
    else {
      resolved.proc = []
    }

    return resolved;
    }
};

module.exports = {
  Request: singleStereoRequest,
  Response: singleStereoResponse,
  md5sum() { return 'ceff56939495f6592227196cef4aceff'; },
  datatype() { return 'front_end/singleStereo'; }
};
