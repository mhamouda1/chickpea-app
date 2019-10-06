#!/bin/bash
tag=$(git rev-parse HEAD)
image=$(grep AWS_ACCOUNT_NUMBER docker/web/development.env | cut -d= -f2-).dkr.ecr.us-east-1.amazonaws.com/chickpea-app

#save variables
echo $tag > tag.txt
echo $image > image.txt

#build image
$(aws ecr get-login --no-include-email --region us-east-1)
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .
