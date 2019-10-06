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
          sh "aws ecr get-login --no-include-email --region us-east-1"
          sh "sudo bash build.sh"
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
