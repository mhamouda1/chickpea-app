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
        sh "sudo rm ES_HOST.txt"
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
  }
  post {
    /* cleanup { */
      /* cleanWs() */
    /* } */
    always {
      echo 'Test run completed'
    }
    success {
      echo 'Successfully!'
    }
    failure {
      echo 'Failed!'
    }
    unstable {
      echo 'This will run only if the run was marked as unstable'
    }
    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'
    }
  }
}
