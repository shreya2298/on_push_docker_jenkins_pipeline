pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shreya221998/flaskapp"
        DOCKER_REGISTRY_CREDENTIALS = 'docker-hub-credentials'  // Credentials ID from Jenkins
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/shreya2298/on_push_docker_jenkins_pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }
       stage('Login to Docker Hub') {
	    steps {
        	withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            		sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
       		 }		
   	      }
	   }
       
        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }
    }
}

