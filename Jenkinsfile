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
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
