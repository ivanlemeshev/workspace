#!/bin/bash

# This option tells the shell to exit immediately if any command exits with a
# non-zero status.
set -e

source ./scripts/functions.sh

image_name="my/workspace"
container_name="my_workspace"

docker stop "${container_name}"
docker rm "${container_name}"
docker rmi "${image_name}"
