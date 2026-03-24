;; Auto-generated. Do not edit!


(when (boundp 'waterplus_map_tools::GetNumOfWaypoints)
  (if (not (find-package "WATERPLUS_MAP_TOOLS"))
    (make-package "WATERPLUS_MAP_TOOLS"))
  (shadow 'GetNumOfWaypoints (find-package "WATERPLUS_MAP_TOOLS")))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETNUMOFWAYPOINTS")
  (make-package "WATERPLUS_MAP_TOOLS::GETNUMOFWAYPOINTS"))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETNUMOFWAYPOINTSREQUEST")
  (make-package "WATERPLUS_MAP_TOOLS::GETNUMOFWAYPOINTSREQUEST"))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETNUMOFWAYPOINTSRESPONSE")
  (make-package "WATERPLUS_MAP_TOOLS::GETNUMOFWAYPOINTSRESPONSE"))

(in-package "ROS")





(defclass waterplus_map_tools::GetNumOfWaypointsRequest
  :super ros::object
  :slots ())

(defmethod waterplus_map_tools::GetNumOfWaypointsRequest
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

(defclass waterplus_map_tools::GetNumOfWaypointsResponse
  :super ros::object
  :slots (_num ))

(defmethod waterplus_map_tools::GetNumOfWaypointsResponse
  (:init
   (&key
    ((:num __num) 0)
    )
   (send-super :init)
   (setq _num (round __num))
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:serialization-length
   ()
   (+
    ;; int32 _num
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num
       (write-long _num s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass waterplus_map_tools::GetNumOfWaypoints
  :super ros::object
  :slots ())

(setf (get waterplus_map_tools::GetNumOfWaypoints :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get waterplus_map_tools::GetNumOfWaypoints :datatype-) "waterplus_map_tools/GetNumOfWaypoints")
(setf (get waterplus_map_tools::GetNumOfWaypoints :request) waterplus_map_tools::GetNumOfWaypointsRequest)
(setf (get waterplus_map_tools::GetNumOfWaypoints :response) waterplus_map_tools::GetNumOfWaypointsResponse)

(defmethod waterplus_map_tools::GetNumOfWaypointsRequest
  (:response () (instance waterplus_map_tools::GetNumOfWaypointsResponse :init)))

(setf (get waterplus_map_tools::GetNumOfWaypointsRequest :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get waterplus_map_tools::GetNumOfWaypointsRequest :datatype-) "waterplus_map_tools/GetNumOfWaypointsRequest")
(setf (get waterplus_map_tools::GetNumOfWaypointsRequest :definition-)
      "---
int32 num
")

(setf (get waterplus_map_tools::GetNumOfWaypointsResponse :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get waterplus_map_tools::GetNumOfWaypointsResponse :datatype-) "waterplus_map_tools/GetNumOfWaypointsResponse")
(setf (get waterplus_map_tools::GetNumOfWaypointsResponse :definition-)
      "---
int32 num
")



(provide :waterplus_map_tools/GetNumOfWaypoints "54b3c80efd6fae6e6ffff8a4b9facd69")


