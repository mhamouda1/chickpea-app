pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  environment {
    ES_HOST = "157.245.224.16"
    INPUT_ARTIFACTS_DIR = "artifacts"
  }
  stages {
    stage ("Input Artifacts") {
      steps {
        echo "Input Artifacts"
        sh "echo '$ES_HOST' > ES_HOST.txt"
        sh "echo '$INPUT_ARTIFACTS_DIR' > INPUT_ARTIFACTS_DIR.txt"
        sh "sudo ruby jenkins/inputs/database.rb"
        sh "sudo ruby jenkins/inputs/ecr.rb"
        sh "sudo ruby jenkins/inputs/s3.rb"
      }
    }
    stage ("Build") {
      when {
        expression {
          return env.GIT_BRANCH == "origin/master"
        }
      }
      steps {
        echo "Building..."
        sh "sudo bash jenkins/build.sh"
      }
    }
  }
  post {
    cleanup {
      cleanWs()
    }
  }
}
