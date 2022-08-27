pipeline {
    agent any

    stages {
        stage('Building backend') {
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt install ruby-full -y'
                sh 'sudo apt install ruby-rubygems'
                sh '(cd backend && sudo gem install sinatra && sudo gem install sinatra-contrib)'
                sh '(sudo apt install ruby-bundler &&  cd backend && sudo bundle install)'
                sh 'pwd'
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
