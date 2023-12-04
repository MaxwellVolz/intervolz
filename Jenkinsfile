pipeline {
    agent any
    stages {
        stage('Debug') {
            steps {
                echo 'Starting pipeline execution...'
            }
        }
        stage('Build Docker Image') {
            steps {
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
