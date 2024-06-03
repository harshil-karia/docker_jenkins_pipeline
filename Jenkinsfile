pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/mihirh19/docker_jenkins_pipeline']])
            }
        }
        stage("Build Image"){
            steps{
                sh 'docker build -t mihir2109/dockerpipeline .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker push mihir2109/dockerpipeline'
                    sh 'docker logout'
                }
            }
        }
    }
}