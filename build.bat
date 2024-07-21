@echo off

REM Set the Docker image name and tag
set IMAGE_NAME=myapp
set TAG=latest

REM Get Git credentials from global config
for /f "tokens=*" %%a in ('git config --global user.name') do set GIT_USERNAME=%%a
for /f "tokens=*" %%a in ('git config --global user.password') do set GIT_PASSWORD=%%a

REM Check if credentials are set
if "%GIT_USERNAME%"=="" (
    echo Error: Git username not found in global config.
    echo Please set it using:
    echo git config --global user.name "Your Username"
    exit /b 1
)
if "%GIT_PASSWORD%"=="" (
    echo Error: Git password not found in global config.
    echo Please set it using:
    echo git config --global user.password "Your Password"
    exit /b 1
)

REM Build the Docker image
set DOCKER_BUILDKIT=1
docker build --build-arg GIT_USERNAME=%GIT_USERNAME% --build-arg GIT_PASSWORD=%GIT_PASSWORD% -t %IMAGE_NAME%:%TAG% .

echo Docker image %IMAGE_NAME%:%TAG% has been built successfully.
