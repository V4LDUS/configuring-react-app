pipeline {
    agent any

    stages {
        stage('Building backend') {
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt install ruby-full'
                sh 'sudo apt install ruby-rubygems'
                sh 'cd backend && gem install sinatra && gem install sinatra-contrib'
                sh 'cd . && pwd'
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
