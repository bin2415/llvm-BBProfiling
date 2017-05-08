cmake_minimum_required(VERSION 3.1)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})
#add_compile_options(-std=C++11)

add_subdirectory(dynamic-inst)  # Use your pass name here.
add_subdirectory(dynamic-rt)
