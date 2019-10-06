#!/bin/bash
ES_HOST=$(cat ES_HOST.txt)

curl -XGET "http://$ES_HOST:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "database.name.keyword": "core" }},        {  "term" : { "database.environment.keyword" : "production" }}      ]    }  }}' > production_database_result.txt

cat production_database_result.txt | jq '.hits.hits[0]._source.database.name' -r > database_name.txt
cat production_database_result.txt | jq '.hits.hits[0]._source.database.username' -r > database_username.txt
cat production_database_result.txt | jq '.hits.hits[0]._source.database.password' -r > database_password
