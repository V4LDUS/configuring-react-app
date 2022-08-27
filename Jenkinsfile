pipeline {
    agent any

    stages {
        stage('Building backend') {
            steps {
                sh 'sudo apt-get update'
                sh 'gem install sinatra > ./backend'
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
