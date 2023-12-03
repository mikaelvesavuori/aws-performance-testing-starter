#!/bin/bash

######################################################
# Create an AWS ECR repository before pushing images #
######################################################

REGION="eu-north-1"
NAME="hello-world"

aws ecr create-repository --repository-name ${NAME} --region ${REGION}
