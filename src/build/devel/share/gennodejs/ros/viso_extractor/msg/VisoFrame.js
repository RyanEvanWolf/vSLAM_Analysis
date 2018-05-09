// Auto-generated. Do not edit!

// (in-package viso_extractor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let pMatch = require('./pMatch.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class VisoFrame {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nMatches = null;
      this.nInliers = null;
      this.time = null;
      this.homography = null;
      this.matches = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('nMatches')) {
        this.nMatches = initObj.nMatches
      }
      else {
        this.nMatches = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('nInliers')) {
        this.nInliers = initObj.nInliers
      }
      else {
        this.nInliers = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('homography')) {
        this.homography = initObj.homography
      }
      else {
        this.homography = [];
      }
      if (initObj.hasOwnProperty('matches')) {
        this.matches = initObj.matches
      }
      else {
        this.matches = [];
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
    // Serializes a message object of type VisoFrame
    // Serialize message field [nMatches]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.nMatches, buffer, bufferOffset);
    // Serialize message field [nInliers]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.nInliers, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.time, buffer, bufferOffset);
    // Serialize message field [homography]
    bufferOffset = _arraySerializer.float64(obj.homography, buffer, bufferOffset, null);
    // Serialize message field [matches]
    // Serialize the length for message field [matches]
    bufferOffset = _serializer.uint32(obj.matches.length, buffer, bufferOffset);
    obj.matches.forEach((val) => {
      bufferOffset = pMatch.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VisoFrame
    let len;
    let data = new VisoFrame(null);
    // Deserialize message field [nMatches]
    data.nMatches = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [nInliers]
    data.nInliers = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [homography]
    data.homography = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [matches]
    // Deserialize array length for message field [matches]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.matches = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.matches[i] = pMatch.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.homography.length;
    length += 48 * object.matches.length;
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'viso_extractor/VisoFrame';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9fdd3a9666d1c582d73af55ae13305e2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
     std_msgs/Float32 nMatches
     std_msgs/Float32 nInliers
     std_msgs/Int32 time
     float64[] homography
     viso_extractor/pMatch[] matches
     bool success
    ================================================================================
    MSG: std_msgs/Float32
    float32 data
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    ================================================================================
    MSG: viso_extractor/pMatch
    std_msgs/Float32 u1p
    std_msgs/Float32 v1p
    std_msgs/Int32 i1p
    std_msgs/Float32 u2p
    std_msgs/Float32 v2p
    std_msgs/Int32 i2p
    std_msgs/Float32 u1c
    std_msgs/Float32 v1c
    std_msgs/Int32 i1c
    std_msgs/Float32 u2c
    std_msgs/Float32 v2c
    std_msgs/Int32 i2c
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VisoFrame(null);
    if (msg.nMatches !== undefined) {
      resolved.nMatches = std_msgs.msg.Float32.Resolve(msg.nMatches)
    }
    else {
      resolved.nMatches = new std_msgs.msg.Float32()
    }

    if (msg.nInliers !== undefined) {
      resolved.nInliers = std_msgs.msg.Float32.Resolve(msg.nInliers)
    }
    else {
      resolved.nInliers = new std_msgs.msg.Float32()
    }

    if (msg.time !== undefined) {
      resolved.time = std_msgs.msg.Int32.Resolve(msg.time)
    }
    else {
      resolved.time = new std_msgs.msg.Int32()
    }

    if (msg.homography !== undefined) {
      resolved.homography = msg.homography;
    }
    else {
      resolved.homography = []
    }

    if (msg.matches !== undefined) {
      resolved.matches = new Array(msg.matches.length);
      for (let i = 0; i < resolved.matches.length; ++i) {
        resolved.matches[i] = pMatch.Resolve(msg.matches[i]);
      }
    }
    else {
      resolved.matches = []
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

module.exports = VisoFrame;
