# PhiColTan Dockerfiles

> Personal Dockerfiles

## Getting started

```sh
# Check installation
docker run hello-world

# Build an image
docker build -f <path-to-Dockerfile> --tag myimage .
docker build -f <path-to-Dockerfile> --tag myimage:0.0.1 .

# List images in our computer
docker images

# Delete an image
docker rmi myimage

# Run an image
docker run myimage

# What is runnning
docker ps

# View all images processes
docker ps -a

# Start/Stop a container
docker start mycontainer
docker stop mycontainer

# Delete a process
docker rm mycontainer

# Map ports
docker run -p host-ip:docker-ip --name hello -d hello-world
docker run -d -p 80:80 docker/getting-started
```

## Cheatsheets

### SSH key for base

```sh
ssh-keygen -q -N '' -t ed25519 -f base/dotfiles/.ssh/docker.key -C "email@address.com"
```

### Building an image

```sh
# Build an image
docker build -f <path-to-Dockerfile> --tag myimage .
docker build -f <path-to-Dockerfile> --tag myimage:0.0.1 .

# List images in our computer
docker images

# Delete an image
docker rmi myimage

# Run an image
docker run myimage

# What is runnning
docker ps

# View all images processes
docker ps -a

# Start/Stop a container
docker start mycontainer
docker stop mycontainer

# Delete a process
docker rm mycontainer

# Map ports
docker run -p host-ip:docker-ip --name hello -d hello-world

# See logs from container
docker logs hello

# Follow logs
docker logs -f hello

docker stop hello
```

### Running a container

```sh
# How to create a terminal inside a Docker container that is already running a ROS node ?
docker exec -it <container> /bin/bash

# Check docker port mapping :
docker port <container>

# All data
docker inspect
```

### Networking

```sh
# MACVLAN or IPVLAN
# We give a subnet, a gateway, a ip range
# Must fit with the current router configuration + static IP information
# Docker is stupid, it can give the gateway as a client IP address
docker network create -d macvlan --subnet 192.168.0.0/24 --gateway 192.168.0.1 --ip-range 192.168.0.91/32 -o parent=<physical-interface-of-docker-host> <network-name>

docker run --name <name> --rm -it --ip <ip-address> --network <network-name> <image-id> <executed-program:/bin/bash>
```

## Sources

* [Networking in Compose](https://docs.docker.com/compose/networking/)
* [Networking in a macvlan network](https://docs.docker.com/network/network-tutorial-macvlan/)
