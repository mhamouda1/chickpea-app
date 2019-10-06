#!/bin/bash
tag=$GIT_COMMIT
image=$(ruby -e "puts '`cat docker-compose.yml | grep amazon`'.split(' ').last.split(':').first")


#build image
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .

#run tests
docker-compose run web bash -c "rake db:create && rake db:migrate && rake"

#upload to ECR
sudo $(aws ecr get-login --no-include-email --region us-east-1)
sudo docker push $image:$tag
sudo docker push $image
