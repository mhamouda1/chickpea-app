# require 'pry'
#`git clone https://github.com/mhamouda1/chickpea-app`

p 'removing previous deploy.yml'
`rm -rf kubernetes/deploy.yml`

p 'replacing files in deploy.yml.template'
x = `cat kubernetes/deploy.yml.template`.gsub("REPLACE_AWS_ACCOUNT_NUMBER", "316812563398")
git_commit = `git rev-parse HEAD`.chomp
x = x.gsub("REPLACE_GIT_SHA", git_commit)
`echo "#{x.chomp}" > kubernetes/deploy.yml`

p 'running script, creating configmap, deploying'
`k delete configmap production-env && k create configmap production-env --from-file=production.env && k create -f kubernetes/deploy.yml`
