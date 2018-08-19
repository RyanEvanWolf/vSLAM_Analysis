// Auto-generated. Do not edit!

// (in-package front_end.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let stereoFeatures = require('../msg/stereoFeatures.js');

//-----------------------------------------------------------

let stereoLandmarks = require('../msg/stereoLandmarks.js');

//-----------------------------------------------------------

class stereoMatchingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.frame = null;
    }
    else {
      if (initObj.hasOwnProperty('frame')) {
        this.frame = initObj.frame
      }
      else {
        this.frame = new stereoFeatures();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stereoMatchingRequest
    // Serialize message field [frame]
    bufferOffset = stereoFeatures.serialize(obj.frame, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stereoMatchingRequest
    let len;
    let data = new stereoMatchingRequest(null);
    // Deserialize message field [frame]
    data.frame = stereoFeatures.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += stereoFeatures.getMessageSize(object.frame);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/stereoMatchingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '284b7d85001d26e6bfff1aab83e09c47';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/stereoFeatures frame
    
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
    const resolved = new stereoMatchingRequest(null);
    if (msg.frame !== undefined) {
      resolved.frame = stereoFeatures.Resolve(msg.frame)
    }
    else {
      resolved.frame = new stereoFeatures()
    }

    return resolved;
    }
};

class stereoMatchingResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.out = null;
    }
    else {
      if (initObj.hasOwnProperty('out')) {
        this.out = initObj.out
      }
      else {
        this.out = new stereoLandmarks();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stereoMatchingResponse
    // Serialize message field [out]
    bufferOffset = stereoLandmarks.serialize(obj.out, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stereoMatchingResponse
    let len;
    let data = new stereoMatchingResponse(null);
    // Deserialize message field [out]
    data.out = stereoLandmarks.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += stereoLandmarks.getMessageSize(object.out);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'front_end/stereoMatchingResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7e0e882eba151cbac932207d6080ebea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/stereoLandmarks out
    
    
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
    const resolved = new stereoMatchingResponse(null);
    if (msg.out !== undefined) {
      resolved.out = stereoLandmarks.Resolve(msg.out)
    }
    else {
      resolved.out = new stereoLandmarks()
    }

    return resolved;
    }
};

module.exports = {
  Request: stereoMatchingRequest,
  Response: stereoMatchingResponse,
  md5sum() { return '75348319ccc3f979d087d64d783a5ddc'; },
  datatype() { return 'front_end/stereoMatching'; }
};
