execute_process(COMMAND "/home/ryan/git/vSLAM_Analysis/src/build/viso_extractor/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ryan/git/vSLAM_Analysis/src/build/viso_extractor/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
