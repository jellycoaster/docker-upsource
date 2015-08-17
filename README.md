# docker-upsource
Docker Automation Build File for Jetbrains [Upsource](https://www.jetbrains.com/upsource/)

Docker Image Container based on [Ubuntu 14.04 LTS](http://www.ubuntu.com/) and [Oracle Java 8](https://www.java.com/)

# Build Image with Dockerfile
##1. Install Docker
First, [Install Docker](https://docs.docker.com/installation/) Accroding to OS Platform

##2. Build Dockerfile
```
$ docker build -t={DOCKER_IMAGE_NAME} .
```
# Run Docker Container with Image
```
$ docker run --name={DOCKER_CONTAINER_NAME} -d -p {HOST_PORT}:8090 {DOCKER_IMAGE_NAME}
```
