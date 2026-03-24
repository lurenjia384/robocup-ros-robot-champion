# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "waterplus_map_tools: 1 messages, 6 services")

set(MSG_I_FLAGS "-Iwaterplus_map_tools:/home/bcsh/mini2_ws/src/waterplus_map_tools/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(waterplus_map_tools_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" ""
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" ""
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" NAME_WE)
add_custom_target(_waterplus_map_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "waterplus_map_tools" "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)

### Generating Services
_generate_srv_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_cpp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
)

### Generating Module File
_generate_module_cpp(waterplus_map_tools
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(waterplus_map_tools_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(waterplus_map_tools_generate_messages waterplus_map_tools_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_cpp _waterplus_map_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(waterplus_map_tools_gencpp)
add_dependencies(waterplus_map_tools_gencpp waterplus_map_tools_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS waterplus_map_tools_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)

### Generating Services
_generate_srv_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_eus(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
)

### Generating Module File
_generate_module_eus(waterplus_map_tools
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(waterplus_map_tools_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(waterplus_map_tools_generate_messages waterplus_map_tools_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_eus _waterplus_map_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(waterplus_map_tools_geneus)
add_dependencies(waterplus_map_tools_geneus waterplus_map_tools_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS waterplus_map_tools_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)

### Generating Services
_generate_srv_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_lisp(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
)

### Generating Module File
_generate_module_lisp(waterplus_map_tools
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(waterplus_map_tools_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(waterplus_map_tools_generate_messages waterplus_map_tools_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_lisp _waterplus_map_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(waterplus_map_tools_genlisp)
add_dependencies(waterplus_map_tools_genlisp waterplus_map_tools_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS waterplus_map_tools_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)

### Generating Services
_generate_srv_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_nodejs(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
)

### Generating Module File
_generate_module_nodejs(waterplus_map_tools
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(waterplus_map_tools_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(waterplus_map_tools_generate_messages waterplus_map_tools_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_nodejs _waterplus_map_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(waterplus_map_tools_gennodejs)
add_dependencies(waterplus_map_tools_gennodejs waterplus_map_tools_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS waterplus_map_tools_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)

### Generating Services
_generate_srv_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)
_generate_srv_py(waterplus_map_tools
  "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
)

### Generating Module File
_generate_module_py(waterplus_map_tools
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(waterplus_map_tools_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(waterplus_map_tools_generate_messages waterplus_map_tools_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/msg/Waypoint.msg" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/SaveWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByIndex.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetNumOfWaypoints.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetWaypointByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/AddNewWaypoint.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/waterplus_map_tools/srv/GetChargerByName.srv" NAME_WE)
add_dependencies(waterplus_map_tools_generate_messages_py _waterplus_map_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(waterplus_map_tools_genpy)
add_dependencies(waterplus_map_tools_genpy waterplus_map_tools_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS waterplus_map_tools_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/waterplus_map_tools
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(waterplus_map_tools_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(waterplus_map_tools_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/waterplus_map_tools
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(waterplus_map_tools_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(waterplus_map_tools_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/waterplus_map_tools
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(waterplus_map_tools_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(waterplus_map_tools_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/waterplus_map_tools
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(waterplus_map_tools_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(waterplus_map_tools_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/waterplus_map_tools
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(waterplus_map_tools_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(waterplus_map_tools_generate_messages_py geometry_msgs_generate_messages_py)
endif()
