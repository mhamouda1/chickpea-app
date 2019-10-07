pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  environment {
    ES_HOST = "157.245.224.16"
    INJECT_SECRETS_DIR = "my_secrets"
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
        sh "sudo bash jenkins/build.sh"
      }
    }
    stage ("Inject Sensitive Inputs") {
      steps {
        echo "Inject Sensitive Inputs"
        sh "echo '$ES_HOST' > ES_HOST.txt"
        sh "echo '$INJECT_SECRETS_DIR' > SECRETS_DIR.txt"
        sh "sudo ruby jenkins/inputs/database.rb"
        sh "sudo ruby jenkins/inputs/ecr.rb"
        sh "sudo ruby jenkins/inputs/s3.rb"
      }
    }
  }
  post {
    cleanup {
      cleanWs()
    }
  }
}
