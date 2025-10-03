pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/harshil-karia/docker_jenkins_pipeline']])
      }
    }

    stage('Build Image') {
      steps {
        script {
          if (isUnix()) {
            sh 'docker build -t harshilkaria9/dockerpipeline .'
          } else {
            bat 'docker build -t harshilkaria9/dockerpipeline .'
          }
        }

      }
    }

    stage('Docker Push') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
          script {
            if (isUnix()) {
              sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
              sh 'docker push harshilkaria9/dockerpipeline'
              sh 'docker logout'
            } else {
              bat 'docker login -u %DOCKERHUB_USERNAME% -p %DOCKERHUB_PASSWORD%'
              bat 'docker push harshilkaria9/dockerpipeline'
              bat 'docker logout'
            }
          }

        }

      }
    }

  }
}