# Stage 1: Build stage
FROM ubuntu:22.04 AS builder

# Install git and other necessary build tools
RUN apt-get update && apt-get install -y git

RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip

# Copy the .gitconfig file from the host
ARG GITCONFIG
COPY ${GITCONFIG} /root/.gitconfig

WORKDIR /build
RUN touch __init__.py

# Set the working directory
WORKDIR /build/reqver
RUN git clone --depth 1 --single-branch https://github.com/Ralf12358/reqver.git . && \
    git fetch --depth 1 origin e8f6f6f09b273f03b01ef01e1631bb3d1ef55f9b && \
    git checkout FETCH_HEAD

# -----------------------------------------------------------------------------

# Stage 2: Runtime stage
FROM ubuntu:22.04

# Install Python runtime
RUN apt-get update && apt-get install -y git

RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip

# Set the working directory in the container
WORKDIR /app

# Copy the repository from the builder stage
COPY --from=builder /build /app

RUN pip3 install -r /app/reqver/requirements.txt

# Specify the command to run on container start
# Adjust the command and script name as needed
ENTRYPOINT ["python3", "/app/reqver/reqver/cli.py"]
