// Auto-generated. Do not edit!

// (in-package front_end.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

let frameDetection = require('../msg/frameDetection.js');

//-----------------------------------------------------------

class singleImageDetectionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detID = null;
      this.returnKP = null;
      this.leftImg = null;
      this.rightImg = null;
    }
    else {
      if (initObj.hasOwnProperty('detID')) {
        this.detID = initObj.detID
      }
      else {
        this.detID = [];
      }
      if (initObj.hasOwnProperty('returnKP')) {
        this.returnKP = initObj.returnKP
      }
      else {
        this.returnKP = false;
      }
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type singleImageDetectionRequest
    // Serialize message field [detID]
    bufferOffset = _arraySerializer.string(obj.detID, buffer, bufferOffset, null);
    // Serialize message field [returnKP]
    bufferOffset = _serializer.bool(obj.returnKP, buffer, bufferOffset);
    // Serialize message field [leftImg]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftImg, buffer, bufferOffset);
    // Serialize message field [rightImg]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightImg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type singleImageDetectionRequest
    let len;
    let data = new singleImageDetectionRequest(null);
    // Deserialize message field [detID]
    data.detID = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [returnKP]
    data.returnKP = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [leftImg]
    data.leftImg = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightImg]
    data.rightImg = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.detID.forEach((val) => {
      length += 4 + val.length;
    });
    length += sensor_msgs.msg.Image.getMessageSize(object.leftImg);
    length += sensor_msgs.msg.Image.getMessageSize(object.rightImg);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/singleImageDetectionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a769e27b885c5f5c528a5bba8cc9e67c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] detID
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new singleImageDetectionRequest(null);
    if (msg.detID !== undefined) {
      resolved.detID = msg.detID;
    }
    else {
      resolved.detID = []
    }

    if (msg.returnKP !== undefined) {
      resolved.returnKP = msg.returnKP;
    }
    else {
      resolved.returnKP = false
    }

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

    return resolved;
    }
};

class singleImageDetectionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.outputFrames = null;
    }
    else {
      if (initObj.hasOwnProperty('outputFrames')) {
        this.outputFrames = initObj.outputFrames
      }
      else {
        this.outputFrames = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type singleImageDetectionResponse
    // Serialize message field [outputFrames]
    // Serialize the length for message field [outputFrames]
    bufferOffset = _serializer.uint32(obj.outputFrames.length, buffer, bufferOffset);
    obj.outputFrames.forEach((val) => {
      bufferOffset = frameDetection.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type singleImageDetectionResponse
    let len;
    let data = new singleImageDetectionResponse(null);
    // Deserialize message field [outputFrames]
    // Deserialize array length for message field [outputFrames]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.outputFrames = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.outputFrames[i] = frameDetection.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.outputFrames.forEach((val) => {
      length += frameDetection.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/singleImageDetectionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '818a37b3eec0230db61f52d78803c13e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/frameDetection[] outputFrames
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new singleImageDetectionResponse(null);
    if (msg.outputFrames !== undefined) {
      resolved.outputFrames = new Array(msg.outputFrames.length);
      for (let i = 0; i < resolved.outputFrames.length; ++i) {
        resolved.outputFrames[i] = frameDetection.Resolve(msg.outputFrames[i]);
      }
    }
    else {
      resolved.outputFrames = []
    }

    return resolved;
    }
};

module.exports = {
  Request: singleImageDetectionRequest,
  Response: singleImageDetectionResponse,
  md5sum() { return 'a394ddda8400e32e0cbdb38aaf30224b'; },
  datatype() { return 'front_end/singleImageDetection'; }
};
