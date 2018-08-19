// Auto-generated. Do not edit!

// (in-package front_end.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let stereoLandmarks = require('../msg/stereoLandmarks.js');

//-----------------------------------------------------------

let windowStatus = require('../msg/windowStatus.js');

//-----------------------------------------------------------

class windowMatchingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reset = null;
      this.latestFrame = null;
    }
    else {
      if (initObj.hasOwnProperty('reset')) {
        this.reset = initObj.reset
      }
      else {
        this.reset = false;
      }
      if (initObj.hasOwnProperty('latestFrame')) {
        this.latestFrame = initObj.latestFrame
      }
      else {
        this.latestFrame = new stereoLandmarks();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type windowMatchingRequest
    // Serialize message field [reset]
    bufferOffset = _serializer.bool(obj.reset, buffer, bufferOffset);
    // Serialize message field [latestFrame]
    bufferOffset = stereoLandmarks.serialize(obj.latestFrame, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type windowMatchingRequest
    let len;
    let data = new windowMatchingRequest(null);
    // Deserialize message field [reset]
    data.reset = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [latestFrame]
    data.latestFrame = stereoLandmarks.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += stereoLandmarks.getMessageSize(object.latestFrame);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/windowMatchingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea7ad8af56c7f2fc4a46baca98c4a443';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool reset
    front_end/stereoLandmarks latestFrame
    
    ================================================================================
    MSG: front_end/stereoLandmarks
    string detID
    string descrID
    front_end/kPoint[] leftFeatures
    sensor_msgs/Image leftDescr
    front_end/kPoint[] rightFeatures
    sensor_msgs/Image rightDescr
    front_end/cvMatch[] matches
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
    MSG: front_end/cvMatch
    uint32 queryIdx
    uint32 trainIdx
    uint32 imgIdx
    float32 distance
    
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
    const resolved = new windowMatchingRequest(null);
    if (msg.reset !== undefined) {
      resolved.reset = msg.reset;
    }
    else {
      resolved.reset = false
    }

    if (msg.latestFrame !== undefined) {
      resolved.latestFrame = stereoLandmarks.Resolve(msg.latestFrame)
    }
    else {
      resolved.latestFrame = new stereoLandmarks()
    }

    return resolved;
    }
};

class windowMatchingResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new windowStatus();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type windowMatchingResponse
    // Serialize message field [state]
    bufferOffset = windowStatus.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type windowMatchingResponse
    let len;
    let data = new windowMatchingResponse(null);
    // Deserialize message field [state]
    data.state = windowStatus.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += windowStatus.getMessageSize(object.state);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/windowMatchingResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a3b7ef516a579e47bacc951e8b57dfe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/windowStatus state
    
    
    ================================================================================
    MSG: front_end/windowStatus
    front_end/stereoLandmarks[] msgs
    front_end/interFrameTracks[] tracks
    sensor_msgs/Image[] motion
    
    ================================================================================
    MSG: front_end/stereoLandmarks
    string detID
    string descrID
    front_end/kPoint[] leftFeatures
    sensor_msgs/Image leftDescr
    front_end/kPoint[] rightFeatures
    sensor_msgs/Image rightDescr
    front_end/cvMatch[] matches
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
    MSG: front_end/cvMatch
    uint32 queryIdx
    uint32 trainIdx
    uint32 imgIdx
    float32 distance
    
    ================================================================================
    MSG: front_end/ProcTime
    string label
    float64 seconds
    
    ================================================================================
    MSG: front_end/interFrameTracks
    front_end/cvMatch[] tracks 
    sensor_msgs/Image motionInliers
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new windowMatchingResponse(null);
    if (msg.state !== undefined) {
      resolved.state = windowStatus.Resolve(msg.state)
    }
    else {
      resolved.state = new windowStatus()
    }

    return resolved;
    }
};

module.exports = {
  Request: windowMatchingRequest,
  Response: windowMatchingResponse,
  md5sum() { return '470c2089accb6822fcb69d05c9fefb39'; },
  datatype() { return 'front_end/windowMatching'; }
};
