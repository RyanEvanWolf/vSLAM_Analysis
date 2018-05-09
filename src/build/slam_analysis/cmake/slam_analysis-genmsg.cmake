# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "slam_analysis: 1 messages, 2 services")

set(MSG_I_FLAGS "-Islam_analysis:/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Ifront_end:/home/ryan/git/vSLAM_Analysis/src/front_end/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(slam_analysis_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" NAME_WE)
add_custom_target(_slam_analysis_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_analysis" "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" ""
)

get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" NAME_WE)
add_custom_target(_slam_analysis_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_analysis" "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" "front_end/Homography"
)

get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" NAME_WE)
add_custom_target(_slam_analysis_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slam_analysis" "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" "slam_analysis/plotFrame:front_end/Homography"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_analysis
)

### Generating Services
_generate_srv_cpp(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_analysis
)
_generate_srv_cpp(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg;/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_analysis
)

### Generating Module File
_generate_module_cpp(slam_analysis
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_analysis
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(slam_analysis_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(slam_analysis_generate_messages slam_analysis_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_cpp _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" NAME_WE)
add_dependencies(slam_analysis_generate_messages_cpp _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_cpp _slam_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_analysis_gencpp)
add_dependencies(slam_analysis_gencpp slam_analysis_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_analysis_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/slam_analysis
)

### Generating Services
_generate_srv_eus(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/slam_analysis
)
_generate_srv_eus(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg;/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/slam_analysis
)

### Generating Module File
_generate_module_eus(slam_analysis
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/slam_analysis
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(slam_analysis_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(slam_analysis_generate_messages slam_analysis_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_eus _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" NAME_WE)
add_dependencies(slam_analysis_generate_messages_eus _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_eus _slam_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_analysis_geneus)
add_dependencies(slam_analysis_geneus slam_analysis_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_analysis_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_analysis
)

### Generating Services
_generate_srv_lisp(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_analysis
)
_generate_srv_lisp(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg;/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_analysis
)

### Generating Module File
_generate_module_lisp(slam_analysis
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_analysis
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(slam_analysis_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(slam_analysis_generate_messages slam_analysis_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_lisp _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" NAME_WE)
add_dependencies(slam_analysis_generate_messages_lisp _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_lisp _slam_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_analysis_genlisp)
add_dependencies(slam_analysis_genlisp slam_analysis_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_analysis_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/slam_analysis
)

### Generating Services
_generate_srv_nodejs(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/slam_analysis
)
_generate_srv_nodejs(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg;/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/slam_analysis
)

### Generating Module File
_generate_module_nodejs(slam_analysis
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/slam_analysis
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(slam_analysis_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(slam_analysis_generate_messages slam_analysis_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_nodejs _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" NAME_WE)
add_dependencies(slam_analysis_generate_messages_nodejs _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_nodejs _slam_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_analysis_gennodejs)
add_dependencies(slam_analysis_gennodejs slam_analysis_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_analysis_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis
)

### Generating Services
_generate_srv_py(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis
)
_generate_srv_py(slam_analysis
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv"
  "${MSG_I_FLAGS}"
  "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg;/home/ryan/git/vSLAM_Analysis/src/front_end/msg/Homography.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis
)

### Generating Module File
_generate_module_py(slam_analysis
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(slam_analysis_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(slam_analysis_generate_messages slam_analysis_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/resetVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_py _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/msg/plotFrame.msg" NAME_WE)
add_dependencies(slam_analysis_generate_messages_py _slam_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ryan/git/vSLAM_Analysis/src/slam_analysis/srv/updatePoseVisual.srv" NAME_WE)
add_dependencies(slam_analysis_generate_messages_py _slam_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slam_analysis_genpy)
add_dependencies(slam_analysis_genpy slam_analysis_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slam_analysis_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_analysis)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slam_analysis
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(slam_analysis_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET front_end_generate_messages_cpp)
  add_dependencies(slam_analysis_generate_messages_cpp front_end_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/slam_analysis)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/slam_analysis
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(slam_analysis_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET front_end_generate_messages_eus)
  add_dependencies(slam_analysis_generate_messages_eus front_end_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_analysis)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slam_analysis
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(slam_analysis_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET front_end_generate_messages_lisp)
  add_dependencies(slam_analysis_generate_messages_lisp front_end_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/slam_analysis)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/slam_analysis
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(slam_analysis_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET front_end_generate_messages_nodejs)
  add_dependencies(slam_analysis_generate_messages_nodejs front_end_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slam_analysis/.+/__init__.pyc?$"
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(slam_analysis_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET front_end_generate_messages_py)
  add_dependencies(slam_analysis_generate_messages_py front_end_generate_messages_py)
endif()
