default:
    @just --list

PROJECT_NAME := "balolo"
EXECUTABLE_NAME:= "hello-world" # if changing this, also update the CMakeLists.txt file 

# Container commands, run from the host machine

build-dev:
    docker compose build dev

dev: build-dev
    docker compose run --rm dev bash


# Projects commands, run from inside the container 

clean: 
    rm -rf build

format:
    clang-format -i $(git ls-files --cached --others --exclude-standard -- '*.cpp' '*.h') --verbose

build: format
    cmake -S . -B build -G Ninja
    cmake --build build --verbose

run: build
    ./build/{{EXECUTABLE_NAME}}

tidy: format build
    clang-tidy -p build $(git ls-files --cached --others --exclude-standard -- '*.cpp')
