require 'json'
@ES_HOST = ENV['ES_HOST'] || `$(echo cat ES_HOST.txt)`.chomp
@DATABASE_NAME = "chickpea"
@DATABASE_ENV = "production"
@FOLDER = "my_secrets/database"

`mkdir -p #{@FOLDER}`

`curl -XGET "http://#{@ES_HOST}:9200/chickpea/_search" -H 'Content-Type: application/json' -d'{  "query": {    "bool" : {      "must" : [        {  "term" : { "database.name.keyword": "'#{@DATABASE_NAME}'" }},        {  "term" : { "database.environment.keyword" : "'#{@DATABASE_ENV}'" }}      ]    }  }}' > #{@FOLDER}/results.txt`

@results = JSON.parse(`$(echo cat #{@FOLDER}/results.txt)`.chomp)
if @results["hits"]["total"]["value"] != 1
  raise "results value is equal to: #{@results['hits']['total']['value']}"
else
  @results_hash = @results["hits"]["hits"][0]["_source"]["database"]
end

@results_hash.each do |k,v|
  `echo '#{v}' > #{@FOLDER}/#{k}.txt`
end
