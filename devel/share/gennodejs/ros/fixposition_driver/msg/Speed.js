// Auto-generated. Do not edit!

// (in-package fixposition_driver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Speed {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speeds = null;
    }
    else {
      if (initObj.hasOwnProperty('speeds')) {
        this.speeds = initObj.speeds
      }
      else {
        this.speeds = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Speed
    // Serialize message field [speeds]
    bufferOffset = _arraySerializer.int32(obj.speeds, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Speed
    let len;
    let data = new Speed(null);
    // Deserialize message field [speeds]
    data.speeds = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.speeds.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'fixposition_driver/Speed';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '00264f61d2b8d6e211424a49de9947b3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ####################################################################################################
    #
    #    Copyright (c) 2021  ___     ___
    #                       \\  \\  /  /
    #                        \\  \\/  /
    #                         /  /\\  \\
    #                        /__/  \\__\\  Fixposition AG
    #
    ####################################################################################################
    #
    # Wheel speed input to Fixposition ROS Driver
    #
    #
    ####################################################################################################
    
    # Velocity values in [mm/s] as integer 32bit
    # 2 Options:
    # Option 1: only one vehicle speed, then only fill a single value as the vehicle speed
    # Option 2: Fill in 4 Values of 4 wheels, in the order of FR, FL, RR, RL
    int32[] speeds
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Speed(null);
    if (msg.speeds !== undefined) {
      resolved.speeds = msg.speeds;
    }
    else {
      resolved.speeds = []
    }

    return resolved;
    }
};

module.exports = Speed;
