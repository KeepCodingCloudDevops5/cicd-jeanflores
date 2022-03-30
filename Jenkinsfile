pipeline {
    agent {
        label("terraform")
        // docker { image "jeanflores2c93/terraform-gcp-sdk-agent" }
    }
    stages {
        stage("Login into GCP") {
            steps {
                withCredentials([file(credentialsId: "sa-gcp", variable: "SA_KEY")]) {
                    sh "gcloud auth activate-service-account --key-file ${SA_KEY}"
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