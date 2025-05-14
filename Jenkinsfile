pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GCP_CREDENTIALS')
    }

    stages {
        stage('Prepare Credentials') {
            steps {
                sh 'echo "$GOOGLE_APPLICATION_CREDENTIALS" > /tmp/credentials.json'
                sh 'chmod 600 /tmp/credentials.json'  // Secure file permissions
                sh 'export GOOGLE_APPLICATION_CREDENTIALS="/tmp/credentials.json"'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
