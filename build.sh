#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="myapp"
TAG="latest"

# Copy the .gitconfig file to the build context
cp ~/.gitconfig .gitconfig

# Build the Docker image
DOCKER_BUILDKIT=1 docker build -t ${IMAGE_NAME}:${TAG} .

# Remove the copied .gitconfig file
rm .gitconfig

echo "Docker image ${IMAGE_NAME}:${TAG} has been built successfully."
