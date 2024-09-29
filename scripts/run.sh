#!/bin/bash

set -e

source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/functions/print_header.sh"

print_header "Runnin Ubuntu in a Docker contasiner"

if [[ -z "$(docker images -q ${image_name} 2>/dev/null)" ]]; then
    print_header "Building the image: ${image_name}"
    docker build -t "${image_name}" -f Dockerfile .
fi

if [[ -z "$(docker ps -aq -f name=${container_name} 2>/dev/null)" ]]; then
    print_header "Running the new container: ${container_name}"
    docker run -it -h "${hostname}" --name "${container_name}" "${image_name}"
else
    print_header "Running the existing container: ${container_name}"
    docker start -i "${container_name}"
fi
