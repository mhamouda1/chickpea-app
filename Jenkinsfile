pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  stages {
    stage ("Build") {
      steps {
        echo "Building..."
        echo "The Node Name is: ${NODE_NAME}"
        sh "cat /etc/hosts"
        MY_OUTPUT = sh ( script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
        echo "The output of my_output is: ${MY_OUTPUT}"
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
