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
        echo "$HOSTNAME"
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
