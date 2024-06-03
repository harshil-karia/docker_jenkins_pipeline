pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh 'sudo apt install npm'
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