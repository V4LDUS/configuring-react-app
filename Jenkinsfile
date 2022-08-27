pipeline {
    agent any

    stages {
        stage('Building Backend') {
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt install ruby-full -y'
                sh 'sudo apt install ruby-rubygems'
                sh 'cd backend && sudo gem install sinatra && sudo gem install sinatra-contrib'
                sh 'sudo apt install ruby-bundler'
                sh 'cd backend && sudo bundle install'
            }
        }
        
        stage('Deploying Backend') {
            steps {
                sh 'cd backend && sudo nohup ruby backend.rb -o 0.0.0.0 &'
            }
        }
        
        stage('Building Frontend') {
            steps {
                sh 'sudo apt install npm -y sudo npm install -g npm@4.6.1'
                sh 'cd frontend && sudo npm ci'
            }
        }
        
        stage('Deploying Frontend') {
            steps {
                sh 'cd frontend && sudo nohup npm start'
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
