pipeline {
    agent any

    stages {
        stage('Building') {
            steps {
                echo 'Building ruby!'
            }
        }
        stage('Test') {
            steps {
                echo 'Done with ruby!'
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
