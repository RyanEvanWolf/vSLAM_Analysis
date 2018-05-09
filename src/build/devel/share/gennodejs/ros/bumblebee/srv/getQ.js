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


//-----------------------------------------------------------

class getQRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getQRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getQRequest
    let len;
    let data = new getQRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bumblebee/getQRequest';
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
    const resolved = new getQRequest(null);
    return resolved;
    }
};

class getQResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Q = null;
    }
    else {
      if (initObj.hasOwnProperty('Q')) {
        this.Q = initObj.Q
      }
      else {
        this.Q = new Array(16).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getQResponse
    // Check that the constant length array field [Q] has the right length
    if (obj.Q.length !== 16) {
      throw new Error('Unable to serialize array field Q - length must be 16')
    }
    // Serialize message field [Q]
    bufferOffset = _arraySerializer.float64(obj.Q, buffer, bufferOffset, 16);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getQResponse
    let len;
    let data = new getQResponse(null);
    // Deserialize message field [Q]
    data.Q = _arrayDeserializer.float64(buffer, bufferOffset, 16)
    return data;
  }

  static getMessageSize(object) {
    return 128;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bumblebee/getQResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ac38f58782c00220a4ce872420ec2e93';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[16] Q
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new getQResponse(null);
    if (msg.Q !== undefined) {
      resolved.Q = msg.Q;
    }
    else {
      resolved.Q = new Array(16).fill(0)
    }

    return resolved;
    }
};

module.exports = {
  Request: getQRequest,
  Response: getQResponse,
  md5sum() { return 'ac38f58782c00220a4ce872420ec2e93'; },
  datatype() { return 'bumblebee/getQ'; }
};
