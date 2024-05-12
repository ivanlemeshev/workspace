#!/bin/bash

# This option tells the shell to exit immediately if any command exits with a
# non-zero status.
set -e

image_name="ivanlemeshev/workspace"
container_name="ivanlemeshev_workspace"

docker stop "${container_name}"
docker rm "${container_name}"
docker rmi "${image_name}"
