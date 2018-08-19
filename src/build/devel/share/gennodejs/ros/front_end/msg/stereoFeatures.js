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
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class stereoFeatures {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detID = null;
      this.descrID = null;
      this.leftFeatures = null;
      this.leftDescr = null;
      this.rightFeatures = null;
      this.rightDescr = null;
      this.proc = null;
    }
    else {
      if (initObj.hasOwnProperty('detID')) {
        this.detID = initObj.detID
      }
      else {
        this.detID = '';
      }
      if (initObj.hasOwnProperty('descrID')) {
        this.descrID = initObj.descrID
      }
      else {
        this.descrID = '';
      }
      if (initObj.hasOwnProperty('leftFeatures')) {
        this.leftFeatures = initObj.leftFeatures
      }
      else {
        this.leftFeatures = [];
      }
      if (initObj.hasOwnProperty('leftDescr')) {
        this.leftDescr = initObj.leftDescr
      }
      else {
        this.leftDescr = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('rightFeatures')) {
        this.rightFeatures = initObj.rightFeatures
      }
      else {
        this.rightFeatures = [];
      }
      if (initObj.hasOwnProperty('rightDescr')) {
        this.rightDescr = initObj.rightDescr
      }
      else {
        this.rightDescr = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('proc')) {
        this.proc = initObj.proc
      }
      else {
        this.proc = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stereoFeatures
    // Serialize message field [detID]
    bufferOffset = _serializer.string(obj.detID, buffer, bufferOffset);
    // Serialize message field [descrID]
    bufferOffset = _serializer.string(obj.descrID, buffer, bufferOffset);
    // Serialize message field [leftFeatures]
    // Serialize the length for message field [leftFeatures]
    bufferOffset = _serializer.uint32(obj.leftFeatures.length, buffer, bufferOffset);
    obj.leftFeatures.forEach((val) => {
      bufferOffset = kPoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [leftDescr]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftDescr, buffer, bufferOffset);
    // Serialize message field [rightFeatures]
    // Serialize the length for message field [rightFeatures]
    bufferOffset = _serializer.uint32(obj.rightFeatures.length, buffer, bufferOffset);
    obj.rightFeatures.forEach((val) => {
      bufferOffset = kPoint.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [rightDescr]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightDescr, buffer, bufferOffset);
    // Serialize message field [proc]
    // Serialize the length for message field [proc]
    bufferOffset = _serializer.uint32(obj.proc.length, buffer, bufferOffset);
    obj.proc.forEach((val) => {
      bufferOffset = ProcTime.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stereoFeatures
    let len;
    let data = new stereoFeatures(null);
    // Deserialize message field [detID]
    data.detID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [descrID]
    data.descrID = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [leftFeatures]
    // Deserialize array length for message field [leftFeatures]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.leftFeatures = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.leftFeatures[i] = kPoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [leftDescr]
    data.leftDescr = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightFeatures]
    // Deserialize array length for message field [rightFeatures]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rightFeatures = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rightFeatures[i] = kPoint.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [rightDescr]
    data.rightDescr = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [proc]
    // Deserialize array length for message field [proc]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.proc = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.proc[i] = ProcTime.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.detID.length;
    length += object.descrID.length;
    length += 28 * object.leftFeatures.length;
    length += sensor_msgs.msg.Image.getMessageSize(object.leftDescr);
    length += 28 * object.rightFeatures.length;
    length += sensor_msgs.msg.Image.getMessageSize(object.rightDescr);
    object.proc.forEach((val) => {
      length += ProcTime.getMessageSize(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/stereoFeatures';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '439c0a796b9dac5b9df565eba5ed914c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string detID
    string descrID
    front_end/kPoint[] leftFeatures
    sensor_msgs/Image leftDescr
    front_end/kPoint[] rightFeatures
    sensor_msgs/Image rightDescr
    front_end/ProcTime[] proc
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
    const resolved = new stereoFeatures(null);
    if (msg.detID !== undefined) {
      resolved.detID = msg.detID;
    }
    else {
      resolved.detID = ''
    }

    if (msg.descrID !== undefined) {
      resolved.descrID = msg.descrID;
    }
    else {
      resolved.descrID = ''
    }

    if (msg.leftFeatures !== undefined) {
      resolved.leftFeatures = new Array(msg.leftFeatures.length);
      for (let i = 0; i < resolved.leftFeatures.length; ++i) {
        resolved.leftFeatures[i] = kPoint.Resolve(msg.leftFeatures[i]);
      }
    }
    else {
      resolved.leftFeatures = []
    }

    if (msg.leftDescr !== undefined) {
      resolved.leftDescr = sensor_msgs.msg.Image.Resolve(msg.leftDescr)
    }
    else {
      resolved.leftDescr = new sensor_msgs.msg.Image()
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

    if (msg.rightDescr !== undefined) {
      resolved.rightDescr = sensor_msgs.msg.Image.Resolve(msg.rightDescr)
    }
    else {
      resolved.rightDescr = new sensor_msgs.msg.Image()
    }

    if (msg.proc !== undefined) {
      resolved.proc = new Array(msg.proc.length);
      for (let i = 0; i < resolved.proc.length; ++i) {
        resolved.proc[i] = ProcTime.Resolve(msg.proc[i]);
      }
    }
    else {
      resolved.proc = []
    }

    return resolved;
    }
};

module.exports = stereoFeatures;
