#!/bin/bash
#run tests
docker-compose run web bash -c "rake db:create && rake db:migrate && rake"

#get variables
tag=$(cat tag.txt)
image=$(cat image.txt)

#upload to ECR
$(aws ecr get-login --no-include-email --region us-east-1)
docker push $image:$tag
docker push $image
