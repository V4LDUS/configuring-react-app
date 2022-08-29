node('agentNode') {
    
    stages{
        stage("Building docker"){
            steps{
                sh "sudo docker-compose build"
            }
        }
        stage("Running docker"){
            steps{
                sh "sudo docker-compose up -d"
            }
        }
    }
    
    post{
        success{
            echo '~~~ Pipeline executed successfuly! ~~~'
        }
        failure{
            echo '~~~ Pipeline failed ~~~'
        }
    }
}
