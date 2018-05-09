// Auto-generated. Do not edit!

// (in-package viso_extractor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class pMatch {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.u1p = null;
      this.v1p = null;
      this.i1p = null;
      this.u2p = null;
      this.v2p = null;
      this.i2p = null;
      this.u1c = null;
      this.v1c = null;
      this.i1c = null;
      this.u2c = null;
      this.v2c = null;
      this.i2c = null;
    }
    else {
      if (initObj.hasOwnProperty('u1p')) {
        this.u1p = initObj.u1p
      }
      else {
        this.u1p = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('v1p')) {
        this.v1p = initObj.v1p
      }
      else {
        this.v1p = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('i1p')) {
        this.i1p = initObj.i1p
      }
      else {
        this.i1p = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('u2p')) {
        this.u2p = initObj.u2p
      }
      else {
        this.u2p = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('v2p')) {
        this.v2p = initObj.v2p
      }
      else {
        this.v2p = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('i2p')) {
        this.i2p = initObj.i2p
      }
      else {
        this.i2p = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('u1c')) {
        this.u1c = initObj.u1c
      }
      else {
        this.u1c = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('v1c')) {
        this.v1c = initObj.v1c
      }
      else {
        this.v1c = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('i1c')) {
        this.i1c = initObj.i1c
      }
      else {
        this.i1c = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('u2c')) {
        this.u2c = initObj.u2c
      }
      else {
        this.u2c = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('v2c')) {
        this.v2c = initObj.v2c
      }
      else {
        this.v2c = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('i2c')) {
        this.i2c = initObj.i2c
      }
      else {
        this.i2c = new std_msgs.msg.Int32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pMatch
    // Serialize message field [u1p]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.u1p, buffer, bufferOffset);
    // Serialize message field [v1p]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.v1p, buffer, bufferOffset);
    // Serialize message field [i1p]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.i1p, buffer, bufferOffset);
    // Serialize message field [u2p]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.u2p, buffer, bufferOffset);
    // Serialize message field [v2p]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.v2p, buffer, bufferOffset);
    // Serialize message field [i2p]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.i2p, buffer, bufferOffset);
    // Serialize message field [u1c]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.u1c, buffer, bufferOffset);
    // Serialize message field [v1c]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.v1c, buffer, bufferOffset);
    // Serialize message field [i1c]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.i1c, buffer, bufferOffset);
    // Serialize message field [u2c]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.u2c, buffer, bufferOffset);
    // Serialize message field [v2c]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.v2c, buffer, bufferOffset);
    // Serialize message field [i2c]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.i2c, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pMatch
    let len;
    let data = new pMatch(null);
    // Deserialize message field [u1p]
    data.u1p = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [v1p]
    data.v1p = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [i1p]
    data.i1p = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [u2p]
    data.u2p = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [v2p]
    data.v2p = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [i2p]
    data.i2p = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [u1c]
    data.u1c = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [v1c]
    data.v1c = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [i1c]
    data.i1c = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [u2c]
    data.u2c = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [v2c]
    data.v2c = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [i2c]
    data.i2c = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'viso_extractor/pMatch';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '83f4f899dee21ad25ff19f486f6fe1c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    ================================================================================
    MSG: std_msgs/Float32
    float32 data
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
    const resolved = new pMatch(null);
    if (msg.u1p !== undefined) {
      resolved.u1p = std_msgs.msg.Float32.Resolve(msg.u1p)
    }
    else {
      resolved.u1p = new std_msgs.msg.Float32()
    }

    if (msg.v1p !== undefined) {
      resolved.v1p = std_msgs.msg.Float32.Resolve(msg.v1p)
    }
    else {
      resolved.v1p = new std_msgs.msg.Float32()
    }

    if (msg.i1p !== undefined) {
      resolved.i1p = std_msgs.msg.Int32.Resolve(msg.i1p)
    }
    else {
      resolved.i1p = new std_msgs.msg.Int32()
    }

    if (msg.u2p !== undefined) {
      resolved.u2p = std_msgs.msg.Float32.Resolve(msg.u2p)
    }
    else {
      resolved.u2p = new std_msgs.msg.Float32()
    }

    if (msg.v2p !== undefined) {
      resolved.v2p = std_msgs.msg.Float32.Resolve(msg.v2p)
    }
    else {
      resolved.v2p = new std_msgs.msg.Float32()
    }

    if (msg.i2p !== undefined) {
      resolved.i2p = std_msgs.msg.Int32.Resolve(msg.i2p)
    }
    else {
      resolved.i2p = new std_msgs.msg.Int32()
    }

    if (msg.u1c !== undefined) {
      resolved.u1c = std_msgs.msg.Float32.Resolve(msg.u1c)
    }
    else {
      resolved.u1c = new std_msgs.msg.Float32()
    }

    if (msg.v1c !== undefined) {
      resolved.v1c = std_msgs.msg.Float32.Resolve(msg.v1c)
    }
    else {
      resolved.v1c = new std_msgs.msg.Float32()
    }

    if (msg.i1c !== undefined) {
      resolved.i1c = std_msgs.msg.Int32.Resolve(msg.i1c)
    }
    else {
      resolved.i1c = new std_msgs.msg.Int32()
    }

    if (msg.u2c !== undefined) {
      resolved.u2c = std_msgs.msg.Float32.Resolve(msg.u2c)
    }
    else {
      resolved.u2c = new std_msgs.msg.Float32()
    }

    if (msg.v2c !== undefined) {
      resolved.v2c = std_msgs.msg.Float32.Resolve(msg.v2c)
    }
    else {
      resolved.v2c = new std_msgs.msg.Float32()
    }

    if (msg.i2c !== undefined) {
      resolved.i2c = std_msgs.msg.Int32.Resolve(msg.i2c)
    }
    else {
      resolved.i2c = new std_msgs.msg.Int32()
    }

    return resolved;
    }
};

module.exports = pMatch;
