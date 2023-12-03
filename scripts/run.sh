#!/bin/bash

##########################
# Runs the image locally #
##########################

NAME="hello-world"
PORT="80"

podman run -p ${PORT}:${PORT} -d ${NAME}:latest

echo "Server started... You can now call it with 'curl localhost:${PORT}'"
