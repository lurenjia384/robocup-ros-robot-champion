; Auto-generated. Do not edit!


(cl:in-package waterplus_map_tools-srv)


;//! \htmlinclude GetWaypointByName-request.msg.html

(cl:defclass <GetWaypointByName-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass GetWaypointByName-request (<GetWaypointByName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetWaypointByName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetWaypointByName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetWaypointByName-request> is deprecated: use waterplus_map_tools-srv:GetWaypointByName-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetWaypointByName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:name-val is deprecated.  Use waterplus_map_tools-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetWaypointByName-request>) ostream)
  "Serializes a message object of type '<GetWaypointByName-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetWaypointByName-request>) istream)
  "Deserializes a message object of type '<GetWaypointByName-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetWaypointByName-request>)))
  "Returns string type for a service object of type '<GetWaypointByName-request>"
  "waterplus_map_tools/GetWaypointByNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetWaypointByName-request)))
  "Returns string type for a service object of type 'GetWaypointByName-request"
  "waterplus_map_tools/GetWaypointByNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetWaypointByName-request>)))
  "Returns md5sum for a message object of type '<GetWaypointByName-request>"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetWaypointByName-request)))
  "Returns md5sum for a message object of type 'GetWaypointByName-request"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetWaypointByName-request>)))
  "Returns full string definition for message of type '<GetWaypointByName-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetWaypointByName-request)))
  "Returns full string definition for message of type 'GetWaypointByName-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetWaypointByName-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetWaypointByName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetWaypointByName-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude GetWaypointByName-response.msg.html

(cl:defclass <GetWaypointByName-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GetWaypointByName-response (<GetWaypointByName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetWaypointByName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetWaypointByName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetWaypointByName-response> is deprecated: use waterplus_map_tools-srv:GetWaypointByName-response instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetWaypointByName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:name-val is deprecated.  Use waterplus_map_tools-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetWaypointByName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:pose-val is deprecated.  Use waterplus_map_tools-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetWaypointByName-response>) ostream)
  "Serializes a message object of type '<GetWaypointByName-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetWaypointByName-response>) istream)
  "Deserializes a message object of type '<GetWaypointByName-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetWaypointByName-response>)))
  "Returns string type for a service object of type '<GetWaypointByName-response>"
  "waterplus_map_tools/GetWaypointByNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetWaypointByName-response)))
  "Returns string type for a service object of type 'GetWaypointByName-response"
  "waterplus_map_tools/GetWaypointByNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetWaypointByName-response>)))
  "Returns md5sum for a message object of type '<GetWaypointByName-response>"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetWaypointByName-response)))
  "Returns md5sum for a message object of type 'GetWaypointByName-response"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetWaypointByName-response>)))
  "Returns full string definition for message of type '<GetWaypointByName-response>"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetWaypointByName-response)))
  "Returns full string definition for message of type 'GetWaypointByName-response"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetWaypointByName-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetWaypointByName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetWaypointByName-response
    (cl:cons ':name (name msg))
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetWaypointByName)))
  'GetWaypointByName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetWaypointByName)))
  'GetWaypointByName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetWaypointByName)))
  "Returns string type for a service object of type '<GetWaypointByName>"
  "waterplus_map_tools/GetWaypointByName")