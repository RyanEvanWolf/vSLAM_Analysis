 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Stereo)	

add_executable(viewRect ${CMAKE_CURRENT_LIST_DIR}/bin/viewRectified.cpp ${CMAKE_CURRENT_LIST_DIR}/Utilities.cpp)
target_link_libraries(viewRect
	${Structures_LIBS}
    ${OpenCV_LIBS}
)