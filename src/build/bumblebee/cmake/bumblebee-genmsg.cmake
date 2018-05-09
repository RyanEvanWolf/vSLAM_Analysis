# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bumblebee: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bumblebee_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" NAME_WE)
add_custom_target(_bumblebee_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bumblebee" "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" "sensor_msgs/RegionOfInterest"
)

get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" NAME_WE)
add_custom_target(_bumblebee_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bumblebee" "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" ""
)

get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" NAME_WE)
add_custom_target(_bumblebee_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bumblebee" "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" NAME_WE)
add_custom_target(_bumblebee_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bumblebee" "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" "sensor_msgs/RegionOfInterest:std_msgs/Header:sensor_msgs/CameraInfo"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee
)
_generate_srv_cpp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee
)
_generate_srv_cpp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee
)
_generate_srv_cpp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee
)

### Generating Module File
_generate_module_cpp(bumblebee
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bumblebee_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bumblebee_generate_messages bumblebee_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_cpp _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_cpp _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_cpp _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_cpp _bumblebee_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bumblebee_gencpp)
add_dependencies(bumblebee_gencpp bumblebee_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bumblebee_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee
)
_generate_srv_eus(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee
)
_generate_srv_eus(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee
)
_generate_srv_eus(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee
)

### Generating Module File
_generate_module_eus(bumblebee
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(bumblebee_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(bumblebee_generate_messages bumblebee_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_eus _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_eus _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_eus _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_eus _bumblebee_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bumblebee_geneus)
add_dependencies(bumblebee_geneus bumblebee_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bumblebee_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee
)
_generate_srv_lisp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee
)
_generate_srv_lisp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee
)
_generate_srv_lisp(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee
)

### Generating Module File
_generate_module_lisp(bumblebee
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bumblebee_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bumblebee_generate_messages bumblebee_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_lisp _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_lisp _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_lisp _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_lisp _bumblebee_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bumblebee_genlisp)
add_dependencies(bumblebee_genlisp bumblebee_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bumblebee_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee
)
_generate_srv_nodejs(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee
)
_generate_srv_nodejs(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee
)
_generate_srv_nodejs(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee
)

### Generating Module File
_generate_module_nodejs(bumblebee
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(bumblebee_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(bumblebee_generate_messages bumblebee_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_nodejs _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_nodejs _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_nodejs _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_nodejs _bumblebee_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bumblebee_gennodejs)
add_dependencies(bumblebee_gennodejs bumblebee_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bumblebee_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee
)
_generate_srv_py(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee
)
_generate_srv_py(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee
)
_generate_srv_py(bumblebee
  "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee
)

### Generating Module File
_generate_module_py(bumblebee
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bumblebee_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bumblebee_generate_messages bumblebee_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getOffset.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_py _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getQ.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_py _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getRectificationMap.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_py _bumblebee_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/bumblebee/srv/getCameraInfo.srv" NAME_WE)
add_dependencies(bumblebee_generate_messages_py _bumblebee_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bumblebee_genpy)
add_dependencies(bumblebee_genpy bumblebee_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bumblebee_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bumblebee
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(bumblebee_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(bumblebee_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(bumblebee_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bumblebee
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(bumblebee_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(bumblebee_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(bumblebee_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bumblebee
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(bumblebee_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(bumblebee_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(bumblebee_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bumblebee
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(bumblebee_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(bumblebee_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(bumblebee_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bumblebee
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(bumblebee_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(bumblebee_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(bumblebee_generate_messages_py geometry_msgs_generate_messages_py)
endif()
