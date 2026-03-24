# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "apriltags2_ros: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iapriltags2_ros:/home/bcsh/mini2_ws/src/apriltags2_ros/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(apriltags2_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" NAME_WE)
add_custom_target(_apriltags2_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "apriltags2_ros" "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" "geometry_msgs/Pose:apriltags2_ros/AprilTagDetectionArray:geometry_msgs/PoseWithCovariance:sensor_msgs/CameraInfo:geometry_msgs/PoseWithCovarianceStamped:sensor_msgs/RegionOfInterest:std_msgs/Header:geometry_msgs/Quaternion:apriltags2_ros/AprilTagDetection:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" NAME_WE)
add_custom_target(_apriltags2_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "apriltags2_ros" "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" "geometry_msgs/PoseWithCovarianceStamped:geometry_msgs/Pose:geometry_msgs/PoseWithCovariance:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" NAME_WE)
add_custom_target(_apriltags2_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "apriltags2_ros" "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" "geometry_msgs/PoseWithCovarianceStamped:geometry_msgs/Pose:geometry_msgs/PoseWithCovariance:std_msgs/Header:geometry_msgs/Quaternion:apriltags2_ros/AprilTagDetection:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags2_ros
)
_generate_msg_cpp(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags2_ros
)

### Generating Services
_generate_srv_cpp(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags2_ros
)

### Generating Module File
_generate_module_cpp(apriltags2_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags2_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(apriltags2_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(apriltags2_ros_generate_messages apriltags2_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_cpp _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_cpp _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_cpp _apriltags2_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags2_ros_gencpp)
add_dependencies(apriltags2_ros_gencpp apriltags2_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags2_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags2_ros
)
_generate_msg_eus(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags2_ros
)

### Generating Services
_generate_srv_eus(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags2_ros
)

### Generating Module File
_generate_module_eus(apriltags2_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags2_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(apriltags2_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(apriltags2_ros_generate_messages apriltags2_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_eus _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_eus _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_eus _apriltags2_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags2_ros_geneus)
add_dependencies(apriltags2_ros_geneus apriltags2_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags2_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags2_ros
)
_generate_msg_lisp(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags2_ros
)

### Generating Services
_generate_srv_lisp(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags2_ros
)

### Generating Module File
_generate_module_lisp(apriltags2_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags2_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(apriltags2_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(apriltags2_ros_generate_messages apriltags2_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_lisp _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_lisp _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_lisp _apriltags2_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags2_ros_genlisp)
add_dependencies(apriltags2_ros_genlisp apriltags2_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags2_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apriltags2_ros
)
_generate_msg_nodejs(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apriltags2_ros
)

### Generating Services
_generate_srv_nodejs(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apriltags2_ros
)

### Generating Module File
_generate_module_nodejs(apriltags2_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apriltags2_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(apriltags2_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(apriltags2_ros_generate_messages apriltags2_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_nodejs _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_nodejs _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_nodejs _apriltags2_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags2_ros_gennodejs)
add_dependencies(apriltags2_ros_gennodejs apriltags2_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags2_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros
)
_generate_msg_py(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros
)

### Generating Services
_generate_srv_py(apriltags2_ros
  "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/CameraInfo.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovarianceStamped.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros
)

### Generating Module File
_generate_module_py(apriltags2_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(apriltags2_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(apriltags2_ros_generate_messages apriltags2_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/srv/AnalyzeSingleImage.srv" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_py _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_py _apriltags2_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/apriltags2_ros/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(apriltags2_ros_generate_messages_py _apriltags2_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags2_ros_genpy)
add_dependencies(apriltags2_ros_genpy apriltags2_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags2_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags2_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags2_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(apriltags2_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(apriltags2_ros_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(apriltags2_ros_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags2_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags2_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(apriltags2_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(apriltags2_ros_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(apriltags2_ros_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags2_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags2_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(apriltags2_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(apriltags2_ros_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(apriltags2_ros_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apriltags2_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apriltags2_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(apriltags2_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(apriltags2_ros_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(apriltags2_ros_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags2_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(apriltags2_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(apriltags2_ros_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(apriltags2_ros_generate_messages_py sensor_msgs_generate_messages_py)
endif()
