#!/bin/bash

set -e

function print_header() {
    local title="$*"
    local width=80
    local padding=$((width - 2 - ${#title}))

    echo -n "╔"
    for ((i=0; i<width-2; i++)); do
        echo -n "═"
    done
    echo "╗"

    echo -n "║ $title"
    for ((i=0; i<padding-1; i++)); do
        echo -n " "
    done
    echo "║"

    echo -n "╚"
    for ((i=0; i<width-2; i++)); do
        echo -n "═"
    done
    echo "╝"
}

print_header "Runnin Ubuntu in a Docker contasiner"

image_name="ivanlemeshev/workspace"
container_name="ivanlemeshev_workspace"
hostname="workspace"

if [[ -z "$(docker images -q ${image_name} 2> /dev/null)" ]]; then
    print_header "Building image: ${image_name}"
    docker build -t "${image_name}" -f Dockerfile .
fi


if [[ -z "$(docker ps -aq -f name=${container_name} 2> /dev/null)" ]]; then
    print_header "Running the new container: ${container_name}"
    docker run -it -h "${hostname}" --name "${container_name}" "${image_name}"
else
    print_header "Running the existing container: ${container_name}"
    docker start -i "${container_name}"
fi
