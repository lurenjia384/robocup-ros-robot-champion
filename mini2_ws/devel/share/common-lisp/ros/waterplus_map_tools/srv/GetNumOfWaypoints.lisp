; Auto-generated. Do not edit!


(cl:in-package waterplus_map_tools-srv)


;//! \htmlinclude GetNumOfWaypoints-request.msg.html

(cl:defclass <GetNumOfWaypoints-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetNumOfWaypoints-request (<GetNumOfWaypoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetNumOfWaypoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetNumOfWaypoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetNumOfWaypoints-request> is deprecated: use waterplus_map_tools-srv:GetNumOfWaypoints-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetNumOfWaypoints-request>) ostream)
  "Serializes a message object of type '<GetNumOfWaypoints-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetNumOfWaypoints-request>) istream)
  "Deserializes a message object of type '<GetNumOfWaypoints-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetNumOfWaypoints-request>)))
  "Returns string type for a service object of type '<GetNumOfWaypoints-request>"
  "waterplus_map_tools/GetNumOfWaypointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNumOfWaypoints-request)))
  "Returns string type for a service object of type 'GetNumOfWaypoints-request"
  "waterplus_map_tools/GetNumOfWaypointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetNumOfWaypoints-request>)))
  "Returns md5sum for a message object of type '<GetNumOfWaypoints-request>"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetNumOfWaypoints-request)))
  "Returns md5sum for a message object of type 'GetNumOfWaypoints-request"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetNumOfWaypoints-request>)))
  "Returns full string definition for message of type '<GetNumOfWaypoints-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetNumOfWaypoints-request)))
  "Returns full string definition for message of type 'GetNumOfWaypoints-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetNumOfWaypoints-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetNumOfWaypoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetNumOfWaypoints-request
))
;//! \htmlinclude GetNumOfWaypoints-response.msg.html

(cl:defclass <GetNumOfWaypoints-response> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:integer
    :initform 0))
)

(cl:defclass GetNumOfWaypoints-response (<GetNumOfWaypoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetNumOfWaypoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetNumOfWaypoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<GetNumOfWaypoints-response> is deprecated: use waterplus_map_tools-srv:GetNumOfWaypoints-response instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <GetNumOfWaypoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:num-val is deprecated.  Use waterplus_map_tools-srv:num instead.")
  (num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetNumOfWaypoints-response>) ostream)
  "Serializes a message object of type '<GetNumOfWaypoints-response>"
  (cl:let* ((signed (cl:slot-value msg 'num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetNumOfWaypoints-response>) istream)
  "Deserializes a message object of type '<GetNumOfWaypoints-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetNumOfWaypoints-response>)))
  "Returns string type for a service object of type '<GetNumOfWaypoints-response>"
  "waterplus_map_tools/GetNumOfWaypointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNumOfWaypoints-response)))
  "Returns string type for a service object of type 'GetNumOfWaypoints-response"
  "waterplus_map_tools/GetNumOfWaypointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetNumOfWaypoints-response>)))
  "Returns md5sum for a message object of type '<GetNumOfWaypoints-response>"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetNumOfWaypoints-response)))
  "Returns md5sum for a message object of type 'GetNumOfWaypoints-response"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetNumOfWaypoints-response>)))
  "Returns full string definition for message of type '<GetNumOfWaypoints-response>"
  (cl:format cl:nil "int32 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetNumOfWaypoints-response)))
  "Returns full string definition for message of type 'GetNumOfWaypoints-response"
  (cl:format cl:nil "int32 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetNumOfWaypoints-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetNumOfWaypoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetNumOfWaypoints-response
    (cl:cons ':num (num msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetNumOfWaypoints)))
  'GetNumOfWaypoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetNumOfWaypoints)))
  'GetNumOfWaypoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNumOfWaypoints)))
  "Returns string type for a service object of type '<GetNumOfWaypoints>"
  "waterplus_map_tools/GetNumOfWaypoints")