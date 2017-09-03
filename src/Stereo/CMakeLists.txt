 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Stereo)	

add_executable(viewRect ${CMAKE_CURRENT_LIST_DIR}/bin/viewRectified.cpp ${CMAKE_CURRENT_LIST_DIR}/Utilities.cpp)
target_link_libraries(viewRect
	${Structures_LIBS}
    ${OpenCV_LIBS}
)

add_executable(saveRect ${CMAKE_CURRENT_LIST_DIR}/bin/saveRectified.cpp ${CMAKE_CURRENT_LIST_DIR}/Utilities.cpp)
target_link_libraries(saveRect
	${Structures_LIBS}
    ${OpenCV_LIBS}
)

add_executable(getFeatures ${CMAKE_CURRENT_LIST_DIR}/bin/getFeatures.cpp ${CMAKE_CURRENT_LIST_DIR}/Utilities.cpp)
target_link_libraries(getFeatures
	${Structures_LIBS}
	${vSLAM_FrontEnd_LIBS}
    ${OpenCV_LIBS}
)