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

let stereoFeatures = require('../msg/stereoFeatures.js');

//-----------------------------------------------------------

class getStereoFeaturesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detID = null;
      this.descrID = null;
      this.leftImg = null;
      this.rightImg = null;
    }
    else {
      if (initObj.hasOwnProperty('detID')) {
        this.detID = initObj.detID
      }
      else {
        this.detID = '';
      }
      if (initObj.hasOwnProperty('descrID')) {
        this.descrID = initObj.descrID
      }
      else {
        this.descrID = '';
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
    // Serializes a message object of type getStereoFeaturesRequest
    // Serialize message field [detID]
    bufferOffset = _serializer.string(obj.detID, buffer, bufferOffset);
    // Serialize message field [descrID]
    bufferOffset = _serializer.string(obj.descrID, buffer, bufferOffset);
    // Serialize message field [leftImg]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftImg, buffer, bufferOffset);
    // Serialize message field [rightImg]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightImg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getStereoFeaturesRequest
    let len;
    let data = new getStereoFeaturesRequest(null);
    // Deserialize message field [detID]
    data.detID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [descrID]
    data.descrID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [leftImg]
    data.leftImg = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightImg]
    data.rightImg = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.detID.length;
    length += object.descrID.length;
    length += sensor_msgs.msg.Image.getMessageSize(object.leftImg);
    length += sensor_msgs.msg.Image.getMessageSize(object.rightImg);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/getStereoFeaturesRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '692a8d2a1a46a455659bed19c2297ce9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string detID
    string descrID
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
    const resolved = new getStereoFeaturesRequest(null);
    if (msg.detID !== undefined) {
      resolved.detID = msg.detID;
    }
    else {
      resolved.detID = ''
    }

    if (msg.descrID !== undefined) {
      resolved.descrID = msg.descrID;
    }
    else {
      resolved.descrID = ''
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

class getStereoFeaturesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.latestFeatures = null;
    }
    else {
      if (initObj.hasOwnProperty('latestFeatures')) {
        this.latestFeatures = initObj.latestFeatures
      }
      else {
        this.latestFeatures = new stereoFeatures();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getStereoFeaturesResponse
    // Serialize message field [latestFeatures]
    bufferOffset = stereoFeatures.serialize(obj.latestFeatures, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getStereoFeaturesResponse
    let len;
    let data = new getStereoFeaturesResponse(null);
    // Deserialize message field [latestFeatures]
    data.latestFeatures = stereoFeatures.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += stereoFeatures.getMessageSize(object.latestFeatures);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/getStereoFeaturesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '94297117c6f01bdd6086f8fec226ddcc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/stereoFeatures latestFeatures
    
    
    ================================================================================
    MSG: front_end/stereoFeatures
    string detID
    string descrID
    front_end/kPoint[] leftFeatures
    sensor_msgs/Image leftDescr
    front_end/kPoint[] rightFeatures
    sensor_msgs/Image rightDescr
    front_end/ProcTime[] proc
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
    const resolved = new getStereoFeaturesResponse(null);
    if (msg.latestFeatures !== undefined) {
      resolved.latestFeatures = stereoFeatures.Resolve(msg.latestFeatures)
    }
    else {
      resolved.latestFeatures = new stereoFeatures()
    }

    return resolved;
    }
};

module.exports = {
  Request: getStereoFeaturesRequest,
  Response: getStereoFeaturesResponse,
  md5sum() { return '0a5f108044f2627eecc8992d4678dee9'; },
  datatype() { return 'front_end/getStereoFeatures'; }
};
