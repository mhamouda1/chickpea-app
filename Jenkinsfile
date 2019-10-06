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
        script {
          revision = sh(returnStdout: true, script: 'echo $(git rev-parse HEAD)')
        }
        echo "revision is = ${revision}"
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
