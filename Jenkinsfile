pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GCP_CREDENTIALS')
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'echo "$GOOGLE_APPLICATION_CREDENTIALS" > /tmp/credentials.json'
                sh 'export GOOGLE_APPLICATION_CREDENTIALS="/tmp/credentials.json"'
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