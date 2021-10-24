pipeline {
  agent any
  environment{
    ECR_URL = '501853673872.dkr.ecr.us-east-1.amazonaws.com'
    REGION = 'us-east-1'
    IMAGE = "$ECR_URL/api-sample:latest"
  }
  stages {
    stage('Dependecies'){
      steps {
        sh 'echo "************* AWS CLI INSTALLATION *************"'
        sh 'wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "/tmp/awscliv2.zip"'
        sh 'unzip -o /tmp/awscliv2.zip'
        sh './aws/install --update'
        sh 'echo "************* HELM INSTALLATION *************"'
        sh 'curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3'
        sh 'chmod 700 get_helm.sh'
        sh './get_helm.sh'
      }
    }
    stage('Build Docker image') {
      steps {
        sh "docker build -t $IMAGE ."
      }
    }
    stage('Push Docker image') {
      steps {
        withCredentials([aws(accessKeyVariable:'AWS_ACCESS_KEY_ID', credentialsId: 'amazon', secretKeyVariable:'AWS_SECRET_ACCESS_KEY')]){
          // TODO: Automate the ECR Repository creation
          sh "aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_URL"
          sh "docker push $IMAGE"
        }
      }
    }
    stage('Helm deploy') {
      steps {
        sh 'helm install api-sample ./helm/adidas-challenge'
      }
    }
    // TODO: Alert Management Notifications
  }
}