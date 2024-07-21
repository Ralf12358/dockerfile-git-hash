@echo off

REM Set the Docker image name and tag
set IMAGE_NAME=myapp
set TAG=latest

REM Create ssh-agent script
(
echo #!/bin/sh
echo eval $$(ssh-agent^)
echo ssh-add ~/.ssh/id_rsa
) > ssh-agent-script.sh

REM Build the Docker image
set DOCKER_BUILDKIT=1
docker build --ssh default -t %IMAGE_NAME%:%TAG% .

echo Docker image %IMAGE_NAME%:%TAG% has been built successfully.

REM Clean up
del ssh-agent-script.sh
