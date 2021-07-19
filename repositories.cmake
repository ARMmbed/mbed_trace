#################################################################################
## Copyright 2020-2021 Pelion.
##
## SPDX-License-Identifier: Apache-2.0
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
#################################################################################

option(use_https "Use https" OFF)

if (use_https)
    set(nanostack_libservice_repo       https://github.com/PelionIoT/nanostack-libservice.git)
else()
    set(nanostack_libservice_repo       git@github.com:PelionIoT/nanostack-libservice.git)
endif()

#Googletest for testing
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.10.x.zip
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

FetchContent_Declare(nanostack_libservice_decl
    GIT_REPOSITORY      ${nanostack_libservice_repo}
    GIT_TAG             "cmake_refactor"
)

if (${CMAKE_PROJECT_NAME} STREQUAL "mbedTrace")
    FetchContent_MakeAvailable(nanostack_libservice_decl)
endif()