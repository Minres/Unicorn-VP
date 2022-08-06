#
# Copyright (c) 2022 MINRES Technolgies GmbH
#
# SPDX-License-Identifier: Apache-2.0
#

option(UPDATE_UNICORN_SRC "Always update the unicorn engine library" OFF)

include(FetchContent)
FetchContent_Declare(
 	unicorn_git
    #GIT_REPOSITORY "https://github.com/unicorn-engine/unicorn.git"
    #GIT_TAG        "origin/master"
    #GIT_SHALLOW    ON
    GIT_REPOSITORY "https://github.com/Minres/unicorn.git"
    GIT_TAG        "origin/master"
  	UPDATE_DISCONNECTED NOT ${UPDATE_UNICORN_SRC} # When enabled, this option causes the update step to be skipped.
)
FetchContent_Populate(unicorn_git)
add_custom_command(
	OUTPUT ${unicorn_git_BINARY_DIR}/lib/libunicorn.so
	COMMAND ${CMAKE_COMMAND}
	ARGS -S ${unicorn_git_SOURCE_DIR} -B ${unicorn_git_SOURCE_DIR}/build -DCMAKE_INSTALL_PREFIX=${unicorn_git_BINARY_DIR} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	COMMAND ${CMAKE_COMMAND}
	ARGS --build ${unicorn_git_SOURCE_DIR}/build --target install
	DEPENDS ${unicorn_git_SOURCE_DIR})
add_custom_target(unicorn_build  DEPENDS ${unicorn_git_BINARY_DIR}/lib/libunicorn.so)

add_library (unicorn INTERFACE) #SHARED IMPORTED)
add_dependencies(unicorn unicorn_build)
target_include_directories(unicorn INTERFACE ${unicorn_git_BINARY_DIR}/include)
target_link_libraries(unicorn INTERFACE ${unicorn_git_BINARY_DIR}/lib/libunicorn.so)
