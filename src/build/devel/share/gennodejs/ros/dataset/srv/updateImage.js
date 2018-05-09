// Auto-generated. Do not edit!

// (in-package dataset.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class updateImageRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.windowName = null;
      this.newImage = null;
      this.display = null;
    }
    else {
      if (initObj.hasOwnProperty('windowName')) {
        this.windowName = initObj.windowName
      }
      else {
        this.windowName = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('newImage')) {
        this.newImage = initObj.newImage
      }
      else {
        this.newImage = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('display')) {
        this.display = initObj.display
      }
      else {
        this.display = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type updateImageRequest
    // Serialize message field [windowName]
    bufferOffset = std_msgs.msg.String.serialize(obj.windowName, buffer, bufferOffset);
    // Serialize message field [newImage]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.newImage, buffer, bufferOffset);
    // Serialize message field [display]
    bufferOffset = _serializer.bool(obj.display, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type updateImageRequest
    let len;
    let data = new updateImageRequest(null);
    // Deserialize message field [windowName]
    data.windowName = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [newImage]
    data.newImage = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [display]
    data.display = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.windowName);
    length += sensor_msgs.msg.Image.getMessageSize(object.newImage);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dataset/updateImageRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14086f831f7b9fc93a1aa90e9b41d9a6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String windowName
    sensor_msgs/Image newImage
    bool display
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
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
    const resolved = new updateImageRequest(null);
    if (msg.windowName !== undefined) {
      resolved.windowName = std_msgs.msg.String.Resolve(msg.windowName)
    }
    else {
      resolved.windowName = new std_msgs.msg.String()
    }

    if (msg.newImage !== undefined) {
      resolved.newImage = sensor_msgs.msg.Image.Resolve(msg.newImage)
    }
    else {
      resolved.newImage = new sensor_msgs.msg.Image()
    }

    if (msg.display !== undefined) {
      resolved.display = msg.display;
    }
    else {
      resolved.display = false
    }

    return resolved;
    }
};

class updateImageResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type updateImageResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type updateImageResponse
    let len;
    let data = new updateImageResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dataset/updateImageResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new updateImageResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: updateImageRequest,
  Response: updateImageResponse,
  md5sum() { return '14086f831f7b9fc93a1aa90e9b41d9a6'; },
  datatype() { return 'dataset/updateImage'; }
};
