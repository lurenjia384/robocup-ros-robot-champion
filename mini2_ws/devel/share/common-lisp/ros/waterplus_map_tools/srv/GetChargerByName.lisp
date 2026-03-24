; Auto-generated. Do not edit!


(cl:in-package waterplus_map_tools-srv)


;//! \htmlinclude GetChargerByName-request.msg.html

(cl:defclass <GetChargerByName-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass GetChargerByName-request (<GetChargerByName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetChargerByName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetChargerByName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetChargerByName-request> is deprecated: use waterplus_map_tools-srv:GetChargerByName-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetChargerByName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:name-val is deprecated.  Use waterplus_map_tools-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetChargerByName-request>) ostream)
  "Serializes a message object of type '<GetChargerByName-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetChargerByName-request>) istream)
  "Deserializes a message object of type '<GetChargerByName-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetChargerByName-request>)))
  "Returns string type for a service object of type '<GetChargerByName-request>"
  "waterplus_map_tools/GetChargerByNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetChargerByName-request)))
  "Returns string type for a service object of type 'GetChargerByName-request"
  "waterplus_map_tools/GetChargerByNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetChargerByName-request>)))
  "Returns md5sum for a message object of type '<GetChargerByName-request>"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetChargerByName-request)))
  "Returns md5sum for a message object of type 'GetChargerByName-request"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetChargerByName-request>)))
  "Returns full string definition for message of type '<GetChargerByName-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetChargerByName-request)))
  "Returns full string definition for message of type 'GetChargerByName-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetChargerByName-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetChargerByName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetChargerByName-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude GetChargerByName-response.msg.html

(cl:defclass <GetChargerByName-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GetChargerByName-response (<GetChargerByName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetChargerByName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetChargerByName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetChargerByName-response> is deprecated: use waterplus_map_tools-srv:GetChargerByName-response instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetChargerByName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:name-val is deprecated.  Use waterplus_map_tools-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetChargerByName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:pose-val is deprecated.  Use waterplus_map_tools-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetChargerByName-response>) ostream)
  "Serializes a message object of type '<GetChargerByName-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetChargerByName-response>) istream)
  "Deserializes a message object of type '<GetChargerByName-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetChargerByName-response>)))
  "Returns string type for a service object of type '<GetChargerByName-response>"
  "waterplus_map_tools/GetChargerByNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetChargerByName-response)))
  "Returns string type for a service object of type 'GetChargerByName-response"
  "waterplus_map_tools/GetChargerByNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetChargerByName-response>)))
  "Returns md5sum for a message object of type '<GetChargerByName-response>"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetChargerByName-response)))
  "Returns md5sum for a message object of type 'GetChargerByName-response"
  "5164dc1f215ac8183cbe49b46c7ff40e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetChargerByName-response>)))
  "Returns full string definition for message of type '<GetChargerByName-response>"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetChargerByName-response)))
  "Returns full string definition for message of type 'GetChargerByName-response"
  (cl:format cl:nil "string name~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetChargerByName-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetChargerByName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetChargerByName-response
    (cl:cons ':name (name msg))
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetChargerByName)))
  'GetChargerByName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetChargerByName)))
  'GetChargerByName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetChargerByName)))
  "Returns string type for a service object of type '<GetChargerByName>"
  "waterplus_map_tools/GetChargerByName")