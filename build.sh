#!/bin/bash
tag=$(git rev-parse HEAD)
image=$(ruby -e "puts '`cat docker-compose.yml | grep amazon`'.split(' ').last.split(':').first")

#build image
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .

#run tests
docker-compose run web bash -c "rake db:create && rake db:migrate && rake"

#upload to ECR
docker push $image:$tag
docker push $image
