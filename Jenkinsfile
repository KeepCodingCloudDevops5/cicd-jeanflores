pipeline {
    agent {
        label("terraform-aws")
    }
    stages {
        stage("Test") {
            steps {
                sh 'echo hola'
            }
        }
        
        stage("Is there any terraform?") {
            steps {
                sh 'terraform version'
            }
        }
    }
}