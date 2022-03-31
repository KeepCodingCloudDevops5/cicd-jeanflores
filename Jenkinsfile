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
        stage("Login into GCP") {
            steps {
                // withCredentials([file(credentialsId: "sa-gcp", variable: "SA_KEY")]) {
                //     // sh "gcloud auth activate-service-account --key-file ${SA_KEY}"
                //     sh "My file path: ${SA_KEY}"
                // }
                sh "GOOGLE_APPLICATION_CREDENTIALS=${env.GOOGLE_APPLICATION_CREDENTIALS}"
                sh "export GOOGLE_APPLICATION_CREDENTIALS"
                sh "GOOGLE_PROJECT=${env.GOOGLE_PROJECT}"
                sh "export GOOGLE_PROJECT"
                sh "GOOGLE_REGION=${env.GOOGLE_REGION}"
                sh "export GOOGLE_REGION"
                sh "GOOGLE_ZONE=${env.GOOGLE_ZONE}"
                sh "export GOOGLE_ZONE"
                sh "gcloud config set project $GOOGLE_PROJECT"
                sh "gcloud auth activate-service-account \"sa-jenkins@steady-tape-345517.iam.gserviceaccount.com\" --project=\"steady-tape-345517\" --key-file=${env.GOOGLE_APPLICATION_CREDENTIALS}"
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
                sh "gcloud auth application-default login gsutil ls"
            }
        }
    }
}