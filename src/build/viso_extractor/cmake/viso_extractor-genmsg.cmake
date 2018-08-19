# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "viso_extractor: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iviso_extractor:/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(viso_extractor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" NAME_WE)
add_custom_target(_viso_extractor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "viso_extractor" "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" "viso_extractor/pMatch:std_msgs/Float32:std_msgs/Int32"
)

get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" NAME_WE)
add_custom_target(_viso_extractor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "viso_extractor" "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" "std_msgs/Float32:std_msgs/Int32"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/viso_extractor
)
_generate_msg_cpp(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/viso_extractor
)

### Generating Services

### Generating Module File
_generate_module_cpp(viso_extractor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/viso_extractor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(viso_extractor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(viso_extractor_generate_messages viso_extractor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_cpp _viso_extractor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_cpp _viso_extractor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(viso_extractor_gencpp)
add_dependencies(viso_extractor_gencpp viso_extractor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS viso_extractor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/viso_extractor
)
_generate_msg_eus(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/viso_extractor
)

### Generating Services

### Generating Module File
_generate_module_eus(viso_extractor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/viso_extractor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(viso_extractor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(viso_extractor_generate_messages viso_extractor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_eus _viso_extractor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_eus _viso_extractor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(viso_extractor_geneus)
add_dependencies(viso_extractor_geneus viso_extractor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS viso_extractor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/viso_extractor
)
_generate_msg_lisp(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/viso_extractor
)

### Generating Services

### Generating Module File
_generate_module_lisp(viso_extractor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/viso_extractor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(viso_extractor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(viso_extractor_generate_messages viso_extractor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_lisp _viso_extractor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_lisp _viso_extractor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(viso_extractor_genlisp)
add_dependencies(viso_extractor_genlisp viso_extractor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS viso_extractor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/viso_extractor
)
_generate_msg_nodejs(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/viso_extractor
)

### Generating Services

### Generating Module File
_generate_module_nodejs(viso_extractor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/viso_extractor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(viso_extractor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(viso_extractor_generate_messages viso_extractor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_nodejs _viso_extractor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_nodejs _viso_extractor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(viso_extractor_gennodejs)
add_dependencies(viso_extractor_gennodejs viso_extractor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS viso_extractor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor
)
_generate_msg_py(viso_extractor
  "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor
)

### Generating Services

### Generating Module File
_generate_module_py(viso_extractor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(viso_extractor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(viso_extractor_generate_messages viso_extractor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/VisoFrame.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_py _viso_extractor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/viso_extractor/msg/pMatch.msg" NAME_WE)
add_dependencies(viso_extractor_generate_messages_py _viso_extractor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(viso_extractor_genpy)
add_dependencies(viso_extractor_genpy viso_extractor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS viso_extractor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/viso_extractor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/viso_extractor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(viso_extractor_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(viso_extractor_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(viso_extractor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/viso_extractor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/viso_extractor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(viso_extractor_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(viso_extractor_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(viso_extractor_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/viso_extractor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/viso_extractor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(viso_extractor_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(viso_extractor_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(viso_extractor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/viso_extractor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/viso_extractor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(viso_extractor_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(viso_extractor_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(viso_extractor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/viso_extractor/.+/__init__.pyc?$"
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(viso_extractor_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(viso_extractor_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(viso_extractor_generate_messages_py std_msgs_generate_messages_py)
endif()
