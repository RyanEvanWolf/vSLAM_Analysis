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

let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class getOffsetRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getOffsetRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getOffsetRequest
    let len;
    let data = new getOffsetRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bumblebee/getOffsetRequest';
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
    const resolved = new getOffsetRequest(null);
    return resolved;
    }
};

class getOffsetResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left = null;
      this.right = null;
    }
    else {
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = new sensor_msgs.msg.RegionOfInterest();
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = new sensor_msgs.msg.RegionOfInterest();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type getOffsetResponse
    // Serialize message field [left]
    bufferOffset = sensor_msgs.msg.RegionOfInterest.serialize(obj.left, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = sensor_msgs.msg.RegionOfInterest.serialize(obj.right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type getOffsetResponse
    let len;
    let data = new getOffsetResponse(null);
    // Deserialize message field [left]
    data.left = sensor_msgs.msg.RegionOfInterest.deserialize(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = sensor_msgs.msg.RegionOfInterest.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 34;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bumblebee/getOffsetResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0fde965a1b7161594fc69b01cf6bc87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/RegionOfInterest left
    sensor_msgs/RegionOfInterest right
    
    
    ================================================================================
    MSG: sensor_msgs/RegionOfInterest
    # This message is used to specify a region of interest within an image.
    #
    # When used to specify the ROI setting of the camera when the image was
    # taken, the height and width fields should either match the height and
    # width fields for the associated image; or height = width = 0
    # indicates that the full resolution image was captured.
    
    uint32 x_offset  # Leftmost pixel of the ROI
                     # (0 if the ROI includes the left edge of the image)
    uint32 y_offset  # Topmost pixel of the ROI
                     # (0 if the ROI includes the top edge of the image)
    uint32 height    # Height of ROI
    uint32 width     # Width of ROI
    
    # True if a distinct rectified ROI should be calculated from the "raw"
    # ROI in this message. Typically this should be False if the full image
    # is captured (ROI not used), and True if a subwindow is captured (ROI
    # used).
    bool do_rectify
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new getOffsetResponse(null);
    if (msg.left !== undefined) {
      resolved.left = sensor_msgs.msg.RegionOfInterest.Resolve(msg.left)
    }
    else {
      resolved.left = new sensor_msgs.msg.RegionOfInterest()
    }

    if (msg.right !== undefined) {
      resolved.right = sensor_msgs.msg.RegionOfInterest.Resolve(msg.right)
    }
    else {
      resolved.right = new sensor_msgs.msg.RegionOfInterest()
    }

    return resolved;
    }
};

module.exports = {
  Request: getOffsetRequest,
  Response: getOffsetResponse,
  md5sum() { return 'e0fde965a1b7161594fc69b01cf6bc87'; },
  datatype() { return 'bumblebee/getOffset'; }
};
