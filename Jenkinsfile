pipeline {
    agent any

    stages {
        stage('Building backend') {
            steps {
                sh 'sudo apt-get update'
                sh 'cd backend && gem install sinatra'
            }
        }
    }
    
    post {
        success {
            echo '=== Pipeline executed successfuly! ==='
        }
        failure {
            echo '=== Pipeline failed ==='
        }
    }
}
