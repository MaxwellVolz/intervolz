pipeline {
    agent any
    stages {
        stage('Debug') {
            steps {
                echo 'Starting pipeline execution...'
                sh 'env'
            }
        }
        stage('Check Environment') {
            steps {
                sh 'docker info'
                sh 'eval $(minikube docker-env)'
                sh 'minikube status'
                sh 'minikube - docker-env'

            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'minikube status'
                sh 'docker build -t my-web-server .'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/webserver-deployment.yaml'
            }
        }
    }
}
