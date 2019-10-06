pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  stages {
    stage ("Build") {
      when {
        expression {
          return env.GIT_BRANCH == "origin/master"
        }
      }
      steps {
        withAWS(credentials:'abcdefg') {
          sh "$(aws ecr get-login --no-include-email --region us-east-1)"
          sh "docker push 482459285219.dkr.ecr.us-east-1.amazonaws.com/chickpea-app"
        }
        echo "Building..."
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
