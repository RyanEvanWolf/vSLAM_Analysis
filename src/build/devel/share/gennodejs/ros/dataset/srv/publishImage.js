// Auto-generated. Do not edit!

// (in-package dataset.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class publishImageRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type publishImageRequest
    // Serialize message field [command]
    bufferOffset = std_msgs.msg.String.serialize(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type publishImageRequest
    let len;
    let data = new publishImageRequest(null);
    // Deserialize message field [command]
    data.command = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.command);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dataset/publishImageRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b45d65857bb7a4d869afeb1d0e4bf0c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String command
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new publishImageRequest(null);
    if (msg.command !== undefined) {
      resolved.command = std_msgs.msg.String.Resolve(msg.command)
    }
    else {
      resolved.command = new std_msgs.msg.String()
    }

    return resolved;
    }
};

class publishImageResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.currentIndex = null;
      this.status = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('currentIndex')) {
        this.currentIndex = initObj.currentIndex
      }
      else {
        this.currentIndex = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type publishImageResponse
    // Serialize message field [currentIndex]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.currentIndex, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = std_msgs.msg.String.serialize(obj.status, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type publishImageResponse
    let len;
    let data = new publishImageResponse(null);
    // Deserialize message field [currentIndex]
    data.currentIndex = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.status);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dataset/publishImageResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1d761ace59782691b8bfaca7404d955';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Int32 currentIndex
    std_msgs/String status
    bool success
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new publishImageResponse(null);
    if (msg.currentIndex !== undefined) {
      resolved.currentIndex = std_msgs.msg.Int32.Resolve(msg.currentIndex)
    }
    else {
      resolved.currentIndex = new std_msgs.msg.Int32()
    }

    if (msg.status !== undefined) {
      resolved.status = std_msgs.msg.String.Resolve(msg.status)
    }
    else {
      resolved.status = new std_msgs.msg.String()
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: publishImageRequest,
  Response: publishImageResponse,
  md5sum() { return 'cdf090c379ad13ac3ab0237145174f96'; },
  datatype() { return 'dataset/publishImage'; }
};
