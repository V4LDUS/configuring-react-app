pipeline {
    agent {
        label 'agentM'
    }
    stages {
        stage('Building') {
            steps {
                // sh 'git clone https://github.com/V4LDUS/configuring-react-app'
                // sh 'cd configuring-react-app && git checkout ruby_branch && cd'

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

                sh 'kubectl --kubeconfig=$kube create -f kfrontend.yaml'
                sh 'kubectl --kubeconfig=$kube create -f kbackend.yaml'
                }
            }            
        }
    }
}