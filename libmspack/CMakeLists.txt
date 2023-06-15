cmake_minimum_required(VERSION 3.22)

project(mspack C)

if (WIN32)
  set(CMAKE_SHARED_LIBRARY_PREFIX "lib")
  set(CMAKE_STATIC_LIBRARY_PREFIX "lib")
endif()

file(GLOB_RECURSE HEADER_FILES FOLLOW_SYMLINKS ${PROJECT_SOURCE_DIR}/mspack/*.h)
file(GLOB_RECURSE SRC_FILES FOLLOW_SYMLINKS ${PROJECT_SOURCE_DIR}/mspack/*.c)
list(REMOVE_ITEM SRC_FILES "${PROJECT_SOURCE_DIR}/mspack/debug.c")

source_group(TREE "${PROJECT_SOURCE_DIR}" PREFIX "Header Files" FILES ${HEADER_FILES})
source_group(TREE "${PROJECT_SOURCE_DIR}" PREFIX "Source Files" FILES ${SRC_FILES})

include_directories(${PROJECT_SOURCE_DIR}/mspack)

if (BUILD_SHARED_LIBS)
  add_library(mspack SHARED ${HEADER_FILES} ${SRC_FILES})
else()
  add_library(mspack STATIC ${HEADER_FILES} ${SRC_FILES})
endif()
