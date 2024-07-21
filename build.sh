#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="myapp"
TAG="latest"

# Get Git credentials from global config
GIT_USERNAME=$(git config --global user.name)
GIT_PASSWORD=$(git config --global user.password)

# Check if credentials are set
if [ -z "$GIT_USERNAME" ] || [ -z "$GIT_PASSWORD" ]; then
    echo "Error: Git username or password not found in global config."
    echo "Please set them using:"
    echo "git config --global user.name \"Your Username\""
    echo "git config --global user.password \"Your Password\""
    exit 1
fi

# Build the Docker image
DOCKER_BUILDKIT=1 docker build \
  --build-arg GIT_USERNAME="${GIT_USERNAME}" \
  --build-arg GIT_PASSWORD="${GIT_PASSWORD}" \
  -t ${IMAGE_NAME}:${TAG} .

echo "Docker image ${IMAGE_NAME}:${TAG} has been built successfully."
