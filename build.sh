#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="myapp"
TAG="latest"

# Build the Docker image
docker build -t ${IMAGE_NAME}:${TAG} .

echo "Docker image ${IMAGE_NAME}:${TAG} has been built successfully."
