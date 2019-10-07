#!/bin/bash -e

#rake db:create RAILS_ENV=production
#rake db:migrate RAILS_ENV=production
#rake assets:precompile RAILS_ENV=production
docker-compose run -p 5000:3000 web bash -c "bundle install && rake db:create RAILS_ENV=production && rake db:migrate RAILS_ENV=production && rake assets:precompile RAILS_ENV=production"

#upload assets to S3
aws s3 cp public/assets/ s3://chickpea-app-cb3409c1ffb8f57ce08a9e/assets/ --recursive --include "*" --acl "public-read" && \

#issue command to kubernetes to "ruby kubernetes/deploy.rb 2398392398293874409"
