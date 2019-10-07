require 'pry'
require 'json'
@ES_HOST = ENV['ES_HOST'] || `$(echo cat ES_HOST.txt)`.chomp
@DATABASE_NAME = "chickpea"
@DATABASE_ENV = "production"
@INPUT_ARTIFACTS_DIR = `$(echo cat INPUT_ARTIFACTS_DIR.txt)`.chomp + "/database"

puts @INPUT_ARTIFACTS_DIR
puts @ES_HOST

`mkdir -p #{@INPUT_ARTIFACTS_DIR}`

`curl -XGET "http://#{@ES_HOST}:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "database.name.keyword": "'#{@DATABASE_NAME}'" }},        {  "term" : { "database.environment.keyword" : "'#{@DATABASE_ENV}'" }}      ]    }  }}' > #{@INPUT_ARTIFACTS_DIR}/results.txt`

@results = JSON.parse(`$(echo cat #{@INPUT_ARTIFACTS_DIR}/results.txt)`.chomp)
if @results["hits"]["total"]["value"] != 1
  raise "results value is equal to: #{@results['hits']['total']['value']}"
else
  @results_hash = @results["hits"]["hits"][0]["_source"]["database"]
end

@results_hash.each do |k,v|
  `echo '#{v}' > #{@INPUT_ARTIFACTS_DIR}/#{k}.txt`
end
