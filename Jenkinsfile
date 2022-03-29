pipeline {
    agent {
        label("terraform")
        // docker { image "jeanflores2c93/terraform-gcp-sdk-agent" }
    }
    stages {
        stage("Login into GCP") {
            steps {
                // sh "gcloud auth activate-service-account --key-file ${GOOGLE_APPLICATION_CREDENTIALS}"
                sh "gcloud version"
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