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
        echo "${AWS_ACCESS_KEY_ID}"
        echo sh(returnStdout: true, script: 'env')
        withAWS(credentials:'abcdefg') {
          echo sh(returnStdout: true, script: 'env')
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
