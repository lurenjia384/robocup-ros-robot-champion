; Auto-generated. Do not edit!


(cl:in-package astra_camera-srv)


;//! \htmlinclude SetDistortioncal-request.msg.html

(cl:defclass <SetDistortioncal-request> (roslisp-msg-protocol:ros-message)
  ((enable
    :reader enable
    :initarg :enable
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetDistortioncal-request (<SetDistortioncal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDistortioncal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDistortioncal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name astra_camera-srv:<SetDistortioncal-request> is deprecated: use astra_camera-srv:SetDistortioncal-request instead.")))

(cl:ensure-generic-function 'enable-val :lambda-list '(m))
(cl:defmethod enable-val ((m <SetDistortioncal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader astra_camera-srv:enable-val is deprecated.  Use astra_camera-srv:enable instead.")
  (enable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDistortioncal-request>) ostream)
  "Serializes a message object of type '<SetDistortioncal-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enable) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDistortioncal-request>) istream)
  "Deserializes a message object of type '<SetDistortioncal-request>"
    (cl:setf (cl:slot-value msg 'enable) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDistortioncal-request>)))
  "Returns string type for a service object of type '<SetDistortioncal-request>"
  "astra_camera/SetDistortioncalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDistortioncal-request)))
  "Returns string type for a service object of type 'SetDistortioncal-request"
  "astra_camera/SetDistortioncalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDistortioncal-request>)))
  "Returns md5sum for a message object of type '<SetDistortioncal-request>"
  "8c1211af706069c994c06e00eb59ac9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDistortioncal-request)))
  "Returns md5sum for a message object of type 'SetDistortioncal-request"
  "8c1211af706069c994c06e00eb59ac9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDistortioncal-request>)))
  "Returns full string definition for message of type '<SetDistortioncal-request>"
  (cl:format cl:nil "bool enable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDistortioncal-request)))
  "Returns full string definition for message of type 'SetDistortioncal-request"
  (cl:format cl:nil "bool enable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDistortioncal-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDistortioncal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDistortioncal-request
    (cl:cons ':enable (enable msg))
))
;//! \htmlinclude SetDistortioncal-response.msg.html

(cl:defclass <SetDistortioncal-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetDistortioncal-response (<SetDistortioncal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDistortioncal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDistortioncal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name astra_camera-srv:<SetDistortioncal-response> is deprecated: use astra_camera-srv:SetDistortioncal-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDistortioncal-response>) ostream)
  "Serializes a message object of type '<SetDistortioncal-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDistortioncal-response>) istream)
  "Deserializes a message object of type '<SetDistortioncal-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDistortioncal-response>)))
  "Returns string type for a service object of type '<SetDistortioncal-response>"
  "astra_camera/SetDistortioncalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDistortioncal-response)))
  "Returns string type for a service object of type 'SetDistortioncal-response"
  "astra_camera/SetDistortioncalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDistortioncal-response>)))
  "Returns md5sum for a message object of type '<SetDistortioncal-response>"
  "8c1211af706069c994c06e00eb59ac9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDistortioncal-response)))
  "Returns md5sum for a message object of type 'SetDistortioncal-response"
  "8c1211af706069c994c06e00eb59ac9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDistortioncal-response>)))
  "Returns full string definition for message of type '<SetDistortioncal-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDistortioncal-response)))
  "Returns full string definition for message of type 'SetDistortioncal-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDistortioncal-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDistortioncal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDistortioncal-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetDistortioncal)))
  'SetDistortioncal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetDistortioncal)))
  'SetDistortioncal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDistortioncal)))
  "Returns string type for a service object of type '<SetDistortioncal>"
  "astra_camera/SetDistortioncal")