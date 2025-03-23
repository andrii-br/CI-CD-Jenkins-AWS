pipeline{
    agent{
        label "aws"
    }
    environment {
        SSH_KEY=credentials('ec2-frankfurt-aws')
        EC_IP=credentials('ip-for-test-cicd')
    }
    stages{
        stage("Copy repo on Node"){
            steps{
                echo "=======Copy repo on Node======="
                git clone branch: 'main', url: 'https://github.com/andrii-br/CI-CD-Jenkins-AWS.git'
            }
        }
        stage("SSH connection with EC2"){
            steps{
                withCredentials([sshUserPrivateKey(credentialsId: 'ec2-frankfurt-aws', keyFileVariable: 'SSH_KEY')]){
                    sh '''
                    ''' ssh -o StrictHostKeyChecking=no -i $SSH_KEY ubuntu@$EC_IP <<EOF
                    echo "ALL GOOD"
                    git clone branch: 'main', url: 'https://github.com/andrii-br/CI-CD-Jenkins-AWS.git'
                    sh 'docker build .'
                    sh sleep 5
                    sh 'docker compose up -d'
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