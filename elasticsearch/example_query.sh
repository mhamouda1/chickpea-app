#!/bin/bash
#run me in ./chickpea-app root directory: 'bash elasticsearch/example_query.sh'

#ES_HOST=environment variable set in /.bash_profile
PORT="9200"
INDEX="chickpea"
RESOURCE="ecr"
MY_PATH="elasticsearch/$RESOURCE"
ACTION="search"
CONTENT_TYPE="json"

curl -XGET "http://$ES_HOST:$PORT/$INDEX/_$ACTION" -H "Content-Type: application/$CONTENT_TYPE" -d "@$MY_PATH/$ACTION.$CONTENT_TYPE"
