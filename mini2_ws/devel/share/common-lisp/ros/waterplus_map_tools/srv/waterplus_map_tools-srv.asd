
(cl:in-package :asdf)

(defsystem "waterplus_map_tools-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "AddNewWaypoint" :depends-on ("_package_AddNewWaypoint"))
    (:file "_package_AddNewWaypoint" :depends-on ("_package"))
    (:file "GetChargerByName" :depends-on ("_package_GetChargerByName"))
    (:file "_package_GetChargerByName" :depends-on ("_package"))
    (:file "GetNumOfWaypoints" :depends-on ("_package_GetNumOfWaypoints"))
    (:file "_package_GetNumOfWaypoints" :depends-on ("_package"))
    (:file "GetWaypointByIndex" :depends-on ("_package_GetWaypointByIndex"))
    (:file "_package_GetWaypointByIndex" :depends-on ("_package"))
    (:file "GetWaypointByName" :depends-on ("_package_GetWaypointByName"))
    (:file "_package_GetWaypointByName" :depends-on ("_package"))
    (:file "SaveWaypoints" :depends-on ("_package_SaveWaypoints"))
    (:file "_package_SaveWaypoints" :depends-on ("_package"))
  ))