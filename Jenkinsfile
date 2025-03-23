pipeline{
    agent{
        label "aws"
    }
    environment {
        SSH_KEY=credentials('ec2-frankfurt-aws')
    }
    stages {
        stage("SSH connection with EC2") {
            steps {
                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: 'ec2-frankfurt-aws',
                        keyFileVariable: 'SSH_KEY'
                )
            ]) {
                sh """#!/bin/bash
                ssh -o StrictHostKeyChecking=no -i \$SSH_KEY ubuntu@52.59.171.99 <<'EOF'
                git branch: 'main', url: 'https://github.com/andrii-br/CI-CD-Jenkins-AWS.git' 
                sleep 5
                docker build .
                sleep 5
                docker-compose up -d
EOF
                """
                }
            }
        }
        stage("TEST"){
            steps{
                sh 'sleep 5'
                sh 'curl -i curl -i http://localhost:8000'
            }
        }
    }
}