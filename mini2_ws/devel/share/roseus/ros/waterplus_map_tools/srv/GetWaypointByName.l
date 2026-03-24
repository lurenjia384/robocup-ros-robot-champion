;; Auto-generated. Do not edit!


(when (boundp 'waterplus_map_tools::GetWaypointByName)
  (if (not (find-package "WATERPLUS_MAP_TOOLS"))
    (make-package "WATERPLUS_MAP_TOOLS"))
  (shadow 'GetWaypointByName (find-package "WATERPLUS_MAP_TOOLS")))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYNAME")
  (make-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYNAME"))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYNAMEREQUEST")
  (make-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYNAMEREQUEST"))
(unless (find-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYNAMERESPONSE")
  (make-package "WATERPLUS_MAP_TOOLS::GETWAYPOINTBYNAMERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass waterplus_map_tools::GetWaypointByNameRequest
  :super ros::object
  :slots (_name ))

(defmethod waterplus_map_tools::GetWaypointByNameRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass waterplus_map_tools::GetWaypointByNameResponse
  :super ros::object
  :slots (_name _pose ))

(defmethod waterplus_map_tools::GetWaypointByNameResponse
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

(defclass waterplus_map_tools::GetWaypointByName
  :super ros::object
  :slots ())

(setf (get waterplus_map_tools::GetWaypointByName :md5sum-) "5164dc1f215ac8183cbe49b46c7ff40e")
(setf (get waterplus_map_tools::GetWaypointByName :datatype-) "waterplus_map_tools/GetWaypointByName")
(setf (get waterplus_map_tools::GetWaypointByName :request) waterplus_map_tools::GetWaypointByNameRequest)
(setf (get waterplus_map_tools::GetWaypointByName :response) waterplus_map_tools::GetWaypointByNameResponse)

(defmethod waterplus_map_tools::GetWaypointByNameRequest
  (:response () (instance waterplus_map_tools::GetWaypointByNameResponse :init)))

(setf (get waterplus_map_tools::GetWaypointByNameRequest :md5sum-) "5164dc1f215ac8183cbe49b46c7ff40e")
(setf (get waterplus_map_tools::GetWaypointByNameRequest :datatype-) "waterplus_map_tools/GetWaypointByNameRequest")
(setf (get waterplus_map_tools::GetWaypointByNameRequest :definition-)
      "string name
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

(setf (get waterplus_map_tools::GetWaypointByNameResponse :md5sum-) "5164dc1f215ac8183cbe49b46c7ff40e")
(setf (get waterplus_map_tools::GetWaypointByNameResponse :datatype-) "waterplus_map_tools/GetWaypointByNameResponse")
(setf (get waterplus_map_tools::GetWaypointByNameResponse :definition-)
      "string name
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



(provide :waterplus_map_tools/GetWaypointByName "5164dc1f215ac8183cbe49b46c7ff40e")


