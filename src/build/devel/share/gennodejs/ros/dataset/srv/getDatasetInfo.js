// Auto-generated. Do not edit!

// (in-package dataset.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class getDatasetInfoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getDatasetInfoRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getDatasetInfoRequest
    let len;
    let data = new getDatasetInfoRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dataset/getDatasetInfoRequest';
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
    const resolved = new getDatasetInfoRequest(null);
    return resolved;
    }
};

class getDatasetInfoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rootFolder = null;
      this.currentIndex = null;
      this.imageName = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('rootFolder')) {
        this.rootFolder = initObj.rootFolder
      }
      else {
        this.rootFolder = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('currentIndex')) {
        this.currentIndex = initObj.currentIndex
      }
      else {
        this.currentIndex = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('imageName')) {
        this.imageName = initObj.imageName
      }
      else {
        this.imageName = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getDatasetInfoResponse
    // Serialize message field [rootFolder]
    bufferOffset = std_msgs.msg.String.serialize(obj.rootFolder, buffer, bufferOffset);
    // Serialize message field [currentIndex]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.currentIndex, buffer, bufferOffset);
    // Serialize message field [imageName]
    bufferOffset = std_msgs.msg.String.serialize(obj.imageName, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = std_msgs.msg.String.serialize(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getDatasetInfoResponse
    let len;
    let data = new getDatasetInfoResponse(null);
    // Deserialize message field [rootFolder]
    data.rootFolder = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [currentIndex]
    data.currentIndex = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [imageName]
    data.imageName = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.rootFolder);
    length += std_msgs.msg.String.getMessageSize(object.imageName);
    length += std_msgs.msg.String.getMessageSize(object.status);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dataset/getDatasetInfoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7e2ecfb328c516284c8b826e6c2925f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String rootFolder
    std_msgs/Int32 currentIndex
    std_msgs/String imageName
    std_msgs/String status
    
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new getDatasetInfoResponse(null);
    if (msg.rootFolder !== undefined) {
      resolved.rootFolder = std_msgs.msg.String.Resolve(msg.rootFolder)
    }
    else {
      resolved.rootFolder = new std_msgs.msg.String()
    }

    if (msg.currentIndex !== undefined) {
      resolved.currentIndex = std_msgs.msg.Int32.Resolve(msg.currentIndex)
    }
    else {
      resolved.currentIndex = new std_msgs.msg.Int32()
    }

    if (msg.imageName !== undefined) {
      resolved.imageName = std_msgs.msg.String.Resolve(msg.imageName)
    }
    else {
      resolved.imageName = new std_msgs.msg.String()
    }

    if (msg.status !== undefined) {
      resolved.status = std_msgs.msg.String.Resolve(msg.status)
    }
    else {
      resolved.status = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = {
  Request: getDatasetInfoRequest,
  Response: getDatasetInfoResponse,
  md5sum() { return 'a7e2ecfb328c516284c8b826e6c2925f'; },
  datatype() { return 'dataset/getDatasetInfo'; }
};
