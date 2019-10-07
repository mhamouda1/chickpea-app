#!/bin/bash
ES_HOST=$(cat ES_HOST.txt)

results=$(curl -XGET "http://$ES_HOST:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "database.name.keyword": "chickpea" }},        {  "term" : { "database.environment.keyword" : "production" }}      ]    }  }}')

echo $results > blah.txt
