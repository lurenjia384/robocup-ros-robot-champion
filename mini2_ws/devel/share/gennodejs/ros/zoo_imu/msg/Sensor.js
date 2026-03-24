// Auto-generated. Do not edit!

// (in-package zoo_imu.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Sensor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ultra1 = null;
      this.ultra2 = null;
      this.ultra3 = null;
      this.ultra4 = null;
      this.grey_sensor = null;
      this.collision = null;
      this.voltage = null;
      this.current = null;
    }
    else {
      if (initObj.hasOwnProperty('ultra1')) {
        this.ultra1 = initObj.ultra1
      }
      else {
        this.ultra1 = 0;
      }
      if (initObj.hasOwnProperty('ultra2')) {
        this.ultra2 = initObj.ultra2
      }
      else {
        this.ultra2 = 0;
      }
      if (initObj.hasOwnProperty('ultra3')) {
        this.ultra3 = initObj.ultra3
      }
      else {
        this.ultra3 = 0;
      }
      if (initObj.hasOwnProperty('ultra4')) {
        this.ultra4 = initObj.ultra4
      }
      else {
        this.ultra4 = 0;
      }
      if (initObj.hasOwnProperty('grey_sensor')) {
        this.grey_sensor = initObj.grey_sensor
      }
      else {
        this.grey_sensor = 0;
      }
      if (initObj.hasOwnProperty('collision')) {
        this.collision = initObj.collision
      }
      else {
        this.collision = 0;
      }
      if (initObj.hasOwnProperty('voltage')) {
        this.voltage = initObj.voltage
      }
      else {
        this.voltage = 0;
      }
      if (initObj.hasOwnProperty('current')) {
        this.current = initObj.current
      }
      else {
        this.current = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sensor
    // Serialize message field [ultra1]
    bufferOffset = _serializer.int16(obj.ultra1, buffer, bufferOffset);
    // Serialize message field [ultra2]
    bufferOffset = _serializer.int16(obj.ultra2, buffer, bufferOffset);
    // Serialize message field [ultra3]
    bufferOffset = _serializer.int16(obj.ultra3, buffer, bufferOffset);
    // Serialize message field [ultra4]
    bufferOffset = _serializer.int16(obj.ultra4, buffer, bufferOffset);
    // Serialize message field [grey_sensor]
    bufferOffset = _serializer.int8(obj.grey_sensor, buffer, bufferOffset);
    // Serialize message field [collision]
    bufferOffset = _serializer.int8(obj.collision, buffer, bufferOffset);
    // Serialize message field [voltage]
    bufferOffset = _serializer.int16(obj.voltage, buffer, bufferOffset);
    // Serialize message field [current]
    bufferOffset = _serializer.int16(obj.current, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sensor
    let len;
    let data = new Sensor(null);
    // Deserialize message field [ultra1]
    data.ultra1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [ultra2]
    data.ultra2 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [ultra3]
    data.ultra3 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [ultra4]
    data.ultra4 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [grey_sensor]
    data.grey_sensor = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [collision]
    data.collision = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [voltage]
    data.voltage = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [current]
    data.current = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'zoo_imu/Sensor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ae4bc18611c4c4b13dc973d79b08faf4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 ultra1
    int16 ultra2
    int16 ultra3
    int16 ultra4
    int8 grey_sensor
    int8 collision
    int16 voltage
    int16 current
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sensor(null);
    if (msg.ultra1 !== undefined) {
      resolved.ultra1 = msg.ultra1;
    }
    else {
      resolved.ultra1 = 0
    }

    if (msg.ultra2 !== undefined) {
      resolved.ultra2 = msg.ultra2;
    }
    else {
      resolved.ultra2 = 0
    }

    if (msg.ultra3 !== undefined) {
      resolved.ultra3 = msg.ultra3;
    }
    else {
      resolved.ultra3 = 0
    }

    if (msg.ultra4 !== undefined) {
      resolved.ultra4 = msg.ultra4;
    }
    else {
      resolved.ultra4 = 0
    }

    if (msg.grey_sensor !== undefined) {
      resolved.grey_sensor = msg.grey_sensor;
    }
    else {
      resolved.grey_sensor = 0
    }

    if (msg.collision !== undefined) {
      resolved.collision = msg.collision;
    }
    else {
      resolved.collision = 0
    }

    if (msg.voltage !== undefined) {
      resolved.voltage = msg.voltage;
    }
    else {
      resolved.voltage = 0
    }

    if (msg.current !== undefined) {
      resolved.current = msg.current;
    }
    else {
      resolved.current = 0
    }

    return resolved;
    }
};

module.exports = Sensor;
