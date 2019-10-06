#!/bin/bash
#run tests
docker-compose run web bash -c "rake db:create && rake db:migrate && rake"

#upload to ECR
docker push $image:$tag
docker push $image
