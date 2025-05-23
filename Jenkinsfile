pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Terraform action')
    }

    environment {
        GCP_CREDENTIALS = credentials('GCP_CREDENTIALS') // Retrieve secret from Jenkins
    }

    stages {
        stage('Prepare Credentials') {
            steps {
                sh 'echo "$GCP_CREDENTIALS" > /tmp/credentials.json' // Save to file
                sh 'chmod 600 /tmp/credentials.json'  // Secure permissions
                sh 'export GOOGLE_APPLICATION_CREDENTIALS="/tmp/credentials.json"' // Set environment variable
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

        stage('Terraform Action') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
