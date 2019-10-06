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
        sh returnStdout: true, script: 'ls -al'
        sh 'echo $HOSTNAME'
        sh 'docker login -u ${DOCKER_REGISTRY_CREDENTIALS_USR} -p ${DOCKER_REGISTRY_CREDENTIALS_PSW} registry.gitlab.com'
        sh 'docker build -t ${IMAGE}:${BRANCH_NAME} .'
        sh 'docker push ${IMAGE}:${BRANCH_NAME}'
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
