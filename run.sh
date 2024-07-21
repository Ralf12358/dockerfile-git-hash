#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="myapp"
TAG="latest"

# Run the Docker container and pass all additional arguments
docker run -it --rm ${IMAGE_NAME}:${TAG} "$@"
