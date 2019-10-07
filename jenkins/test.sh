#!/bin/bash -e
#get variables
tag=$(cat tag.txt)
image=$(cat image.txt)

#run tests
docker-compose run web bash -c "rake db:create && rake db:migrate"
docker-compose run web bash -c "rake" #running tests needs to be independent of the migrations, otherwise failed tests will pass

#upload to ECR
# $(aws ecr get-login --no-include-email --region us-east-1)
docker push $image:$tag
docker push $image
