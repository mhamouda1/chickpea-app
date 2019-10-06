# require 'pry'
#`git clone https://github.com/mhamouda1/chickpea-app`

x = `cat kubernetes/deploy.yml.template`.gsub("REPLACE_AWS_ACCOUNT_NUMBER", "316812563398")
git_commit = `git rev-parse HEAD`.chomp
x = x.gsub("REPLACE_GIT_SHA", git_commit)
`echo "#{x.chomp}" > kubernetes/deploy.yml`
