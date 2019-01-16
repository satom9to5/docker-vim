#!/bin/sh

DOCKER_IMAGE=alpine-vim-golang
MOUNT_DIR=${1:-${HOME}}

docker run -it --rm -v ${MOUNT_DIR}:/vim ${DOCKER_IMAGE} 
