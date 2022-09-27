pipeline {
    agent any

    stages {
        stage('Building') {
            steps {
                sh "gem install bundler"
                sh "bundle install"
            }
        }
        stage('Test') {
            steps {
                echo 'Done with ruby!'
            }
        }
    }
}
