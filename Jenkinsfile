pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  environment {
    AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
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
        echo "${AWS_SECRET_ACCESS_KEY}"
        sh 'sudo bash build.sh'
        script {
          MY_OUTPUT = sh (script: 'cat blah.txt', returnStdout: true).trim()
        }
        echo "The output of my_output is: ${MY_OUTPUT}"
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
