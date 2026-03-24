; Auto-generated. Do not edit!


(cl:in-package zoo_imu-msg)


;//! \htmlinclude RawImu.msg.html

(cl:defclass <RawImu> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (accelerometer
    :reader accelerometer
    :initarg :accelerometer
    :type cl:boolean
    :initform cl:nil)
   (gyroscope
    :reader gyroscope
    :initarg :gyroscope
    :type cl:boolean
    :initform cl:nil)
   (magnetometer
    :reader magnetometer
    :initarg :magnetometer
    :type cl:boolean
    :initform cl:nil)
   (raw_linear_acceleration
    :reader raw_linear_acceleration
    :initarg :raw_linear_acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (raw_angular_velocity
    :reader raw_angular_velocity
    :initarg :raw_angular_velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (raw_magnetic_field
    :reader raw_magnetic_field
    :initarg :raw_magnetic_field
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass RawImu (<RawImu>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RawImu>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RawImu)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zoo_imu-msg:<RawImu> is deprecated: use zoo_imu-msg:RawImu instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:header-val is deprecated.  Use zoo_imu-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'accelerometer-val :lambda-list '(m))
(cl:defmethod accelerometer-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:accelerometer-val is deprecated.  Use zoo_imu-msg:accelerometer instead.")
  (accelerometer m))

(cl:ensure-generic-function 'gyroscope-val :lambda-list '(m))
(cl:defmethod gyroscope-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:gyroscope-val is deprecated.  Use zoo_imu-msg:gyroscope instead.")
  (gyroscope m))

(cl:ensure-generic-function 'magnetometer-val :lambda-list '(m))
(cl:defmethod magnetometer-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:magnetometer-val is deprecated.  Use zoo_imu-msg:magnetometer instead.")
  (magnetometer m))

(cl:ensure-generic-function 'raw_linear_acceleration-val :lambda-list '(m))
(cl:defmethod raw_linear_acceleration-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:raw_linear_acceleration-val is deprecated.  Use zoo_imu-msg:raw_linear_acceleration instead.")
  (raw_linear_acceleration m))

(cl:ensure-generic-function 'raw_angular_velocity-val :lambda-list '(m))
(cl:defmethod raw_angular_velocity-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:raw_angular_velocity-val is deprecated.  Use zoo_imu-msg:raw_angular_velocity instead.")
  (raw_angular_velocity m))

(cl:ensure-generic-function 'raw_magnetic_field-val :lambda-list '(m))
(cl:defmethod raw_magnetic_field-val ((m <RawImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:raw_magnetic_field-val is deprecated.  Use zoo_imu-msg:raw_magnetic_field instead.")
  (raw_magnetic_field m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RawImu>) ostream)
  "Serializes a message object of type '<RawImu>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'accelerometer) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gyroscope) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'magnetometer) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'raw_linear_acceleration) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'raw_angular_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'raw_magnetic_field) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RawImu>) istream)
  "Deserializes a message object of type '<RawImu>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'accelerometer) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gyroscope) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'magnetometer) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'raw_linear_acceleration) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'raw_angular_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'raw_magnetic_field) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RawImu>)))
  "Returns string type for a message object of type '<RawImu>"
  "zoo_imu/RawImu")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RawImu)))
  "Returns string type for a message object of type 'RawImu"
  "zoo_imu/RawImu")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RawImu>)))
  "Returns md5sum for a message object of type '<RawImu>"
  "3bc0ea37781da51ad41a6868ff62faa9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RawImu)))
  "Returns md5sum for a message object of type 'RawImu"
  "3bc0ea37781da51ad41a6868ff62faa9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RawImu>)))
  "Returns full string definition for message of type '<RawImu>"
  (cl:format cl:nil "Header header~%bool accelerometer~%bool gyroscope~%bool magnetometer~%geometry_msgs/Vector3 raw_linear_acceleration~%geometry_msgs/Vector3 raw_angular_velocity~%geometry_msgs/Vector3 raw_magnetic_field~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RawImu)))
  "Returns full string definition for message of type 'RawImu"
  (cl:format cl:nil "Header header~%bool accelerometer~%bool gyroscope~%bool magnetometer~%geometry_msgs/Vector3 raw_linear_acceleration~%geometry_msgs/Vector3 raw_angular_velocity~%geometry_msgs/Vector3 raw_magnetic_field~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RawImu>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'raw_linear_acceleration))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'raw_angular_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'raw_magnetic_field))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RawImu>))
  "Converts a ROS message object to a list"
  (cl:list 'RawImu
    (cl:cons ':header (header msg))
    (cl:cons ':accelerometer (accelerometer msg))
    (cl:cons ':gyroscope (gyroscope msg))
    (cl:cons ':magnetometer (magnetometer msg))
    (cl:cons ':raw_linear_acceleration (raw_linear_acceleration msg))
    (cl:cons ':raw_angular_velocity (raw_angular_velocity msg))
    (cl:cons ':raw_magnetic_field (raw_magnetic_field msg))
))
