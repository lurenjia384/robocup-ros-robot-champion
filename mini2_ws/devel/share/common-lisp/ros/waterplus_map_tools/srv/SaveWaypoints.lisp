; Auto-generated. Do not edit!


(cl:in-package waterplus_map_tools-srv)


;//! \htmlinclude SaveWaypoints-request.msg.html

(cl:defclass <SaveWaypoints-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass SaveWaypoints-request (<SaveWaypoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveWaypoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveWaypoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<SaveWaypoints-request> is deprecated: use waterplus_map_tools-srv:SaveWaypoints-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <SaveWaypoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waterplus_map_tools-srv:filename-val is deprecated.  Use waterplus_map_tools-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveWaypoints-request>) ostream)
  "Serializes a message object of type '<SaveWaypoints-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveWaypoints-request>) istream)
  "Deserializes a message object of type '<SaveWaypoints-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveWaypoints-request>)))
  "Returns string type for a service object of type '<SaveWaypoints-request>"
  "waterplus_map_tools/SaveWaypointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveWaypoints-request)))
  "Returns string type for a service object of type 'SaveWaypoints-request"
  "waterplus_map_tools/SaveWaypointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveWaypoints-request>)))
  "Returns md5sum for a message object of type '<SaveWaypoints-request>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveWaypoints-request)))
  "Returns md5sum for a message object of type 'SaveWaypoints-request"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveWaypoints-request>)))
  "Returns full string definition for message of type '<SaveWaypoints-request>"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveWaypoints-request)))
  "Returns full string definition for message of type 'SaveWaypoints-request"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveWaypoints-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveWaypoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveWaypoints-request
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude SaveWaypoints-response.msg.html

(cl:defclass <SaveWaypoints-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SaveWaypoints-response (<SaveWaypoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveWaypoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveWaypoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waterplus_map_tools-srv:<SaveWaypoints-response> is deprecated: use waterplus_map_tools-srv:SaveWaypoints-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveWaypoints-response>) ostream)
  "Serializes a message object of type '<SaveWaypoints-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveWaypoints-response>) istream)
  "Deserializes a message object of type '<SaveWaypoints-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveWaypoints-response>)))
  "Returns string type for a service object of type '<SaveWaypoints-response>"
  "waterplus_map_tools/SaveWaypointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveWaypoints-response)))
  "Returns string type for a service object of type 'SaveWaypoints-response"
  "waterplus_map_tools/SaveWaypointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveWaypoints-response>)))
  "Returns md5sum for a message object of type '<SaveWaypoints-response>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveWaypoints-response)))
  "Returns md5sum for a message object of type 'SaveWaypoints-response"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveWaypoints-response>)))
  "Returns full string definition for message of type '<SaveWaypoints-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveWaypoints-response)))
  "Returns full string definition for message of type 'SaveWaypoints-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveWaypoints-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveWaypoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveWaypoints-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveWaypoints)))
  'SaveWaypoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveWaypoints)))
  'SaveWaypoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveWaypoints)))
  "Returns string type for a service object of type '<SaveWaypoints>"
  "waterplus_map_tools/SaveWaypoints")