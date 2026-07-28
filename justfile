default:
    @just --list

DEV_IMAGE_NAME := "balolo-dev" # if changing this, also update .devcontainer/devcontainer.json
EXECUTABLE_NAME:= "hello-world" # if changing this, also update the CMakeLists.txt file 

# Container commands, run from the host machine

build-dev-container:
    podman build \
        --tag {{DEV_IMAGE_NAME}} \
        --file Containerfile.dev .

start-dev-container: build-dev-container
    podman run --rm -it \
        --userns=keep-id \
        --volume {{justfile_directory()}}:/workspace:Z \
        --workdir /workspace \
        {{DEV_IMAGE_NAME}}


# Projects commands, run from inside the container 

build:
    cmake -S {{justfile_directory()}} -B build -G Ninja && \
    cmake --build build

run: build
    {{justfile_directory()}}/build/{{EXECUTABLE_NAME}}
