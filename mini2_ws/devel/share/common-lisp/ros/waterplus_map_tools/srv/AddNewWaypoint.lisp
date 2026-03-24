; Auto-generated. Do not edit!


(cl:in-package waterplus_map_tools-srv)


;//! \htmlinclude AddNewWaypoint-request.msg.html

(cl:defclass <AddNewWaypoint-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass AddNewWaypoint-request (<AddNewWaypoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddNewWaypoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddNewWaypoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<AddNewWaypoint-request> is deprecated: use waterplus_map_tools-srv:AddNewWaypoint-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <AddNewWaypoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:name-val is deprecated.  Use waterplus_map_tools-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <AddNewWaypoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:pose-val is deprecated.  Use waterplus_map_tools-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddNewWaypoint-request>) ostream)
  "Serializes a message object of type '<AddNewWaypoint-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddNewWaypoint-request>) istream)
  "Deserializes a message object of type '<AddNewWaypoint-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddNewWaypoint-request>)))
  "Returns string type for a service object of type '<AddNewWaypoint-request>"
  "waterplus_map_tools/AddNewWaypointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddNewWaypoint-request)))
  "Returns string type for a service object of type 'AddNewWaypoint-request"
  "waterplus_map_tools/AddNewWaypointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddNewWaypoint-request>)))
  "Returns md5sum for a message object of type '<AddNewWaypoint-request>"
  "6948a8f076727d2b3b462b6ca2b31b5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddNewWaypoint-request)))
  "Returns md5sum for a message object of type 'AddNewWaypoint-request"
  "6948a8f076727d2b3b462b6ca2b31b5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddNewWaypoint-request>)))
  "Returns full string definition for message of type '<AddNewWaypoint-request>"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddNewWaypoint-request)))
  "Returns full string definition for message of type 'AddNewWaypoint-request"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddNewWaypoint-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddNewWaypoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddNewWaypoint-request
    (cl:cons ':name (name msg))
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude AddNewWaypoint-response.msg.html

(cl:defclass <AddNewWaypoint-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AddNewWaypoint-response (<AddNewWaypoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddNewWaypoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddNewWaypoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<AddNewWaypoint-response> is deprecated: use waterplus_map_tools-srv:AddNewWaypoint-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <AddNewWaypoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:result-val is deprecated.  Use waterplus_map_tools-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddNewWaypoint-response>) ostream)
  "Serializes a message object of type '<AddNewWaypoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddNewWaypoint-response>) istream)
  "Deserializes a message object of type '<AddNewWaypoint-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddNewWaypoint-response>)))
  "Returns string type for a service object of type '<AddNewWaypoint-response>"
  "waterplus_map_tools/AddNewWaypointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddNewWaypoint-response)))
  "Returns string type for a service object of type 'AddNewWaypoint-response"
  "waterplus_map_tools/AddNewWaypointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddNewWaypoint-response>)))
  "Returns md5sum for a message object of type '<AddNewWaypoint-response>"
  "6948a8f076727d2b3b462b6ca2b31b5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddNewWaypoint-response)))
  "Returns md5sum for a message object of type 'AddNewWaypoint-response"
  "6948a8f076727d2b3b462b6ca2b31b5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddNewWaypoint-response>)))
  "Returns full string definition for message of type '<AddNewWaypoint-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddNewWaypoint-response)))
  "Returns full string definition for message of type 'AddNewWaypoint-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddNewWaypoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddNewWaypoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddNewWaypoint-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddNewWaypoint)))
  'AddNewWaypoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddNewWaypoint)))
  'AddNewWaypoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddNewWaypoint)))
  "Returns string type for a service object of type '<AddNewWaypoint>"
  "waterplus_map_tools/AddNewWaypoint")