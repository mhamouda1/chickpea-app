pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  environment {
    /* AWS_ID = credentials("AWS_ID") */
    AWS_ACCESS_KEY_ID = "${AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${AWS_ID_PSW}"
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
        echo sh(returnStdout: true, script: 'env')
        echo "${AWS_ACCESS_KEY_ID}"
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
