#
# Copyright (c) 2022 MINRES Technolgies GmbH
#
# SPDX-License-Identifier: Apache-2.0
#
add_custom_target(fw-riscv-hello-world
    COMMAND make
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/riscv/hello-world
    COMMENT "Building RISC-V firmware hello-world"
    BYPRODUCTS riscv/hello-world/hello
    USES_TERMINAL
)
