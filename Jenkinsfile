pipeline {
    agent {
        label 'agentM'
    }

    withCredentials([file(credentialsId: 'valCluster', variable: 'kube')]) {
        stages {
            stage('Building') {
                steps {
                    // sh 'git clone https://github.com/V4LDUS/configuring-react-app'
                    // sh 'cd configuring-react-app && git checkout ruby_branch && cd'

                    sh 'docker build -t vapp_backend ./configuring-react-app/backend/'
                    sh 'docker build -t vapp_frontend ./configuring-react-app/frontend/'
                    
                    sh 'docker tag vapp_backend:latest 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_backend:latest'
                    sh 'docker push 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_backend:latest'

                    sh 'docker tag vapp_frontend:latest 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_frontend:latest'
                    sh 'docker push 021910420728.dkr.ecr.us-east-1.amazonaws.com/vapp_frontend:latest'
                }
            }
            stage('Deploying') {
                steps {
                    sh 'kubectl --kubeconfig=$kube delete deployment myapp'
                    sh 'kubectl --kubeconfig=$kube delete deployment myapp2'

                    sh 'kubectl --kubeconfig=$kube create -f ./configuring-react-app/kfrontend.yaml'
                    sh 'kubectl --kubeconfig=$kube create -f ./configuring-react-app/kbackend.yaml'
                }
                
            }
        }
    }
}