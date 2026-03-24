;; Auto-generated. Do not edit!


(when (boundp 'astra_camera::SetDistortioncal)
  (if (not (find-package "ASTRA_CAMERA"))
    (make-package "ASTRA_CAMERA"))
  (shadow 'SetDistortioncal (find-package "ASTRA_CAMERA")))
(unless (find-package "ASTRA_CAMERA::SETDISTORTIONCAL")
  (make-package "ASTRA_CAMERA::SETDISTORTIONCAL"))
(unless (find-package "ASTRA_CAMERA::SETDISTORTIONCALREQUEST")
  (make-package "ASTRA_CAMERA::SETDISTORTIONCALREQUEST"))
(unless (find-package "ASTRA_CAMERA::SETDISTORTIONCALRESPONSE")
  (make-package "ASTRA_CAMERA::SETDISTORTIONCALRESPONSE"))

(in-package "ROS")





(defclass astra_camera::SetDistortioncalRequest
  :super ros::object
  :slots (_enable ))

(defmethod astra_camera::SetDistortioncalRequest
  (:init
   (&key
    ((:enable __enable) nil)
    )
   (send-super :init)
   (setq _enable __enable)
   self)
  (:enable
   (&optional __enable)
   (if __enable (setq _enable __enable)) _enable)
  (:serialization-length
   ()
   (+
    ;; bool _enable
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _enable
       (if _enable (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _enable
     (setq _enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass astra_camera::SetDistortioncalResponse
  :super ros::object
  :slots ())

(defmethod astra_camera::SetDistortioncalResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass astra_camera::SetDistortioncal
  :super ros::object
  :slots ())

(setf (get astra_camera::SetDistortioncal :md5sum-) "8c1211af706069c994c06e00eb59ac9e")
(setf (get astra_camera::SetDistortioncal :datatype-) "astra_camera/SetDistortioncal")
(setf (get astra_camera::SetDistortioncal :request) astra_camera::SetDistortioncalRequest)
(setf (get astra_camera::SetDistortioncal :response) astra_camera::SetDistortioncalResponse)

(defmethod astra_camera::SetDistortioncalRequest
  (:response () (instance astra_camera::SetDistortioncalResponse :init)))

(setf (get astra_camera::SetDistortioncalRequest :md5sum-) "8c1211af706069c994c06e00eb59ac9e")
(setf (get astra_camera::SetDistortioncalRequest :datatype-) "astra_camera/SetDistortioncalRequest")
(setf (get astra_camera::SetDistortioncalRequest :definition-)
      "bool enable
---
")

(setf (get astra_camera::SetDistortioncalResponse :md5sum-) "8c1211af706069c994c06e00eb59ac9e")
(setf (get astra_camera::SetDistortioncalResponse :datatype-) "astra_camera/SetDistortioncalResponse")
(setf (get astra_camera::SetDistortioncalResponse :definition-)
      "bool enable
---
")



(provide :astra_camera/SetDistortioncal "8c1211af706069c994c06e00eb59ac9e")


