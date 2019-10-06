require 'pry'
#`git clone https://github.com/mhamouda1/chickpea-app`

binding.pry
`sed -i "s/REPLACE_GIT_SHA/$(git rev-parse HEAD)/g" deploy.yml`
`k create -f deploy.yml`
