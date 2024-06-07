#!/bin/bash
CONTAINER_NAME=$1

ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
docker run \
    -it \
    --network host \
    --privileged \
    --volume /dev:/dev \
    --volume /tmp/.x11-unix:/tmp/.x11-unix \
    --volume ~/.ssh/ssh_auth_sock:/ssh-agent \
    --env SSH_AUTH_SOCK=/ssh-agent \
    --env DISPLAY=$DISPLAY \
    --env TERM=xterm-256color \
    --rm \
    --name $CONTAINER_NAME \
    phicoltan:jammy \
    /bin/bash