pipeline{
    agent{
        label "aws"
    }
    environment {
        SSH_KEY=credentials('ec2-frankfurt-aws')
        EC_IP=credentials('ip-for-test-cicd')
    }
    stages{
        stage("SSH connection with EC2"){
            steps{
                withCredentials([sshUserPrivateKey(credentialsId: 'ec2-frankfurt-aws', keyFileVariable: 'SSH_KEY')]){
                    sh """#!/bin/bash
                        ssh -o StrictHostKeyChecking=no -i \$SSH_KEY \$SSH_USER@\$EC_IP <<'EOF'
                        echo "Hello from remote server"
                        mkdir -p ~/my-app
                        cd ~/my-app
                        echo "Deploying..."
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