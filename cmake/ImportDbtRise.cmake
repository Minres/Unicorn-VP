#
# Copyright (c) 20221 MINRES Technolgies GmbH
#
# SPDX-License-Identifier: Apache-2.0
#
cmake_minimum_required(VERSION 3.14)   # The FetchModule is only available since CMake 3.11.

option(UPDATE_DBT_RISE_SRC "Always update the SCC library" ON)

include(FetchContent)
FetchContent_Declare(
    dbt_rise_git
    GIT_REPOSITORY "https://github.com/Minres/DBT-RISE-Core.git"
    GIT_TAG        "origin/develop"
    GIT_SHALLOW    ON
  	UPDATE_DISCONNECTED NOT ${UPDATE_DBT_RISE_SRC} # When enabled, this option causes the update step to be skipped.
)
FetchContent_Populate(dbt_rise_git)
add_subdirectory(${dbt_rise_git_SOURCE_DIR} )
