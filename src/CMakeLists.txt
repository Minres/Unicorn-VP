#
# Copyright (c) 2022 MINRES Technolgies GmbH
#
# SPDX-License-Identifier: Apache-2.0
#
cmake_minimum_required(VERSION 3.12)

project(unicornvp)

find_package(systemc-cci)
find_package(elfio)

add_executable(${PROJECT_NAME} sc_main.cpp testbench.cpp uart.cpp)
target_link_libraries(${PROJECT_NAME} dbt-rise-unicorn scc systemc-cci::systemc-cci elfio::elfio)