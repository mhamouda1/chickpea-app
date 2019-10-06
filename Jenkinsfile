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
        def node_name = "${NODE_NAME}"
        echo "The Node Name is: ${node_name}"
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
