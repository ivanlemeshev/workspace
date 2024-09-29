#!/bin/bash

set -e

source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/functions/print_header.sh"

print_header "Cleaning up workspace"

docker stop "${container_name}"
docker rm "${container_name}"
docker rmi "${image_name}"
