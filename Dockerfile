# Stage 1: Build stage
FROM ubuntu:22.04 AS builder

# Install git and any other necessary build tools
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /build

# Clone the specific git hash (replace with your repository URL and desired hash)
# Adjust the repository URL and hash as needed
RUN git clone --depth 1 --branch <specific-hash> https://github.com/username/repository.git .

# Install Python and pip if not already in the base image
RUN apt-get install -y python3 python3-pip

# Install requirements
RUN pip3 install -r requirements.txt

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

# You can provide runtime and development environments by using ARG and ENV
# For example:
# ARG ENV=production
# ENV APP_ENV=${ENV}
# This allows you to build different images for different environments:
# docker build --build-arg ENV=development -t myapp:dev .
# docker build --build-arg ENV=production -t myapp:prod .
