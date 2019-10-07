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
        branch "master"
      }
      steps {
        echo "Building..."
        sh "sudo bash jenkins/build.sh"
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
        sh "sudo docker-compose run web bash -c 'rake db:create && rake db:migrate && rake'" /* this CAN NOT go in a shell script */
        withAWS(credentials:'abcdefg') {
          sh "\$(aws ecr get-login --no-include-email --region us-east-1)" /* this does not work in the script */
          sh "sudo bash jenkins/push_ecr.sh"
        }
      }
    }
  }
  post {
    cleanup {
      cleanWs()
    }
  }
}
