// Auto-generated. Do not edit!

// (in-package bumblebee.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class getRectificationMapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.floatingPoint = null;
    }
    else {
      if (initObj.hasOwnProperty('floatingPoint')) {
        this.floatingPoint = initObj.floatingPoint
      }
      else {
        this.floatingPoint = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getRectificationMapRequest
    // Serialize message field [floatingPoint]
    bufferOffset = _serializer.bool(obj.floatingPoint, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getRectificationMapRequest
    let len;
    let data = new getRectificationMapRequest(null);
    // Deserialize message field [floatingPoint]
    data.floatingPoint = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bumblebee/getRectificationMapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '44275c614efeea013018e080d3646251';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool floatingPoint
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new getRectificationMapRequest(null);
    if (msg.floatingPoint !== undefined) {
      resolved.floatingPoint = msg.floatingPoint;
    }
    else {
      resolved.floatingPoint = false
    }

    return resolved;
    }
};

class getRectificationMapResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leftx = null;
      this.lefty = null;
      this.rightx = null;
      this.righty = null;
    }
    else {
      if (initObj.hasOwnProperty('leftx')) {
        this.leftx = initObj.leftx
      }
      else {
        this.leftx = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('lefty')) {
        this.lefty = initObj.lefty
      }
      else {
        this.lefty = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('rightx')) {
        this.rightx = initObj.rightx
      }
      else {
        this.rightx = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('righty')) {
        this.righty = initObj.righty
      }
      else {
        this.righty = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getRectificationMapResponse
    // Serialize message field [leftx]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftx, buffer, bufferOffset);
    // Serialize message field [lefty]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.lefty, buffer, bufferOffset);
    // Serialize message field [rightx]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightx, buffer, bufferOffset);
    // Serialize message field [righty]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.righty, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getRectificationMapResponse
    let len;
    let data = new getRectificationMapResponse(null);
    // Deserialize message field [leftx]
    data.leftx = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [lefty]
    data.lefty = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightx]
    data.rightx = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [righty]
    data.righty = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.leftx);
    length += sensor_msgs.msg.Image.getMessageSize(object.lefty);
    length += sensor_msgs.msg.Image.getMessageSize(object.rightx);
    length += sensor_msgs.msg.Image.getMessageSize(object.righty);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bumblebee/getRectificationMapResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '61b77bcd808e1ae9d3a770d188c70e85';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/Image leftx
    sensor_msgs/Image lefty
    sensor_msgs/Image rightx
    sensor_msgs/Image righty
    
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
    const resolved = new getRectificationMapResponse(null);
    if (msg.leftx !== undefined) {
      resolved.leftx = sensor_msgs.msg.Image.Resolve(msg.leftx)
    }
    else {
      resolved.leftx = new sensor_msgs.msg.Image()
    }

    if (msg.lefty !== undefined) {
      resolved.lefty = sensor_msgs.msg.Image.Resolve(msg.lefty)
    }
    else {
      resolved.lefty = new sensor_msgs.msg.Image()
    }

    if (msg.rightx !== undefined) {
      resolved.rightx = sensor_msgs.msg.Image.Resolve(msg.rightx)
    }
    else {
      resolved.rightx = new sensor_msgs.msg.Image()
    }

    if (msg.righty !== undefined) {
      resolved.righty = sensor_msgs.msg.Image.Resolve(msg.righty)
    }
    else {
      resolved.righty = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = {
  Request: getRectificationMapRequest,
  Response: getRectificationMapResponse,
  md5sum() { return 'dbd8732e5a390dbfdd19a82d4c0304e6'; },
  datatype() { return 'bumblebee/getRectificationMap'; }
};
