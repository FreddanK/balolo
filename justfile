default:
    @just --list

PROJECT_NAME := "balolo"
DEV_IMAGE_NAME := PROJECT_NAME + "-dev" # if changing this, also update .devcontainer/devcontainer.json
EXECUTABLE_NAME:= "hello-world" # if changing this, also update the CMakeLists.txt file 

# Container commands, run from the host machine

build-dev:
    podman build \
        --tag {{DEV_IMAGE_NAME}} \
        --file Containerfile.dev .

dev: build-dev
    podman run --rm -it \
        --userns=keep-id \
        --volume {{PROJECT_NAME}}-ccache:/.ccache/ccache:Z \
        --volume {{justfile_directory()}}:/workspace:Z \
        --workdir /workspace \
        {{DEV_IMAGE_NAME}}


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
