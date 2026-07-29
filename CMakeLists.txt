cmake_minimum_required(VERSION 3.28)

project(
    HelloWorld
    VERSION 0.1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_program(CCACHE_PROGRAM ccache REQUIRED)

set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")

add_compile_options(-Wall -Wextra -Wpedantic -Werror -Wshadow -Wconversion -Wsign-conversion)
add_executable(hello-world
    src/main.cpp
)
