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
        withAWS(credentials:'abcdefg') {
          sh "sudo bash jenkins/build.sh"
        }
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
        sh "sudo bash jenkins/test.sh"
      }
    }
    stage ("Deploy") {
      steps {
        echo "Deploying..."
        sh "sudo bash jenkins/deploy.sh"
      }
    }
    stage ("Cleanup") {
      steps {
        echo "Cleaning..."
        cleanWs()
      }
    }
  }
}
