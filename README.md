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