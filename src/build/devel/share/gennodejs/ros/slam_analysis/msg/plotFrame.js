// Auto-generated. Do not edit!

// (in-package slam_analysis.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let front_end = _finder('front_end');

//-----------------------------------------------------------

class plotFrame {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.delta = null;
    }
    else {
      if (initObj.hasOwnProperty('delta')) {
        this.delta = initObj.delta
      }
      else {
        this.delta = new front_end.msg.Homography();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type plotFrame
    // Serialize message field [delta]
    bufferOffset = front_end.msg.Homography.serialize(obj.delta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type plotFrame
    let len;
    let data = new plotFrame(null);
    // Deserialize message field [delta]
    data.delta = front_end.msg.Homography.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += front_end.msg.Homography.getMessageSize(object.delta);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'slam_analysis/plotFrame';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92c2da79f439e73ded798f48cae9cb47';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new plotFrame(null);
    if (msg.delta !== undefined) {
      resolved.delta = front_end.msg.Homography.Resolve(msg.delta)
    }
    else {
      resolved.delta = new front_end.msg.Homography()
    }

    return resolved;
    }
};

module.exports = plotFrame;
