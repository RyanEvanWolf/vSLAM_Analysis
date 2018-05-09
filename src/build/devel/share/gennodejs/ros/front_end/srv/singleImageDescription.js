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
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

let Descriptors = require('../msg/Descriptors.js');

//-----------------------------------------------------------

class singleImageDescriptionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leftImg = null;
      this.rightImg = null;
      this.leftFeatures = null;
      this.rightFeatures = null;
    }
    else {
      if (initObj.hasOwnProperty('leftImg')) {
        this.leftImg = initObj.leftImg
      }
      else {
        this.leftImg = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('rightImg')) {
        this.rightImg = initObj.rightImg
      }
      else {
        this.rightImg = new sensor_msgs.msg.Image();
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
    // Serializes a message object of type singleImageDescriptionRequest
    // Serialize message field [leftImg]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftImg, buffer, bufferOffset);
    // Serialize message field [rightImg]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightImg, buffer, bufferOffset);
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
    //deserializes a message object of type singleImageDescriptionRequest
    let len;
    let data = new singleImageDescriptionRequest(null);
    // Deserialize message field [leftImg]
    data.leftImg = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightImg]
    data.rightImg = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
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
    length += sensor_msgs.msg.Image.getMessageSize(object.leftImg);
    length += sensor_msgs.msg.Image.getMessageSize(object.rightImg);
    object.leftFeatures.forEach((val) => {
      length += kPoint.getMessageSize(val);
    });
    object.rightFeatures.forEach((val) => {
      length += kPoint.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/singleImageDescriptionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9af793d1c0c37672812e4cfca22c7c72';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/Image leftImg
    sensor_msgs/Image rightImg
    front_end/kPoint[] leftFeatures
    front_end/kPoint[] rightFeatures
    
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
    MSG: front_end/kPoint
    float32 x
    float32 y
    float32 size
    float32 angle
    float32 response
    int32 octave
    int32 class_id
    sensor_msgs/Image[] descriptors
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new singleImageDescriptionRequest(null);
    if (msg.leftImg !== undefined) {
      resolved.leftImg = sensor_msgs.msg.Image.Resolve(msg.leftImg)
    }
    else {
      resolved.leftImg = new sensor_msgs.msg.Image()
    }

    if (msg.rightImg !== undefined) {
      resolved.rightImg = sensor_msgs.msg.Image.Resolve(msg.rightImg)
    }
    else {
      resolved.rightImg = new sensor_msgs.msg.Image()
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

class singleImageDescriptionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.results = null;
    }
    else {
      if (initObj.hasOwnProperty('results')) {
        this.results = initObj.results
      }
      else {
        this.results = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type singleImageDescriptionResponse
    // Serialize message field [results]
    // Serialize the length for message field [results]
    bufferOffset = _serializer.uint32(obj.results.length, buffer, bufferOffset);
    obj.results.forEach((val) => {
      bufferOffset = Descriptors.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type singleImageDescriptionResponse
    let len;
    let data = new singleImageDescriptionResponse(null);
    // Deserialize message field [results]
    // Deserialize array length for message field [results]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.results = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.results[i] = Descriptors.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.results.forEach((val) => {
      length += Descriptors.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/singleImageDescriptionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6b955fa86a83a3aabda93875e8ef9160';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/Descriptors[] results
    
    
    
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
    const resolved = new singleImageDescriptionResponse(null);
    if (msg.results !== undefined) {
      resolved.results = new Array(msg.results.length);
      for (let i = 0; i < resolved.results.length; ++i) {
        resolved.results[i] = Descriptors.Resolve(msg.results[i]);
      }
    }
    else {
      resolved.results = []
    }

    return resolved;
    }
};

module.exports = {
  Request: singleImageDescriptionRequest,
  Response: singleImageDescriptionResponse,
  md5sum() { return '7a7f06c16254c680957e38a3e6f8b450'; },
  datatype() { return 'front_end/singleImageDescription'; }
};
