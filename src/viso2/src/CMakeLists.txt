 set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/viso2/)

 
add_executable(vis_exec
	bin/vis_exec.cpp
	)

target_link_libraries(vis_exec
	${OpenCV_LIBS}
	${Structures_LIBS}
	odomViso
)
