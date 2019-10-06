#!/bin/bash
ES_HOST=$(cat ES_HOST.txt)

curl -XGET "http://$ES_HOST:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "database.name.keyword": "core" }},        {  "term" : { "database.environment.keyword" : "production" }}      ]    }  }}' > output.txt
