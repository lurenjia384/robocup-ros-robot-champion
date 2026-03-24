// Auto-generated. Do not edit!

// (in-package zoo_imu.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RawImu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.accelerometer = null;
      this.gyroscope = null;
      this.magnetometer = null;
      this.raw_linear_acceleration = null;
      this.raw_angular_velocity = null;
      this.raw_magnetic_field = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('accelerometer')) {
        this.accelerometer = initObj.accelerometer
      }
      else {
        this.accelerometer = false;
      }
      if (initObj.hasOwnProperty('gyroscope')) {
        this.gyroscope = initObj.gyroscope
      }
      else {
        this.gyroscope = false;
      }
      if (initObj.hasOwnProperty('magnetometer')) {
        this.magnetometer = initObj.magnetometer
      }
      else {
        this.magnetometer = false;
      }
      if (initObj.hasOwnProperty('raw_linear_acceleration')) {
        this.raw_linear_acceleration = initObj.raw_linear_acceleration
      }
      else {
        this.raw_linear_acceleration = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('raw_angular_velocity')) {
        this.raw_angular_velocity = initObj.raw_angular_velocity
      }
      else {
        this.raw_angular_velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('raw_magnetic_field')) {
        this.raw_magnetic_field = initObj.raw_magnetic_field
      }
      else {
        this.raw_magnetic_field = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RawImu
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [accelerometer]
    bufferOffset = _serializer.bool(obj.accelerometer, buffer, bufferOffset);
    // Serialize message field [gyroscope]
    bufferOffset = _serializer.bool(obj.gyroscope, buffer, bufferOffset);
    // Serialize message field [magnetometer]
    bufferOffset = _serializer.bool(obj.magnetometer, buffer, bufferOffset);
    // Serialize message field [raw_linear_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.raw_linear_acceleration, buffer, bufferOffset);
    // Serialize message field [raw_angular_velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.raw_angular_velocity, buffer, bufferOffset);
    // Serialize message field [raw_magnetic_field]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.raw_magnetic_field, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RawImu
    let len;
    let data = new RawImu(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [accelerometer]
    data.accelerometer = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [gyroscope]
    data.gyroscope = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [magnetometer]
    data.magnetometer = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [raw_linear_acceleration]
    data.raw_linear_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [raw_angular_velocity]
    data.raw_angular_velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [raw_magnetic_field]
    data.raw_magnetic_field = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 75;
  }

  static datatype() {
    // Returns string type for a message object
    return 'zoo_imu/RawImu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3bc0ea37781da51ad41a6868ff62faa9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool accelerometer
    bool gyroscope
    bool magnetometer
    geometry_msgs/Vector3 raw_linear_acceleration
    geometry_msgs/Vector3 raw_angular_velocity
    geometry_msgs/Vector3 raw_magnetic_field
    
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
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RawImu(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.accelerometer !== undefined) {
      resolved.accelerometer = msg.accelerometer;
    }
    else {
      resolved.accelerometer = false
    }

    if (msg.gyroscope !== undefined) {
      resolved.gyroscope = msg.gyroscope;
    }
    else {
      resolved.gyroscope = false
    }

    if (msg.magnetometer !== undefined) {
      resolved.magnetometer = msg.magnetometer;
    }
    else {
      resolved.magnetometer = false
    }

    if (msg.raw_linear_acceleration !== undefined) {
      resolved.raw_linear_acceleration = geometry_msgs.msg.Vector3.Resolve(msg.raw_linear_acceleration)
    }
    else {
      resolved.raw_linear_acceleration = new geometry_msgs.msg.Vector3()
    }

    if (msg.raw_angular_velocity !== undefined) {
      resolved.raw_angular_velocity = geometry_msgs.msg.Vector3.Resolve(msg.raw_angular_velocity)
    }
    else {
      resolved.raw_angular_velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.raw_magnetic_field !== undefined) {
      resolved.raw_magnetic_field = geometry_msgs.msg.Vector3.Resolve(msg.raw_magnetic_field)
    }
    else {
      resolved.raw_magnetic_field = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = RawImu;
