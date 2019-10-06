#!/bin/bash
tag=$(git rev-parse HEAD)
image=$(grep AWS_ACCOUNT_NUMBER docker/web/development.env | cut -d= -f2-).dkr.ecr.us-east-1.amazonaws.com/chickpea-app

#build image
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .
