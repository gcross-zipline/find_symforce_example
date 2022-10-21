cmake_minimum_required(VERSION 3.11)
project(symforce_test)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
include(AddThirdParty.cmake)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
find_package(Symforce REQUIRED)

add_executable(test test.cc)
add_dependencies(test fmt::fmt spdlog::spdlog symforce::gen symforce::cholesky symforce::opt)
target_link_libraries(test symforce::gen symforce::cholesky symforce::opt)
