cmake_minimum_required(VERSION 3.0.2)
project(camera_ros)

add_compile_options(-std=c++11)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  -std=c++0x")
set(CMAKE_CXX_FLAGS "-D_LINUX_")


find_package(catkin REQUIRED COMPONENTS
image_transport
message_generation
message_runtime
roscpp
sensor_msgs
std_msgs
nodelet
)

generate_messages(DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS image_transport message_generation roscpp sensor_msgs std_msgs nodelet
)


if (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    message("embed_platform on")
    add_definitions(-DTZTEK_V4L2_DMA)
    link_directories(/usr/lib/aarch64-linux-gnu/tegra/)
else()
    message("embed_platform off")
endif()

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PROJECT_SOURCE_DIR}/include
  ${PROJECT_SOURCE_DIR}/include/libyuv
)


add_executable(camera_ros src/main.cpp src/imgpublisher.cpp src/v4l2cam.cpp)
add_dependencies(camera_ros ${catkin_EXPORTED_TARGETS} ${${PROJECT_NAME}_EXPORTED_TARGETS})
target_link_libraries(camera_ros ${catkin_LIBRARIES}   pthread nvbuf_utils
${PROJECT_SOURCE_DIR}/lib/libyuv.so
)
if (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    target_link_libraries(camera_ros nvbuf_utils)
endif()


