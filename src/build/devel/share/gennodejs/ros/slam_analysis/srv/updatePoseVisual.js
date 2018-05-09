// Auto-generated. Do not edit!

// (in-package slam_analysis.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let plotFrame = require('../msg/plotFrame.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class updatePoseVisualRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.latest = null;
    }
    else {
      if (initObj.hasOwnProperty('latest')) {
        this.latest = initObj.latest
      }
      else {
        this.latest = new plotFrame();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type updatePoseVisualRequest
    // Serialize message field [latest]
    bufferOffset = plotFrame.serialize(obj.latest, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type updatePoseVisualRequest
    let len;
    let data = new updatePoseVisualRequest(null);
    // Deserialize message field [latest]
    data.latest = plotFrame.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += plotFrame.getMessageSize(object.latest);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'slam_analysis/updatePoseVisualRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c46665824f7184fd974e046eada6d32e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    slam_analysis/plotFrame latest
    
    ================================================================================
    MSG: slam_analysis/plotFrame
    front_end/Homography delta
    
    ================================================================================
    MSG: front_end/Homography
    float64[] data 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new updatePoseVisualRequest(null);
    if (msg.latest !== undefined) {
      resolved.latest = plotFrame.Resolve(msg.latest)
    }
    else {
      resolved.latest = new plotFrame()
    }

    return resolved;
    }
};

class updatePoseVisualResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type updatePoseVisualResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type updatePoseVisualResponse
    let len;
    let data = new updatePoseVisualResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'slam_analysis/updatePoseVisualResponse';
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
    const resolved = new updatePoseVisualResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: updatePoseVisualRequest,
  Response: updatePoseVisualResponse,
  md5sum() { return 'c46665824f7184fd974e046eada6d32e'; },
  datatype() { return 'slam_analysis/updatePoseVisual'; }
};
