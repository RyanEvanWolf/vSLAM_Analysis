// Auto-generated. Do not edit!

// (in-package front_end.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let cvMatch = require('./cvMatch.js');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class interFrameTracks {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tracks = null;
      this.motionInliers = null;
    }
    else {
      if (initObj.hasOwnProperty('tracks')) {
        this.tracks = initObj.tracks
      }
      else {
        this.tracks = [];
      }
      if (initObj.hasOwnProperty('motionInliers')) {
        this.motionInliers = initObj.motionInliers
      }
      else {
        this.motionInliers = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type interFrameTracks
    // Serialize message field [tracks]
    // Serialize the length for message field [tracks]
    bufferOffset = _serializer.uint32(obj.tracks.length, buffer, bufferOffset);
    obj.tracks.forEach((val) => {
      bufferOffset = cvMatch.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [motionInliers]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.motionInliers, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type interFrameTracks
    let len;
    let data = new interFrameTracks(null);
    // Deserialize message field [tracks]
    // Deserialize array length for message field [tracks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.tracks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.tracks[i] = cvMatch.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [motionInliers]
    data.motionInliers = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.tracks.length;
    length += sensor_msgs.msg.Image.getMessageSize(object.motionInliers);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'front_end/interFrameTracks';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '75c31d94db7747501fccc4f90c044a01';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    front_end/cvMatch[] tracks 
    sensor_msgs/Image motionInliers
    ================================================================================
    MSG: front_end/cvMatch
    uint32 queryIdx
    uint32 trainIdx
    uint32 imgIdx
    float32 distance
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new interFrameTracks(null);
    if (msg.tracks !== undefined) {
      resolved.tracks = new Array(msg.tracks.length);
      for (let i = 0; i < resolved.tracks.length; ++i) {
        resolved.tracks[i] = cvMatch.Resolve(msg.tracks[i]);
      }
    }
    else {
      resolved.tracks = []
    }

    if (msg.motionInliers !== undefined) {
      resolved.motionInliers = sensor_msgs.msg.Image.Resolve(msg.motionInliers)
    }
    else {
      resolved.motionInliers = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = interFrameTracks;
