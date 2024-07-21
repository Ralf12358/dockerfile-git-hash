#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="myapp"
TAG="latest"

# Prompt for Git credentials
read -p "Enter your Git username: " GIT_USERNAME
read -sp "Enter your Git password: " GIT_PASSWORD
echo

# Build the Docker image
DOCKER_BUILDKIT=1 docker build \
  --build-arg GIT_USERNAME="${GIT_USERNAME}" \
  --build-arg GIT_PASSWORD="${GIT_PASSWORD}" \
  -t ${IMAGE_NAME}:${TAG} .

echo "Docker image ${IMAGE_NAME}:${TAG} has been built successfully."
