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
        def MY_OUTPUT = sh ( script: 'cat /etc/hosts', returnStdout: true).trim()
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
