@echo off

REM Set the Docker image name and tag
set IMAGE_NAME=myapp
set TAG=latest

REM Run the Docker container and pass all additional arguments
docker run -it --rm %IMAGE_NAME%:%TAG% %*
