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
        sh 'sudo bash build.sh'
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
