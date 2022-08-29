pipeline {
    agent {
        label 'agentNode'
    }

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
                // sh 'sudo apt install npm -y'
                // sh 'cd frontend && sudo npm update && sudo npm ci'
                sh 'cd frontend && sudo docker build -t react_img .'
            }
        }
        
        stage('Deploying Frontend') {
            steps {
                // sh 'cd frontend && sudo nohup npm run build
                sh 'cd frontend && sudo docker run -d -p 5000:80 react_img'
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
