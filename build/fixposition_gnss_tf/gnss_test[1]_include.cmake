if(EXISTS "/home/nvidia/catkin_ws/build/fixposition_gnss_tf/gnss_test[1]_tests.cmake")
  include("/home/nvidia/catkin_ws/build/fixposition_gnss_tf/gnss_test[1]_tests.cmake")
else()
  add_test(gnss_test_NOT_BUILT gnss_test_NOT_BUILT)
endif()
