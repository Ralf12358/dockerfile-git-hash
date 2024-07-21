# Stage 1: Build stage
FROM ubuntu:22.04 AS builder

# Install git and other necessary build tools
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /build

# Copy the .gitconfig file from the host
COPY .gitconfig /root/.gitconfig

# Clone only the specific commit with depth 1
RUN git clone --depth 1 --single-branch https://github.com/Ralf12358/reqver.git . && \
    git fetch --depth 1 origin e8f6f6f09b273f03b01ef01e1631bb3d1ef55f9b && \
    git checkout FETCH_HEAD

# Install Python and pip if not already in the base image
RUN apt-get install -y python3 python3-pip

# Install requirements
RUN pip3 install -r requirements.txt

# -----------------------------------------------------------------------------

# Stage 2: Runtime stage
FROM ubuntu:22.04

# Install Python runtime
RUN apt-get update && apt-get install -y python3

# Set the working directory in the container
WORKDIR /app

# Copy the repository from the builder stage
COPY --from=builder /build /app

# Specify the command to run on container start
# Adjust the command and script name as needed
ENTRYPOINT ["python3", "/app/your_script.py"]
