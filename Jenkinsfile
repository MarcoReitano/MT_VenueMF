pipeline {
    agent none
    stages {

        stage('Build') {
            agent {
                docker { image 'node:10-alpine' }
            }
            steps {
                sh 'node --version'
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            agent any
            steps {
                sh 'docker build -t marcoreitano/venuemf .'
            }
        }

        stage('Push to Registry') {
            agent any
            steps {
                sh 'docker tag marcoreitano/venuemf dockernexus.marcoreitano.dev/venuemf'
                withDockerRegistry([credentialsId: 'docker-registry-credentials', url: "https://dockernexus.marcoreitano.dev/"]) {
                    sh 'docker push dockernexus.marcoreitano.dev/venuemf'
                }
            }
        }
    }
}
