pipeline {
    agent any
    stages {
        stage('Debug') {
            steps {
                echo 'Starting pipeline execution...'
            }
        }
        stage('Check Environment') {
            steps {
                sh 'minikube status'
                sh 'docker info'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh './minikube-setup.sh'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/webserver-deployment.yaml'
            }
        }
    }
}
