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

                sh 'minikube -p minikube status'
                sh 'minikube -p minikube docker-env'

            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'minikube status'
                sh 'docker info'
                sh 'eval $(minikube docker-env)'
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
