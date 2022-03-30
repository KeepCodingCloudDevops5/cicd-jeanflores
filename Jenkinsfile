pipeline {
    agent {
        label("terraform")
        // docker { image "jeanflores2c93/terraform-gcp-sdk-agent" }
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials("sa-gcp")
        GOOGLE_PROJECT = "steady-tape-345517"
        GOOGLE_REGION = "us-central1"
        GOOGLE_ZONE = "us-central1-a"
    }
    stages {
        // stage("Login into GCP") {
        //     steps {
        //         // withCredentials([file(credentialsId: "sa-gcp", variable: "SA_KEY")]) {
        //         //     // sh "gcloud auth activate-service-account --key-file ${SA_KEY}"
        //         //     sh "My file path: ${SA_KEY}"
        //         // }
        //     }
        // }
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