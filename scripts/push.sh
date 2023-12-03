#!/bin/bash

##################################################
# Uses Podman to build and push image to AWS ECR #
##################################################

REGION="eu-north-1"
NAME="hello-world"
ACCOUNT_NUMBER="123412341234"
AWS_ECR="${ACCOUNT_NUMBER}.dkr.ecr.${REGION}.amazonaws.com"

# Ensure the dependencies are in place
cd server
npm install
cd ..

# Login
aws ecr get-login-password --region ${REGION} | podman login --username AWS --password-stdin ${AWS_ECR}/${NAME}

# Build and push
podman build -t ${NAME} .
podman tag ${NAME}:latest ${AWS_ECR}/${NAME}:latest
podman push ${AWS_ECR}/${NAME}:latest
