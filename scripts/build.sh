#!/bin/bash

#################################
# Use Podman to build the image #
#################################

NAME="hello-world"

podman build -t ${NAME}:latest .
