;; Auto-generated. Do not edit!


(when (boundp 'waterplus_map_tools::AddNewWaypoint)
  (if (not (find-package "WATERPLUS_MAP_TOOLS"))
    (make-package "WATERPLUS_MAP_TOOLS"))
  (shadow 'AddNewWaypoint (find-package "WATERPLUS_MAP_TOOLS")))
(unless (find-package "WATERPLUS_MAP_TOOLS::ADDNEWWAYPOINT")
  (make-package "WATERPLUS_MAP_TOOLS::ADDNEWWAYPOINT"))
(unless (find-package "WATERPLUS_MAP_TOOLS::ADDNEWWAYPOINTREQUEST")
  (make-package "WATERPLUS_MAP_TOOLS::ADDNEWWAYPOINTREQUEST"))
(unless (find-package "WATERPLUS_MAP_TOOLS::ADDNEWWAYPOINTRESPONSE")
  (make-package "WATERPLUS_MAP_TOOLS::ADDNEWWAYPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass waterplus_map_tools::AddNewWaypointRequest
  :super ros::object
  :slots (_name _pose ))

(defmethod waterplus_map_tools::AddNewWaypointRequest
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

(defclass waterplus_map_tools::AddNewWaypointResponse
  :super ros::object
  :slots (_result ))

(defmethod waterplus_map_tools::AddNewWaypointResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass waterplus_map_tools::AddNewWaypoint
  :super ros::object
  :slots ())

(setf (get waterplus_map_tools::AddNewWaypoint :md5sum-) "6948a8f076727d2b3b462b6ca2b31b5f")
(setf (get waterplus_map_tools::AddNewWaypoint :datatype-) "waterplus_map_tools/AddNewWaypoint")
(setf (get waterplus_map_tools::AddNewWaypoint :request) waterplus_map_tools::AddNewWaypointRequest)
(setf (get waterplus_map_tools::AddNewWaypoint :response) waterplus_map_tools::AddNewWaypointResponse)

(defmethod waterplus_map_tools::AddNewWaypointRequest
  (:response () (instance waterplus_map_tools::AddNewWaypointResponse :init)))

(setf (get waterplus_map_tools::AddNewWaypointRequest :md5sum-) "6948a8f076727d2b3b462b6ca2b31b5f")
(setf (get waterplus_map_tools::AddNewWaypointRequest :datatype-) "waterplus_map_tools/AddNewWaypointRequest")
(setf (get waterplus_map_tools::AddNewWaypointRequest :definition-)
      "string name
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
---
bool result
")

(setf (get waterplus_map_tools::AddNewWaypointResponse :md5sum-) "6948a8f076727d2b3b462b6ca2b31b5f")
(setf (get waterplus_map_tools::AddNewWaypointResponse :datatype-) "waterplus_map_tools/AddNewWaypointResponse")
(setf (get waterplus_map_tools::AddNewWaypointResponse :definition-)
      "string name
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
---
bool result
")



(provide :waterplus_map_tools/AddNewWaypoint "6948a8f076727d2b3b462b6ca2b31b5f")


