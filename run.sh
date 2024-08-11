#!/bin/bash

set -e

source ./scripts/functions.sh

print_header "Runnin Ubuntu in a Docker contasiner"

image_name="my/workspace"
container_name="my_workspace"
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
