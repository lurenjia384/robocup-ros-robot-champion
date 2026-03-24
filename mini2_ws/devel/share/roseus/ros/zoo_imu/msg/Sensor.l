;; Auto-generated. Do not edit!


(when (boundp 'zoo_imu::Sensor)
  (if (not (find-package "ZOO_IMU"))
    (make-package "ZOO_IMU"))
  (shadow 'Sensor (find-package "ZOO_IMU")))
(unless (find-package "ZOO_IMU::SENSOR")
  (make-package "ZOO_IMU::SENSOR"))

(in-package "ROS")
;;//! \htmlinclude Sensor.msg.html


(defclass zoo_imu::Sensor
  :super ros::object
  :slots (_ultra1 _ultra2 _ultra3 _ultra4 _grey_sensor _collision _voltage _current ))

(defmethod zoo_imu::Sensor
  (:init
   (&key
    ((:ultra1 __ultra1) 0)
    ((:ultra2 __ultra2) 0)
    ((:ultra3 __ultra3) 0)
    ((:ultra4 __ultra4) 0)
    ((:grey_sensor __grey_sensor) 0)
    ((:collision __collision) 0)
    ((:voltage __voltage) 0)
    ((:current __current) 0)
    )
   (send-super :init)
   (setq _ultra1 (round __ultra1))
   (setq _ultra2 (round __ultra2))
   (setq _ultra3 (round __ultra3))
   (setq _ultra4 (round __ultra4))
   (setq _grey_sensor (round __grey_sensor))
   (setq _collision (round __collision))
   (setq _voltage (round __voltage))
   (setq _current (round __current))
   self)
  (:ultra1
   (&optional __ultra1)
   (if __ultra1 (setq _ultra1 __ultra1)) _ultra1)
  (:ultra2
   (&optional __ultra2)
   (if __ultra2 (setq _ultra2 __ultra2)) _ultra2)
  (:ultra3
   (&optional __ultra3)
   (if __ultra3 (setq _ultra3 __ultra3)) _ultra3)
  (:ultra4
   (&optional __ultra4)
   (if __ultra4 (setq _ultra4 __ultra4)) _ultra4)
  (:grey_sensor
   (&optional __grey_sensor)
   (if __grey_sensor (setq _grey_sensor __grey_sensor)) _grey_sensor)
  (:collision
   (&optional __collision)
   (if __collision (setq _collision __collision)) _collision)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:serialization-length
   ()
   (+
    ;; int16 _ultra1
    2
    ;; int16 _ultra2
    2
    ;; int16 _ultra3
    2
    ;; int16 _ultra4
    2
    ;; int8 _grey_sensor
    1
    ;; int8 _collision
    1
    ;; int16 _voltage
    2
    ;; int16 _current
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _ultra1
       (write-word _ultra1 s)
     ;; int16 _ultra2
       (write-word _ultra2 s)
     ;; int16 _ultra3
       (write-word _ultra3 s)
     ;; int16 _ultra4
       (write-word _ultra4 s)
     ;; int8 _grey_sensor
       (write-byte _grey_sensor s)
     ;; int8 _collision
       (write-byte _collision s)
     ;; int16 _voltage
       (write-word _voltage s)
     ;; int16 _current
       (write-word _current s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _ultra1
     (setq _ultra1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _ultra2
     (setq _ultra2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _ultra3
     (setq _ultra3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _ultra4
     (setq _ultra4 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int8 _grey_sensor
     (setq _grey_sensor (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _grey_sensor 127) (setq _grey_sensor (- _grey_sensor 256)))
   ;; int8 _collision
     (setq _collision (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _collision 127) (setq _collision (- _collision 256)))
   ;; int16 _voltage
     (setq _voltage (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _current
     (setq _current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get zoo_imu::Sensor :md5sum-) "ae4bc18611c4c4b13dc973d79b08faf4")
(setf (get zoo_imu::Sensor :datatype-) "zoo_imu/Sensor")
(setf (get zoo_imu::Sensor :definition-)
      "int16 ultra1
int16 ultra2
int16 ultra3
int16 ultra4
int8 grey_sensor
int8 collision
int16 voltage
int16 current

")



(provide :zoo_imu/Sensor "ae4bc18611c4c4b13dc973d79b08faf4")


