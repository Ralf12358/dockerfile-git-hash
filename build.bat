@echo off

REM Set the Docker image name and tag
set IMAGE_NAME=myapp
set TAG=latest

REM Copy the .gitconfig file to the build context
copy %USERPROFILE%\.gitconfig .gitconfig

REM Build the Docker image
set DOCKER_BUILDKIT=1
docker build -t %IMAGE_NAME%:%TAG% .

REM Remove the copied .gitconfig file
del .gitconfig

echo Docker image %IMAGE_NAME%:%TAG% has been built successfully.
