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
        echo Jenkins.getInstance().getComputer(env['NODE_NAME']).getHostName()
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
