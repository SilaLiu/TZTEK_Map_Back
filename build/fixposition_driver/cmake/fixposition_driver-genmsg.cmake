# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "fixposition_driver: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ifixposition_driver:/home/nvidia/catkin_ws/src/fixposition_driver/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/melodic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(fixposition_driver_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" NAME_WE)
add_custom_target(_fixposition_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fixposition_driver" "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" ""
)

get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" NAME_WE)
add_custom_target(_fixposition_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fixposition_driver" "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" "geometry_msgs/Twist:geometry_msgs/PoseWithCovariance:geometry_msgs/Vector3:geometry_msgs/Pose:geometry_msgs/TwistWithCovariance:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fixposition_driver
)
_generate_msg_cpp(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fixposition_driver
)

### Generating Services

### Generating Module File
_generate_module_cpp(fixposition_driver
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fixposition_driver
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(fixposition_driver_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(fixposition_driver_generate_messages fixposition_driver_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_cpp _fixposition_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_cpp _fixposition_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fixposition_driver_gencpp)
add_dependencies(fixposition_driver_gencpp fixposition_driver_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fixposition_driver_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fixposition_driver
)
_generate_msg_eus(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fixposition_driver
)

### Generating Services

### Generating Module File
_generate_module_eus(fixposition_driver
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fixposition_driver
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(fixposition_driver_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(fixposition_driver_generate_messages fixposition_driver_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_eus _fixposition_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_eus _fixposition_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fixposition_driver_geneus)
add_dependencies(fixposition_driver_geneus fixposition_driver_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fixposition_driver_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fixposition_driver
)
_generate_msg_lisp(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fixposition_driver
)

### Generating Services

### Generating Module File
_generate_module_lisp(fixposition_driver
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fixposition_driver
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(fixposition_driver_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(fixposition_driver_generate_messages fixposition_driver_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_lisp _fixposition_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_lisp _fixposition_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fixposition_driver_genlisp)
add_dependencies(fixposition_driver_genlisp fixposition_driver_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fixposition_driver_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fixposition_driver
)
_generate_msg_nodejs(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fixposition_driver
)

### Generating Services

### Generating Module File
_generate_module_nodejs(fixposition_driver
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fixposition_driver
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(fixposition_driver_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(fixposition_driver_generate_messages fixposition_driver_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_nodejs _fixposition_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_nodejs _fixposition_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fixposition_driver_gennodejs)
add_dependencies(fixposition_driver_gennodejs fixposition_driver_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fixposition_driver_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fixposition_driver
)
_generate_msg_py(fixposition_driver
  "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fixposition_driver
)

### Generating Services

### Generating Module File
_generate_module_py(fixposition_driver
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fixposition_driver
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(fixposition_driver_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(fixposition_driver_generate_messages fixposition_driver_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/Speed.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_py _fixposition_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/fixposition_driver/msg/VRTK.msg" NAME_WE)
add_dependencies(fixposition_driver_generate_messages_py _fixposition_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fixposition_driver_genpy)
add_dependencies(fixposition_driver_genpy fixposition_driver_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fixposition_driver_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fixposition_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fixposition_driver
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(fixposition_driver_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(fixposition_driver_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(fixposition_driver_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fixposition_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fixposition_driver
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(fixposition_driver_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(fixposition_driver_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(fixposition_driver_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fixposition_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fixposition_driver
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(fixposition_driver_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(fixposition_driver_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(fixposition_driver_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fixposition_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fixposition_driver
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(fixposition_driver_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(fixposition_driver_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(fixposition_driver_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fixposition_driver)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fixposition_driver\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fixposition_driver
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(fixposition_driver_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(fixposition_driver_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(fixposition_driver_generate_messages_py geometry_msgs_generate_messages_py)
endif()
