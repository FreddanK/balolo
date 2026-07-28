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

find_program(CLANG_TIDY clang-tidy REQUIRED)

set(CMAKE_CXX_CLANG_TIDY
    "${CLANG_TIDY}"
)

add_compile_options(-Wall -Wextra -Wpedantic -Werror -Wshadow -Wconversion -Wsign-conversion)
add_executable(hello-world
    src/main.cpp
)
