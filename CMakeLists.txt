 
cmake_minimum_required (VERSION 2.8)
project(vSLAM_Analysis)
#Version Numbers
set(CMAKE_VERBOSE_MAKEFILE TRUE)



include(${CMAKE_SOURCE_DIR}/cmake/StructuresConfig.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/vSLAM_FrontEndConfig.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/OpenCVConfig.cmake)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin CACHE FILEPATH  "Build binary directory")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib CACHE FILEPATH "build static libs directory")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib CACHE FILEPATH "Build Dynamic Libs directory")

list(APPEND CMAKE_MODULE_PATH  ${PROJECT_SOURCE_DIR}/cmake})




find_package(Boost REQUIRED)
find_package(Eigen3 REQUIRED)
#find_package(Pangolin REQUIRED)


#set(ORB_SLAM2_INCLUDE_DIR /home/ryan/OpenCV2_Builds/ORB_SLAM2/include;/home/ryan/OpenCV2_Builds/ORB_SLAM2;${EIGEN3_INCLUDE_DIR};
#${Pangolin_INCLUDE_DIRS})
#set(ORB_SLAM2_LIBRARIES_DIR /home/ryan/OpenCV2_Builds/ORB_SLAM2/lib)
#set(ORB_SLAM2_LIBS 
#	ORB_SLAM2
#	)


include_directories(
  include
  /usr/local/include
  ${Boost_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  ${Structures_INCLUDE_DIRS}
  ${vSLAM_FrontEnd_INCLUDE_DIRS}
#  ${ORB_SLAM2_INCLUDE_DIR}
)

#MESSAGE(STATUS "  " ${Structures_LIBRARIES_DIR})

link_directories(${Structures_LIBRARIES_DIR})
link_directories(${vSLAM_FrontEnd_LIBRARIES_DIR})
#link_directories(${ORB_SLAM2_LIBRARIES_DIR})
add_subdirectory(src)
