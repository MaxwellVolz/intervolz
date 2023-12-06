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
                echo 'Checking Environment...'
                sh 'docker ps'
            }
        }
        stage('Build and Deploy Intervolz Locally') {
            steps {
                script {
                    // Pull the Docker image and run commands inside its environment
                    docker.image('nginx:alpine').inside {
                        sh '''
                            // Your build commands here
                            docker build -t intervolz-website .
                            docker stop intervolz-website-container || true
                            docker rm intervolz-website-container || true
                            docker run -d -p 8081:80 --name intervolz-website-container intervolz-website
                        '''
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/webserver-deployment.yaml'
            }
        }
    }
}
