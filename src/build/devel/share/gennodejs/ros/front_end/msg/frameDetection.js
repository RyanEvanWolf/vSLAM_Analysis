// Auto-generated. Do not edit!

// (in-package front_end.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let kPoint = require('./kPoint.js');
let ProcTime = require('./ProcTime.js');

//-----------------------------------------------------------

class frameDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leftFeatures = null;
      this.detID = null;
      this.nLeft = null;
      this.l_xAvg = null;
      this.l_yAvg = null;
      this.l_xStd = null;
      this.l_yStd = null;
      this.rightFeatures = null;
      this.nRight = null;
      this.r_xAvg = null;
      this.r_yAvg = null;
      this.r_xStd = null;
      this.r_yStd = null;
      this.processingTime = null;
    }
    else {
      if (initObj.hasOwnProperty('leftFeatures')) {
        this.leftFeatures = initObj.leftFeatures
      }
      else {
        this.leftFeatures = [];
      }
      if (initObj.hasOwnProperty('detID')) {
        this.detID = initObj.detID
      }
      else {
        this.detID = '';
      }
      if (initObj.hasOwnProperty('nLeft')) {
        this.nLeft = initObj.nLeft
      }
      else {
        this.nLeft = 0;
      }
      if (initObj.hasOwnProperty('l_xAvg')) {
        this.l_xAvg = initObj.l_xAvg
      }
      else {
        this.l_xAvg = 0.0;
      }
      if (initObj.hasOwnProperty('l_yAvg')) {
        this.l_yAvg = initObj.l_yAvg
      }
      else {
        this.l_yAvg = 0.0;
      }
      if (initObj.hasOwnProperty('l_xStd')) {
        this.l_xStd = initObj.l_xStd
      }
      else {
        this.l_xStd = 0.0;
      }
      if (initObj.hasOwnProperty('l_yStd')) {
        this.l_yStd = initObj.l_yStd
      }
      else {
        this.l_yStd = 0.0;
      }
      if (initObj.hasOwnProperty('rightFeatures')) {
        this.rightFeatures = initObj.rightFeatures
      }
      else {
        this.rightFeatures = [];
      }
      if (initObj.hasOwnProperty('nRight')) {
        this.nRight = initObj.nRight
      }
      else {
        this.nRight = 0;
      }
      if (initObj.hasOwnProperty('r_xAvg')) {
        this.r_xAvg = initObj.r_xAvg
      }
      else {
        this.r_xAvg = 0.0;
      }
      if (initObj.hasOwnProperty('r_yAvg')) {
        this.r_yAvg = initObj.r_yAvg
      }
      else {
        this.r_yAvg = 0.0;
      }
      if (initObj.hasOwnProperty('r_xStd')) {
        this.r_xStd = initObj.r_xStd
      }
      else {
        this.r_xStd = 0.0;
      }
      if (initObj.hasOwnProperty('r_yStd')) {
        this.r_yStd = initObj.r_yStd
      }
      else {
        this.r_yStd = 0.0;
      }
      if (initObj.hasOwnProperty('processingTime')) {
        this.processingTime = initObj.processingTime
      }
      else {
        this.processingTime = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type frameDetection
    // Serialize message field [leftFeatures]
    // Serialize the length for message field [leftFeatures]
    bufferOffset = _serializer.uint32(obj.leftFeatures.length, buffer, bufferOffset);
    obj.leftFeatures.forEach((val) => {
      bufferOffset = kPoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [detID]
    bufferOffset = _serializer.string(obj.detID, buffer, bufferOffset);
    // Serialize message field [nLeft]
    bufferOffset = _serializer.uint16(obj.nLeft, buffer, bufferOffset);
    // Serialize message field [l_xAvg]
    bufferOffset = _serializer.float32(obj.l_xAvg, buffer, bufferOffset);
    // Serialize message field [l_yAvg]
    bufferOffset = _serializer.float32(obj.l_yAvg, buffer, bufferOffset);
    // Serialize message field [l_xStd]
    bufferOffset = _serializer.float32(obj.l_xStd, buffer, bufferOffset);
    // Serialize message field [l_yStd]
    bufferOffset = _serializer.float32(obj.l_yStd, buffer, bufferOffset);
    // Serialize message field [rightFeatures]
    // Serialize the length for message field [rightFeatures]
    bufferOffset = _serializer.uint32(obj.rightFeatures.length, buffer, bufferOffset);
    obj.rightFeatures.forEach((val) => {
      bufferOffset = kPoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [nRight]
    bufferOffset = _serializer.uint16(obj.nRight, buffer, bufferOffset);
    // Serialize message field [r_xAvg]
    bufferOffset = _serializer.float32(obj.r_xAvg, buffer, bufferOffset);
    // Serialize message field [r_yAvg]
    bufferOffset = _serializer.float32(obj.r_yAvg, buffer, bufferOffset);
    // Serialize message field [r_xStd]
    bufferOffset = _serializer.float32(obj.r_xStd, buffer, bufferOffset);
    // Serialize message field [r_yStd]
    bufferOffset = _serializer.float32(obj.r_yStd, buffer, bufferOffset);
    // Serialize message field [processingTime]
    // Serialize the length for message field [processingTime]
    bufferOffset = _serializer.uint32(obj.processingTime.length, buffer, bufferOffset);
    obj.processingTime.forEach((val) => {
      bufferOffset = ProcTime.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type frameDetection
    let len;
    let data = new frameDetection(null);
    // Deserialize message field [leftFeatures]
    // Deserialize array length for message field [leftFeatures]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.leftFeatures = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.leftFeatures[i] = kPoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [detID]
    data.detID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [nLeft]
    data.nLeft = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [l_xAvg]
    data.l_xAvg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [l_yAvg]
    data.l_yAvg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [l_xStd]
    data.l_xStd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [l_yStd]
    data.l_yStd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rightFeatures]
    // Deserialize array length for message field [rightFeatures]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rightFeatures = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rightFeatures[i] = kPoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [nRight]
    data.nRight = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [r_xAvg]
    data.r_xAvg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [r_yAvg]
    data.r_yAvg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [r_xStd]
    data.r_xStd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [r_yStd]
    data.r_yStd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [processingTime]
    // Deserialize array length for message field [processingTime]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.processingTime = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.processingTime[i] = ProcTime.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 28 * object.leftFeatures.length;
    length += object.detID.length;
    length += 28 * object.rightFeatures.length;
    object.processingTime.forEach((val) => {
      length += ProcTime.getMessageSize(val);
    });
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/frameDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c89ff5835b42d14d6becea0d41610e82';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/kPoint[] leftFeatures
    string detID
    uint16 nLeft
    float32 l_xAvg
    float32 l_yAvg
    float32 l_xStd
    float32 l_yStd
    front_end/kPoint[] rightFeatures
    uint16 nRight
    float32 r_xAvg
    float32 r_yAvg
    float32 r_xStd
    float32 r_yStd
    front_end/ProcTime[] processingTime 
    
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
    const resolved = new frameDetection(null);
    if (msg.leftFeatures !== undefined) {
      resolved.leftFeatures = new Array(msg.leftFeatures.length);
      for (let i = 0; i < resolved.leftFeatures.length; ++i) {
        resolved.leftFeatures[i] = kPoint.Resolve(msg.leftFeatures[i]);
      }
    }
    else {
      resolved.leftFeatures = []
    }

    if (msg.detID !== undefined) {
      resolved.detID = msg.detID;
    }
    else {
      resolved.detID = ''
    }

    if (msg.nLeft !== undefined) {
      resolved.nLeft = msg.nLeft;
    }
    else {
      resolved.nLeft = 0
    }

    if (msg.l_xAvg !== undefined) {
      resolved.l_xAvg = msg.l_xAvg;
    }
    else {
      resolved.l_xAvg = 0.0
    }

    if (msg.l_yAvg !== undefined) {
      resolved.l_yAvg = msg.l_yAvg;
    }
    else {
      resolved.l_yAvg = 0.0
    }

    if (msg.l_xStd !== undefined) {
      resolved.l_xStd = msg.l_xStd;
    }
    else {
      resolved.l_xStd = 0.0
    }

    if (msg.l_yStd !== undefined) {
      resolved.l_yStd = msg.l_yStd;
    }
    else {
      resolved.l_yStd = 0.0
    }

    if (msg.rightFeatures !== undefined) {
      resolved.rightFeatures = new Array(msg.rightFeatures.length);
      for (let i = 0; i < resolved.rightFeatures.length; ++i) {
        resolved.rightFeatures[i] = kPoint.Resolve(msg.rightFeatures[i]);
      }
    }
    else {
      resolved.rightFeatures = []
    }

    if (msg.nRight !== undefined) {
      resolved.nRight = msg.nRight;
    }
    else {
      resolved.nRight = 0
    }

    if (msg.r_xAvg !== undefined) {
      resolved.r_xAvg = msg.r_xAvg;
    }
    else {
      resolved.r_xAvg = 0.0
    }

    if (msg.r_yAvg !== undefined) {
      resolved.r_yAvg = msg.r_yAvg;
    }
    else {
      resolved.r_yAvg = 0.0
    }

    if (msg.r_xStd !== undefined) {
      resolved.r_xStd = msg.r_xStd;
    }
    else {
      resolved.r_xStd = 0.0
    }

    if (msg.r_yStd !== undefined) {
      resolved.r_yStd = msg.r_yStd;
    }
    else {
      resolved.r_yStd = 0.0
    }

    if (msg.processingTime !== undefined) {
      resolved.processingTime = new Array(msg.processingTime.length);
      for (let i = 0; i < resolved.processingTime.length; ++i) {
        resolved.processingTime[i] = ProcTime.Resolve(msg.processingTime[i]);
      }
    }
    else {
      resolved.processingTime = []
    }

    return resolved;
    }
};

module.exports = frameDetection;
