require 'json'
@ES_HOST = ENV['ES_HOST'] || `$(echo cat ES_HOST.txt)`.chomp
@ECR_NAME = "chickpea"
@ECR_ENV = "production"
@INPUT_ARTIFACTS_DIR = `$(echo cat INPUT_ARTIFACTS_DIR.txt)`.chomp + "/ecr"

`mkdir -p #{@INPUT_ARTIFACTS_DIR}`

#query ES
`curl -XGET "http://#{@ES_HOST}:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "ecr.name.keyword": "'#{@ECR_NAME}'" }},        {  "term" : { "ecr.environment.keyword" : "'#{@ECR_ENV}'" }}      ]    }  }}' > #{@INPUT_ARTIFACTS_DIR}/results.txt`

#read the results and parse
@results = JSON.parse(`$(echo cat #{@INPUT_ARTIFACTS_DIR}/results.txt)`.chomp)
if @results["hits"]["total"]["value"] != 1
  raise "results value is equal to: #{@results['hits']['total']['value']}"
else
  @results_hash = @results["hits"]["hits"][0]["_source"]["ecr"]
end

#write key.txt, value to files
@results_hash.each do |k,v|
  `echo '#{v}' > #{@INPUT_ARTIFACTS_DIR}/#{k}.txt`
end
