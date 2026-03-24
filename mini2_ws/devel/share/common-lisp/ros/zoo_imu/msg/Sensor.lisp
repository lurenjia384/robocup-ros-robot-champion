; Auto-generated. Do not edit!


(cl:in-package zoo_imu-msg)


;//! \htmlinclude Sensor.msg.html

(cl:defclass <Sensor> (roslisp-msg-protocol:ros-message)
  ((ultra1
    :reader ultra1
    :initarg :ultra1
    :type cl:fixnum
    :initform 0)
   (ultra2
    :reader ultra2
    :initarg :ultra2
    :type cl:fixnum
    :initform 0)
   (ultra3
    :reader ultra3
    :initarg :ultra3
    :type cl:fixnum
    :initform 0)
   (ultra4
    :reader ultra4
    :initarg :ultra4
    :type cl:fixnum
    :initform 0)
   (grey_sensor
    :reader grey_sensor
    :initarg :grey_sensor
    :type cl:fixnum
    :initform 0)
   (collision
    :reader collision
    :initarg :collision
    :type cl:fixnum
    :initform 0)
   (voltage
    :reader voltage
    :initarg :voltage
    :type cl:fixnum
    :initform 0)
   (current
    :reader current
    :initarg :current
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Sensor (<Sensor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sensor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sensor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zoo_imu-msg:<Sensor> is deprecated: use zoo_imu-msg:Sensor instead.")))

(cl:ensure-generic-function 'ultra1-val :lambda-list '(m))
(cl:defmethod ultra1-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:ultra1-val is deprecated.  Use zoo_imu-msg:ultra1 instead.")
  (ultra1 m))

(cl:ensure-generic-function 'ultra2-val :lambda-list '(m))
(cl:defmethod ultra2-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:ultra2-val is deprecated.  Use zoo_imu-msg:ultra2 instead.")
  (ultra2 m))

(cl:ensure-generic-function 'ultra3-val :lambda-list '(m))
(cl:defmethod ultra3-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:ultra3-val is deprecated.  Use zoo_imu-msg:ultra3 instead.")
  (ultra3 m))

(cl:ensure-generic-function 'ultra4-val :lambda-list '(m))
(cl:defmethod ultra4-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:ultra4-val is deprecated.  Use zoo_imu-msg:ultra4 instead.")
  (ultra4 m))

(cl:ensure-generic-function 'grey_sensor-val :lambda-list '(m))
(cl:defmethod grey_sensor-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:grey_sensor-val is deprecated.  Use zoo_imu-msg:grey_sensor instead.")
  (grey_sensor m))

(cl:ensure-generic-function 'collision-val :lambda-list '(m))
(cl:defmethod collision-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:collision-val is deprecated.  Use zoo_imu-msg:collision instead.")
  (collision m))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:voltage-val is deprecated.  Use zoo_imu-msg:voltage instead.")
  (voltage m))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <Sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zoo_imu-msg:current-val is deprecated.  Use zoo_imu-msg:current instead.")
  (current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sensor>) ostream)
  "Serializes a message object of type '<Sensor>"
  (cl:let* ((signed (cl:slot-value msg 'ultra1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ultra2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ultra3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ultra4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'grey_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'collision)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'voltage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'current)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sensor>) istream)
  "Deserializes a message object of type '<Sensor>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ultra1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ultra2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ultra3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ultra4) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grey_sensor) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'collision) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'voltage) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sensor>)))
  "Returns string type for a message object of type '<Sensor>"
  "zoo_imu/Sensor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sensor)))
  "Returns string type for a message object of type 'Sensor"
  "zoo_imu/Sensor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sensor>)))
  "Returns md5sum for a message object of type '<Sensor>"
  "ae4bc18611c4c4b13dc973d79b08faf4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sensor)))
  "Returns md5sum for a message object of type 'Sensor"
  "ae4bc18611c4c4b13dc973d79b08faf4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sensor>)))
  "Returns full string definition for message of type '<Sensor>"
  (cl:format cl:nil "int16 ultra1~%int16 ultra2~%int16 ultra3~%int16 ultra4~%int8 grey_sensor~%int8 collision~%int16 voltage~%int16 current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sensor)))
  "Returns full string definition for message of type 'Sensor"
  (cl:format cl:nil "int16 ultra1~%int16 ultra2~%int16 ultra3~%int16 ultra4~%int8 grey_sensor~%int8 collision~%int16 voltage~%int16 current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sensor>))
  (cl:+ 0
     2
     2
     2
     2
     1
     1
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sensor>))
  "Converts a ROS message object to a list"
  (cl:list 'Sensor
    (cl:cons ':ultra1 (ultra1 msg))
    (cl:cons ':ultra2 (ultra2 msg))
    (cl:cons ':ultra3 (ultra3 msg))
    (cl:cons ':ultra4 (ultra4 msg))
    (cl:cons ':grey_sensor (grey_sensor msg))
    (cl:cons ':collision (collision msg))
    (cl:cons ':voltage (voltage msg))
    (cl:cons ':current (current msg))
))
