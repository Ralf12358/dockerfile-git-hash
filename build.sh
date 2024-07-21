#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="myapp"
TAG="latest"

# Create ssh-agent script
cat << EOF > ssh-agent-script.sh
#!/bin/sh
eval \$(ssh-agent)
ssh-add ~/.ssh/id_rsa
EOF

# Build the Docker image
DOCKER_BUILDKIT=1 docker build \
  --ssh default \
  -t ${IMAGE_NAME}:${TAG} .

echo "Docker image ${IMAGE_NAME}:${TAG} has been built successfully."

# Clean up
rm ssh-agent-script.sh
