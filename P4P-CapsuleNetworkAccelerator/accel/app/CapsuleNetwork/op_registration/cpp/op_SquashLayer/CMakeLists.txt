
cmake_minimum_required(VERSION 3.5)
project(SquashLayer)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(vart REQUIRED)
find_package(xir REQUIRED)

add_library(vart_op_imp_SquashLayer SHARED
    SquashLayer.cpp
)

target_include_directories(vart_op_imp_SquashLayer PRIVATE
    ${CMAKE_SYSROOT}/usr/include
    ${CMAKE_SYSROOT}/usr/include/vitis_ai_library
    ${CMAKE_SYSROOT}/usr/include/vitis_ai_runner_helper
)

target_link_libraries(vart_op_imp_SquashLayer
    vart-runner
    xir
    glog
)

vart_add_oplib(vart_op_imp_SquashLayer SquashLayer)

add_library(vart_op_imp_SquashLayer SHARED SquashLayer.cpp)

target_link_libraries(vart_op_imp_SquashLayer
	xir
	vart-runner
	glog
	)

install(TARGETS vart_op_imp_SquashLayer
    LIBRARY DESTINATION lib
)


