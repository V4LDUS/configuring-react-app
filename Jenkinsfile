pipeline {
    agent any

    stages {
        stage('Building backend') {
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt install ruby-full -y'
                sh 'sudo apt install ruby-rubygems'
                sh 'cd backend && sudo gem install sinatra && sudo gem install sinatra-contrib'
                sh 'sudo apt install ruby-bundler
                sh 'cd backend && sudo bundle install'
                sh 'pwd'
            }
        }
        
        stage('Deploying backend') {
            steps {
                sh 'cd backend && sudo ruby backend.rb -o 0.0.0.0'
            }
        }
    }
    
    post {
        success {
            echo '~~~ Pipeline executed successfuly! ~~~'
        }
        failure {
            echo '~~~ Pipeline failed ~~~'
        }
    }
}
