# eigen
find_package(Eigen3 QUIET)
if(NOT Eigen3_FOUND)
message(STATUS "Eigen3 not found, adding with FetchContent")
function(add_eigen)
    FetchContent_Declare(
    eigen3
    GIT_REPOSITORY https://gitlab.com/libeigen/eigen
    GIT_TAG 3147391d946bb4b6c68edd901f2add6ac1f31f8c  # release 3.4.0
    GIT_SHALLOW TRUE
    )

    set(EIGEN_BUILD_DOC OFF CACHE BOOL "Don't build Eigen docs")
    set(BUILD_TESTING OFF CACHE BOOL "Don't build Eigen tests")
    set(EIGEN_BUILD_PKGCONFIG OFF CACHE BOOL "Don't build Eigen pkg-config")
    FetchContent_MakeAvailable(eigen3)
endfunction()

add_eigen()

# Enable use of Eigen3_ROOT, which is necessary for sophus to be able to find Eigen when
# included this way
# See https://cmake.org/cmake/help/latest/policy/CMP0074.html
set(CMAKE_POLICY_DEFAULT_CMP0074 NEW CACHE STRING "" FORCE)
set(Eigen3_ROOT "${FETCHCONTENT_BASE_DIR}/eigen3-src" CACHE PATH "Phooey" FORCE)
else()
message(STATUS "Eigen found at ${Eigen3_DIR}")
endif()

# fmtlib
find_package(fmt REQUIRED)

# spdlog
find_package(spdlog 1.9.0 REQUIRED)

