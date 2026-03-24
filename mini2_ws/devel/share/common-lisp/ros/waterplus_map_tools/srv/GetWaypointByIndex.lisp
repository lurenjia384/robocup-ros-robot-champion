; Auto-generated. Do not edit!


(cl:in-package waterplus_map_tools-srv)


;//! \htmlinclude GetWaypointByIndex-request.msg.html

(cl:defclass <GetWaypointByIndex-request> (roslisp-msg-protocol:ros-message)
  ((index
    :reader index
    :initarg :index
    :type cl:integer
    :initform 0))
)

(cl:defclass GetWaypointByIndex-request (<GetWaypointByIndex-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetWaypointByIndex-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetWaypointByIndex-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetWaypointByIndex-request> is deprecated: use waterplus_map_tools-srv:GetWaypointByIndex-request instead.")))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <GetWaypointByIndex-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:index-val is deprecated.  Use waterplus_map_tools-srv:index instead.")
  (index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetWaypointByIndex-request>) ostream)
  "Serializes a message object of type '<GetWaypointByIndex-request>"
  (cl:let* ((signed (cl:slot-value msg 'index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetWaypointByIndex-request>) istream)
  "Deserializes a message object of type '<GetWaypointByIndex-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetWaypointByIndex-request>)))
  "Returns string type for a service object of type '<GetWaypointByIndex-request>"
  "waterplus_map_tools/GetWaypointByIndexRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetWaypointByIndex-request)))
  "Returns string type for a service object of type 'GetWaypointByIndex-request"
  "waterplus_map_tools/GetWaypointByIndexRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetWaypointByIndex-request>)))
  "Returns md5sum for a message object of type '<GetWaypointByIndex-request>"
  "3d6fa8d914cdbd6f782b3a98c909799f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetWaypointByIndex-request)))
  "Returns md5sum for a message object of type 'GetWaypointByIndex-request"
  "3d6fa8d914cdbd6f782b3a98c909799f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetWaypointByIndex-request>)))
  "Returns full string definition for message of type '<GetWaypointByIndex-request>"
  (cl:format cl:nil "int32 index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetWaypointByIndex-request)))
  "Returns full string definition for message of type 'GetWaypointByIndex-request"
  (cl:format cl:nil "int32 index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetWaypointByIndex-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetWaypointByIndex-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetWaypointByIndex-request
    (cl:cons ':index (index msg))
))
;//! \htmlinclude GetWaypointByIndex-response.msg.html

(cl:defclass <GetWaypointByIndex-response> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass GetWaypointByIndex-response (<GetWaypointByIndex-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetWaypointByIndex-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetWaypointByIndex-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetWaypointByIndex-response> is deprecated: use waterplus_map_tools-srv:GetWaypointByIndex-response instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetWaypointByIndex-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:name-val is deprecated.  Use waterplus_map_tools-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetWaypointByIndex-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:pose-val is deprecated.  Use waterplus_map_tools-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetWaypointByIndex-response>) ostream)
  "Serializes a message object of type '<GetWaypointByIndex-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetWaypointByIndex-response>) istream)
  "Deserializes a message object of type '<GetWaypointByIndex-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetWaypointByIndex-response>)))
  "Returns string type for a service object of type '<GetWaypointByIndex-response>"
  "waterplus_map_tools/GetWaypointByIndexResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetWaypointByIndex-response)))
  "Returns string type for a service object of type 'GetWaypointByIndex-response"
  "waterplus_map_tools/GetWaypointByIndexResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetWaypointByIndex-response>)))
  "Returns md5sum for a message object of type '<GetWaypointByIndex-response>"
  "3d6fa8d914cdbd6f782b3a98c909799f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetWaypointByIndex-response)))
  "Returns md5sum for a message object of type 'GetWaypointByIndex-response"
  "3d6fa8d914cdbd6f782b3a98c909799f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetWaypointByIndex-response>)))
  "Returns full string definition for message of type '<GetWaypointByIndex-response>"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetWaypointByIndex-response)))
  "Returns full string definition for message of type 'GetWaypointByIndex-response"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetWaypointByIndex-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetWaypointByIndex-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetWaypointByIndex-response
    (cl:cons ':name (name msg))
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetWaypointByIndex)))
  'GetWaypointByIndex-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetWaypointByIndex)))
  'GetWaypointByIndex-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetWaypointByIndex)))
  "Returns string type for a service object of type '<GetWaypointByIndex>"
  "waterplus_map_tools/GetWaypointByIndex")