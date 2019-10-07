pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  environment {
    ES_HOST = "157.245.224.16" //use a domain name not an IP
    sh "echo $ES_HOST > ES_HOST.txt"
  }
  stages {
    stage ("Get Sensitive Inputs") {
      steps {
        echo "Getting Sensitive Inputs"
        sh "sudo bash jenkins/inputs/database.sh"
        sh "sudo bash jenkins/inputs/ecr.sh"
        sh "sudo bash jenkins/inputs/s3.sh"
        sh "sudo rm ES_HOST.txt"
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
    stage ("Test") {
      steps {
        echo "Testing..."
        withAWS(credentials:'abcdefg') {
          sh "\$(aws ecr get-login --no-include-email --region us-east-1)"
          sh "sudo bash jenkins/test.sh"
        }
      }
    }
    stage ("Provision") {
      steps {
        echo "Provision..."
        sh "sudo bash jenkins/provision.sh"
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
