# Docker Challenge

This repo contains the solution for the docker-challenge by "https://hub.docker.com/r/mkassaian/docker-challenge"

## Solved Image

```
abhis6898/docker-challenge-solved-abhishek-sharma
```
## Setup
To run the image use the following command
```
docker run -d -p 80:80 abhis6898/docker-challenge-solved-abhishek-sharma
```
This will create the container and you can look at the output using
```
curl localhost:80
```

## Docker Compose
Download the file and run the docker-compose where the docker-compose.yml is saved
```
docker-compose up -d
```
This will run 2 containers, one with the above solved image and one with metrics-exporter. View the container out and metrics output using below respectively
```
curl localhost:80
curl localhost:9100/metrics
```
## Multi Architecture Setup
For the image to work on both amd64 & arm64 machines, I have setup the image as multi-architecture one

### Step 1
Setup buildx and emulator to be able to build the multi-architecture image. These setup will help to update the configuration for buildx as well
```
sudo modprobe binfmt_misc
docker run --rm --privileged tonistiigi/binfmt --install all
docker buildx rm mybuilder
docker buildx create --name mybuilder --use --driver docker-container
docker buildx inspect --bootstrap
```

### Step 2
Build a multi-arch image of our base image "mkassaian/docker-challenge". This image is currently present only in amd64, so we have to rebuild this image and re-setup the nginx and haproxy for the multi-arch setup
```
docker buildx build --platform linux/amd64,linux/arm64 -t abhis6898/docker-challenge-updated:latest . --push -f DockerfileBaseImage
```

### Step 3
We use this updated base image in our Docerfile and run the setup
```
docker buildx build --no-cache --platform linux/amd64,linux/arm64 -t abhis6898/docker-challenge-solved-abhishek-sharma:latest --push .
```