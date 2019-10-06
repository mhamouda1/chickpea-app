pipeline {
  agent {
      node {
        label 'agent-1'
      }
  }
  /* environment { */
    /* MY_OUTPUT = "" */
  /* } */
  stages {
    stage ("Build") {
      /* script { */
          /* if (ENVIRONMENT_NAME == 'development') { */
              /* ENV_NAME = 'Development' */
          /* } else if (ENVIRONMENT_NAME == 'release') { */
              /* ENV_NAME = 'Production' */
          /* } */
      /* } */
      steps {
        echo "Building..."
        echo "The Node Name is: ${NODE_NAME}"
        /* sh "cat /etc/hosts" */
        script {
          MY_OUTPUT = sh (script: 'cat /etc/hosts', returnStdout: true).trim()
        }
        echo "The output of my_output is: ${MY_OUTPUT}"
      }
    }
    stage ("Test") {
      steps {
        echo "Testing..."
      }
    }
  }
}
