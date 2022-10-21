# FindEigen.cmake
list(APPEND EIGEN_CHECK_INCLUDE_DIRS
    /usr/local/include
    /usr/include)

list(APPEND EIGEN_CHECK_PATH_SUFFIXES
    eigen3)

set(EIGEN_SIGNATURE signature_of_eigen3_matrix_library)

find_path(EIGEN_INCLUDE_DIR
    NAMES ${EIGEN_SIGNATURE}
    PATHS ${EIGEN_CHECK_INCLUDE_DIRS}
    PATH_SUFFIXES ${EIGEN_CHECK_PATH_SUFFIXES})

if (NOT EIGEN_INCLUDE_DIR OR NOT EXISTS ${EIGEN_INCLUDE_DIR})
  set(EIGEN_FOUND FALSE)
  message(WARNING "Failed to locate Eigen.")
else ()
  set(EIGEN_FOUND TRUE)
  message(STATUS "Eigen found: ${EIGEN_INCLUDE_DIR}")
endif ()

set(EIGEN_INCLUDE_DIRS ${EIGEN_INCLUDE_DIR})

# Create a target for eigen w/ the correct interface include directories.
# See https://pabloariasal.github.io/2018/02/19/its-time-to-do-cmake-right/
if (${EIGEN_FOUND})
  if (NOT TARGET Eigen::Eigen)
    add_library(Eigen::Eigen INTERFACE IMPORTED)
    set_target_properties(Eigen::Eigen PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${EIGEN_INCLUDE_DIRS}"
        )
  endif ()
endif ()