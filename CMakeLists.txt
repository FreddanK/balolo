cmake_minimum_required(VERSION 3.28)

project(
    Balolo
    VERSION 0.1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_CXX_SCAN_FOR_MODULES OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_program(CCACHE_PROGRAM ccache REQUIRED)

set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")

add_compile_options(-Wall -Wextra -Wpedantic -Werror -Wshadow -Wconversion -Wsign-conversion)

add_library(http_client STATIC src/http_client.cpp)
target_include_directories(http_client PUBLIC src)

add_executable(balolo src/main.cpp)
target_link_libraries(balolo PRIVATE http_client)

enable_testing()
find_package(GTest REQUIRED)
include(GoogleTest)

add_executable(balolo_tests tests/http_client_test.cpp)
target_link_libraries(balolo_tests PRIVATE http_client GTest::gtest_main)

gtest_discover_tests(balolo_tests)
