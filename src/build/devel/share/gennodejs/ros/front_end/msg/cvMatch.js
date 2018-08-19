// Auto-generated. Do not edit!

// (in-package front_end.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class cvMatch {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.queryIdx = null;
      this.trainIdx = null;
      this.imgIdx = null;
      this.distance = null;
    }
    else {
      if (initObj.hasOwnProperty('queryIdx')) {
        this.queryIdx = initObj.queryIdx
      }
      else {
        this.queryIdx = 0;
      }
      if (initObj.hasOwnProperty('trainIdx')) {
        this.trainIdx = initObj.trainIdx
      }
      else {
        this.trainIdx = 0;
      }
      if (initObj.hasOwnProperty('imgIdx')) {
        this.imgIdx = initObj.imgIdx
      }
      else {
        this.imgIdx = 0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cvMatch
    // Serialize message field [queryIdx]
    bufferOffset = _serializer.uint32(obj.queryIdx, buffer, bufferOffset);
    // Serialize message field [trainIdx]
    bufferOffset = _serializer.uint32(obj.trainIdx, buffer, bufferOffset);
    // Serialize message field [imgIdx]
    bufferOffset = _serializer.uint32(obj.imgIdx, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cvMatch
    let len;
    let data = new cvMatch(null);
    // Deserialize message field [queryIdx]
    data.queryIdx = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [trainIdx]
    data.trainIdx = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [imgIdx]
    data.imgIdx = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/cvMatch';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c8d600ac557f1a63783116fb9567511';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 queryIdx
    uint32 trainIdx
    uint32 imgIdx
    float32 distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cvMatch(null);
    if (msg.queryIdx !== undefined) {
      resolved.queryIdx = msg.queryIdx;
    }
    else {
      resolved.queryIdx = 0
    }

    if (msg.trainIdx !== undefined) {
      resolved.trainIdx = msg.trainIdx;
    }
    else {
      resolved.trainIdx = 0
    }

    if (msg.imgIdx !== undefined) {
      resolved.imgIdx = msg.imgIdx;
    }
    else {
      resolved.imgIdx = 0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    return resolved;
    }
};

module.exports = cvMatch;
