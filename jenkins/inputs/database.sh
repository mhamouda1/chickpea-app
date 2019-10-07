#!/bin/bash
ES_HOST=$(cat ES_HOST.txt)
DATABASE_NAME=chickpea
DATABASE_ENV=default

results=$(curl -XGET "http://$ES_HOST:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "database.name.keyword": "'$DATABASE_NAME'" }},        {  "term" : { "database.environment.keyword" : "'$DATABASE_ENV'" }}      ]    }  }}')

echo $results > results.txt
# cat results.txt | jq .hits.hits[0]._source


