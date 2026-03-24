;; Auto-generated. Do not edit!


(when (boundp 'zoo_imu::RawImu)
  (if (not (find-package "ZOO_IMU"))
    (make-package "ZOO_IMU"))
  (shadow 'RawImu (find-package "ZOO_IMU")))
(unless (find-package "ZOO_IMU::RAWIMU")
  (make-package "ZOO_IMU::RAWIMU"))

(in-package "ROS")
;;//! \htmlinclude RawImu.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass zoo_imu::RawImu
  :super ros::object
  :slots (_header _accelerometer _gyroscope _magnetometer _raw_linear_acceleration _raw_angular_velocity _raw_magnetic_field ))

(defmethod zoo_imu::RawImu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:accelerometer __accelerometer) nil)
    ((:gyroscope __gyroscope) nil)
    ((:magnetometer __magnetometer) nil)
    ((:raw_linear_acceleration __raw_linear_acceleration) (instance geometry_msgs::Vector3 :init))
    ((:raw_angular_velocity __raw_angular_velocity) (instance geometry_msgs::Vector3 :init))
    ((:raw_magnetic_field __raw_magnetic_field) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _accelerometer __accelerometer)
   (setq _gyroscope __gyroscope)
   (setq _magnetometer __magnetometer)
   (setq _raw_linear_acceleration __raw_linear_acceleration)
   (setq _raw_angular_velocity __raw_angular_velocity)
   (setq _raw_magnetic_field __raw_magnetic_field)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:accelerometer
   (&optional __accelerometer)
   (if __accelerometer (setq _accelerometer __accelerometer)) _accelerometer)
  (:gyroscope
   (&optional __gyroscope)
   (if __gyroscope (setq _gyroscope __gyroscope)) _gyroscope)
  (:magnetometer
   (&optional __magnetometer)
   (if __magnetometer (setq _magnetometer __magnetometer)) _magnetometer)
  (:raw_linear_acceleration
   (&rest __raw_linear_acceleration)
   (if (keywordp (car __raw_linear_acceleration))
       (send* _raw_linear_acceleration __raw_linear_acceleration)
     (progn
       (if __raw_linear_acceleration (setq _raw_linear_acceleration (car __raw_linear_acceleration)))
       _raw_linear_acceleration)))
  (:raw_angular_velocity
   (&rest __raw_angular_velocity)
   (if (keywordp (car __raw_angular_velocity))
       (send* _raw_angular_velocity __raw_angular_velocity)
     (progn
       (if __raw_angular_velocity (setq _raw_angular_velocity (car __raw_angular_velocity)))
       _raw_angular_velocity)))
  (:raw_magnetic_field
   (&rest __raw_magnetic_field)
   (if (keywordp (car __raw_magnetic_field))
       (send* _raw_magnetic_field __raw_magnetic_field)
     (progn
       (if __raw_magnetic_field (setq _raw_magnetic_field (car __raw_magnetic_field)))
       _raw_magnetic_field)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _accelerometer
    1
    ;; bool _gyroscope
    1
    ;; bool _magnetometer
    1
    ;; geometry_msgs/Vector3 _raw_linear_acceleration
    (send _raw_linear_acceleration :serialization-length)
    ;; geometry_msgs/Vector3 _raw_angular_velocity
    (send _raw_angular_velocity :serialization-length)
    ;; geometry_msgs/Vector3 _raw_magnetic_field
    (send _raw_magnetic_field :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _accelerometer
       (if _accelerometer (write-byte -1 s) (write-byte 0 s))
     ;; bool _gyroscope
       (if _gyroscope (write-byte -1 s) (write-byte 0 s))
     ;; bool _magnetometer
       (if _magnetometer (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Vector3 _raw_linear_acceleration
       (send _raw_linear_acceleration :serialize s)
     ;; geometry_msgs/Vector3 _raw_angular_velocity
       (send _raw_angular_velocity :serialize s)
     ;; geometry_msgs/Vector3 _raw_magnetic_field
       (send _raw_magnetic_field :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _accelerometer
     (setq _accelerometer (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _gyroscope
     (setq _gyroscope (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _magnetometer
     (setq _magnetometer (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Vector3 _raw_linear_acceleration
     (send _raw_linear_acceleration :deserialize buf ptr-) (incf ptr- (send _raw_linear_acceleration :serialization-length))
   ;; geometry_msgs/Vector3 _raw_angular_velocity
     (send _raw_angular_velocity :deserialize buf ptr-) (incf ptr- (send _raw_angular_velocity :serialization-length))
   ;; geometry_msgs/Vector3 _raw_magnetic_field
     (send _raw_magnetic_field :deserialize buf ptr-) (incf ptr- (send _raw_magnetic_field :serialization-length))
   ;;
   self)
  )

(setf (get zoo_imu::RawImu :md5sum-) "3bc0ea37781da51ad41a6868ff62faa9")
(setf (get zoo_imu::RawImu :datatype-) "zoo_imu/RawImu")
(setf (get zoo_imu::RawImu :definition-)
      "Header header
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
")



(provide :zoo_imu/RawImu "3bc0ea37781da51ad41a6868ff62faa9")


