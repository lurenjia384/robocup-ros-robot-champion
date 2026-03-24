;; Auto-generated. Do not edit!


(when (boundp 'waterplus_map_tools::GetWaypointByIndex)
  (if (not (find-package "WATERPLUS_MAP_TOOLS"))
    (make-package "WATERPLUS_MAP_TOOLS"))
  (shadow 'GetWaypointByIndex (find-package "WATERPLUS_MAP_TOOLS")))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYINDEX")
  (make-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYINDEX"))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYINDEXREQUEST")
  (make-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYINDEXREQUEST"))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYINDEXRESPONSE")
  (make-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYINDEXRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass waterplus_map_tools::GetWaypointByIndexRequest
  :super ros::object
  :slots (_index ))

(defmethod waterplus_map_tools::GetWaypointByIndexRequest
  (:init
   (&key
    ((:index __index) 0)
    )
   (send-super :init)
   (setq _index (round __index))
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:serialization-length
   ()
   (+
    ;; int32 _index
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _index
       (write-long _index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _index
     (setq _index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass waterplus_map_tools::GetWaypointByIndexResponse
  :super ros::object
  :slots (_name _pose ))

(defmethod waterplus_map_tools::GetWaypointByIndexResponse
  (:init
   (&key
    ((:name __name) "")
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _pose __pose)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass waterplus_map_tools::GetWaypointByIndex
  :super ros::object
  :slots ())

(setf (get waterplus_map_tools::GetWaypointByIndex :md5sum-) "3d6fa8d914cdbd6f782b3a98c909799f")
(setf (get waterplus_map_tools::GetWaypointByIndex :datatype-) "waterplus_map_tools/GetWaypointByIndex")
(setf (get waterplus_map_tools::GetWaypointByIndex :request) waterplus_map_tools::GetWaypointByIndexRequest)
(setf (get waterplus_map_tools::GetWaypointByIndex :response) waterplus_map_tools::GetWaypointByIndexResponse)

(defmethod waterplus_map_tools::GetWaypointByIndexRequest
  (:response () (instance waterplus_map_tools::GetWaypointByIndexResponse :init)))

(setf (get waterplus_map_tools::GetWaypointByIndexRequest :md5sum-) "3d6fa8d914cdbd6f782b3a98c909799f")
(setf (get waterplus_map_tools::GetWaypointByIndexRequest :datatype-) "waterplus_map_tools/GetWaypointByIndexRequest")
(setf (get waterplus_map_tools::GetWaypointByIndexRequest :definition-)
      "int32 index
---
string name
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get waterplus_map_tools::GetWaypointByIndexResponse :md5sum-) "3d6fa8d914cdbd6f782b3a98c909799f")
(setf (get waterplus_map_tools::GetWaypointByIndexResponse :datatype-) "waterplus_map_tools/GetWaypointByIndexResponse")
(setf (get waterplus_map_tools::GetWaypointByIndexResponse :definition-)
      "int32 index
---
string name
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :waterplus_map_tools/GetWaypointByIndex "3d6fa8d914cdbd6f782b3a98c909799f")


