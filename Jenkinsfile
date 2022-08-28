pipeline{
    agent any
    
    stages{
        stage("Building docker"){
            steps{
                sh "docker compose build"
            }
        }
        stage("Running docker"){
            steps{
                sh "docker compose up -d"
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
