;; Auto-generated. Do not edit!


(when (boundp 'waterplus_map_tools::SaveWaypoints)
  (if (not (find-package "WATERPLUS_MAP_TOOLS"))
    (make-package "WATERPLUS_MAP_TOOLS"))
  (shadow 'SaveWaypoints (find-package "WATERPLUS_MAP_TOOLS")))
(unless (find-package "WATERPLUS_MAP_TOOLS::SAVEWAYPOINTS")
  (make-package "WATERPLUS_MAP_TOOLS::SAVEWAYPOINTS"))
(unless (find-package "WATERPLUS_MAP_TOOLS::SAVEWAYPOINTSREQUEST")
  (make-package "WATERPLUS_MAP_TOOLS::SAVEWAYPOINTSREQUEST"))
(unless (find-package "WATERPLUS_MAP_TOOLS::SAVEWAYPOINTSRESPONSE")
  (make-package "WATERPLUS_MAP_TOOLS::SAVEWAYPOINTSRESPONSE"))

(in-package "ROS")





(defclass waterplus_map_tools::SaveWaypointsRequest
  :super ros::object
  :slots (_filename ))

(defmethod waterplus_map_tools::SaveWaypointsRequest
  (:init
   (&key
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _filename (string __filename))
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass waterplus_map_tools::SaveWaypointsResponse
  :super ros::object
  :slots ())

(defmethod waterplus_map_tools::SaveWaypointsResponse
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

(defclass waterplus_map_tools::SaveWaypoints
  :super ros::object
  :slots ())

(setf (get waterplus_map_tools::SaveWaypoints :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get waterplus_map_tools::SaveWaypoints :datatype-) "waterplus_map_tools/SaveWaypoints")
(setf (get waterplus_map_tools::SaveWaypoints :request) waterplus_map_tools::SaveWaypointsRequest)
(setf (get waterplus_map_tools::SaveWaypoints :response) waterplus_map_tools::SaveWaypointsResponse)

(defmethod waterplus_map_tools::SaveWaypointsRequest
  (:response () (instance waterplus_map_tools::SaveWaypointsResponse :init)))

(setf (get waterplus_map_tools::SaveWaypointsRequest :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get waterplus_map_tools::SaveWaypointsRequest :datatype-) "waterplus_map_tools/SaveWaypointsRequest")
(setf (get waterplus_map_tools::SaveWaypointsRequest :definition-)
      "string filename
---
")

(setf (get waterplus_map_tools::SaveWaypointsResponse :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get waterplus_map_tools::SaveWaypointsResponse :datatype-) "waterplus_map_tools/SaveWaypointsResponse")
(setf (get waterplus_map_tools::SaveWaypointsResponse :definition-)
      "string filename
---
")



(provide :waterplus_map_tools/SaveWaypoints "030824f52a0628ead956fb9d67e66ae9")


