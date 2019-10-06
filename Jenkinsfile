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
        echo "Building..."
        sh "echo ${AWS_SECRET_ACCESS_KEY}"
        sh 'sudo bash build.sh'
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
        sh 'sudo bash test.sh'
      }
    }
  }
}
