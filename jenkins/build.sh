#!/bin/bash
INPUT_ARTIFACTS_DIR=$(echo cat INPUT_ARTIFACTS_DIR.txt)
echo $INPUT_ARTIFACTS_DIR
tag=$(git rev-parse HEAD)
image=$(grep AWS_ACCOUNT_NUMBER docker/web/development.env | cut -d= -f2-).dkr.ecr.us-east-1.amazonaws.com/chickpea-app

#save variables
echo $tag > tag.txt
echo $image > image.txt

#build image
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .
