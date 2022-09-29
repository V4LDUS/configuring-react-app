pipeline {
    agent {
        label 'agentM'
    }
    stages {
        stage('Building') {
            steps {
                // a fix for token expiration
                sh'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 021910420728.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker build -t vapp_backend ./backend/'
                sh 'docker build -t vapp_front ./frontend/'
                
                sh 'docker tag vapp_backend:latest 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_backend:latest'
                sh 'docker push 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_backend:latest'

                sh 'docker tag vapp_front:latest 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_front:latest'
                sh 'docker push 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_front:latest'
            }
        }
        stage('Deploying') {
            steps {
                withCredentials([file(credentialsId: 'valCluster', variable: 'kube')]) {
                sh 'kubectl --kubeconfig=$kube delete deployment myapp'
                sh 'kubectl --kubeconfig=$kube delete deployment myapp2'
                sh 'kubectl --kubeconfig=$kube delete svc myapp'
                sh 'kubectl --kubeconfig=$kube delete svc myapp2'

                sh 'kubectl --kubeconfig=$kube create -f back_d.yaml'
                sh 'kubectl --kubeconfig=$kube create -f back_s.yaml'
                sh 'kubectl --kubeconfig=$kube create -f front_d.yaml'
                sh 'kubectl --kubeconfig=$kube create -f front_s.yaml'
                }
            }            
        }
    }
}