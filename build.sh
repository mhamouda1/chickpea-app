#!/bin/bash
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region us-east-1

#test

echo $AWS_ACCESS_KEY_ID > blah.txt

tag=$(git rev-parse HEAD)
# echo $tag
# image=$(ruby -e "puts '`cat docker-compose.yml | grep amazon`'.split(' ').last.split(':').first")
image=482459285219.dkr.ecr.us-east-1.amazonaws.com/chickpea-app

#build image
docker build -t $image:$tag -t $image:latest -f docker/web/Dockerfile .

#run tests
docker-compose run web bash -c "rake db:create && rake db:migrate && rake"

#upload to ECR
sudo $(aws ecr get-login --no-include-email --region us-east-1)
sudo docker push $image:$tag
sudo docker push $image
