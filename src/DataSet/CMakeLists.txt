 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/DataSet)	


set(Analyze_Sources AnalyseFeatures.cpp AnalyseDetector.cpp AnalyseDetectorDataset.cpp)


add_executable(getDataFeatures ${CMAKE_CURRENT_LIST_DIR}/bin/getDataFeatures.cpp ${Analyze_Sources})
target_link_libraries(getDataFeatures
    ${Structures_LIBS}
    ${OpenCV_LIBS}
    )
