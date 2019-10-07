#!/bin/bash -e
INPUT_ARTIFACTS_DIR=$(cat INPUT_ARTIFACTS_DIR.txt)
tag=$(git rev-parse HEAD)
image=$(cat $INPUT_ARTIFACTS_DIR/ecr/url.txt)

#save variables
echo $tag > tag.txt
echo $image > image.txt

#build image
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .
