@echo off

REM Set the Docker image name and tag
set IMAGE_NAME=myapp
set TAG=latest

REM Build the Docker image
docker build -t %IMAGE_NAME%:%TAG% .

echo Docker image %IMAGE_NAME%:%TAG% has been built successfully.
