@echo off

REM Set the Docker image name and tag
set IMAGE_NAME=myapp
set TAG=latest

REM Prompt for Git credentials
set /p GIT_USERNAME=Enter your Git username: 
set /p GIT_PASSWORD=Enter your Git password: 

REM Build the Docker image
set DOCKER_BUILDKIT=1
docker build --build-arg GIT_USERNAME=%GIT_USERNAME% --build-arg GIT_PASSWORD=%GIT_PASSWORD% -t %IMAGE_NAME%:%TAG% .

echo Docker image %IMAGE_NAME%:%TAG% has been built successfully.
