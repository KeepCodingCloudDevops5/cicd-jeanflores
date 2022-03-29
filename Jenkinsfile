pipeline {
    agent {
        label("terraform")
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp_service_account')
    }
    stages {
        stage("Login into GCP") {
            steps {
                withCredentials(file(credentialsId: 'gcp_service_account', variable: "GOOGLE_APPLICATION_CREDENTIALS")) {
                    sh "gcloud auth activate-service-account --key-file ${GOOGLE_APPLICATION_CREDENTIALS}"
                }
            }
        }
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
        stage("List buckets"){
            steps{
                sh "gsutil ls"
            }
        }
    }
}