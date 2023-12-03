#!/bin/bash

#################################################################
# Installs k6 (https://k6.io) and Podman (https://podman.io)    #
# Assumes you are running a Mac with Homebrew (https://brew.sh) #
#################################################################

brew install k6

brew install podman
podman machine init
podman machine start
podman info
