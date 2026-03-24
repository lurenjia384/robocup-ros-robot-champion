# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "zoo_imu: 2 messages, 0 services")

set(MSG_I_FLAGS "-Izoo_imu:/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(zoo_imu_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" NAME_WE)
add_custom_target(_zoo_imu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "zoo_imu" "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" ""
)

get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" NAME_WE)
add_custom_target(_zoo_imu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "zoo_imu" "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zoo_imu
)
_generate_msg_cpp(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zoo_imu
)

### Generating Services

### Generating Module File
_generate_module_cpp(zoo_imu
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zoo_imu
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(zoo_imu_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(zoo_imu_generate_messages zoo_imu_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_cpp _zoo_imu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_cpp _zoo_imu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zoo_imu_gencpp)
add_dependencies(zoo_imu_gencpp zoo_imu_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zoo_imu_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zoo_imu
)
_generate_msg_eus(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zoo_imu
)

### Generating Services

### Generating Module File
_generate_module_eus(zoo_imu
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zoo_imu
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(zoo_imu_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(zoo_imu_generate_messages zoo_imu_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_eus _zoo_imu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_eus _zoo_imu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zoo_imu_geneus)
add_dependencies(zoo_imu_geneus zoo_imu_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zoo_imu_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zoo_imu
)
_generate_msg_lisp(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zoo_imu
)

### Generating Services

### Generating Module File
_generate_module_lisp(zoo_imu
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zoo_imu
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(zoo_imu_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(zoo_imu_generate_messages zoo_imu_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_lisp _zoo_imu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_lisp _zoo_imu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zoo_imu_genlisp)
add_dependencies(zoo_imu_genlisp zoo_imu_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zoo_imu_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zoo_imu
)
_generate_msg_nodejs(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zoo_imu
)

### Generating Services

### Generating Module File
_generate_module_nodejs(zoo_imu
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zoo_imu
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(zoo_imu_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(zoo_imu_generate_messages zoo_imu_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_nodejs _zoo_imu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_nodejs _zoo_imu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zoo_imu_gennodejs)
add_dependencies(zoo_imu_gennodejs zoo_imu_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zoo_imu_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zoo_imu
)
_generate_msg_py(zoo_imu
  "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zoo_imu
)

### Generating Services

### Generating Module File
_generate_module_py(zoo_imu
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zoo_imu
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(zoo_imu_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(zoo_imu_generate_messages zoo_imu_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/Sensor.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_py _zoo_imu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bcsh/mini2_ws/src/robot_base/zoo_imu/msg/RawImu.msg" NAME_WE)
add_dependencies(zoo_imu_generate_messages_py _zoo_imu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(zoo_imu_genpy)
add_dependencies(zoo_imu_genpy zoo_imu_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS zoo_imu_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zoo_imu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/zoo_imu
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(zoo_imu_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(zoo_imu_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zoo_imu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/zoo_imu
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(zoo_imu_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(zoo_imu_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zoo_imu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/zoo_imu
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(zoo_imu_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(zoo_imu_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zoo_imu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/zoo_imu
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(zoo_imu_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(zoo_imu_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zoo_imu)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zoo_imu\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/zoo_imu
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(zoo_imu_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(zoo_imu_generate_messages_py geometry_msgs_generate_messages_py)
endif()
