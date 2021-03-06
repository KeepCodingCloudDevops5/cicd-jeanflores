folder('Jobs') {
    description('Jobs related to my software projects')
}

pipelineJob('Jobs/cicd-dev') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url("https://github.com/JCFlores93/cicd-terraform-jenkins.git")
                    }
                    branches("master")
                    scriptPath('Jenkinsfile.dev')
                }
            }
        }
    }
}

pipelineJob('Jobs/cicd-prod') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url("https://github.com/JCFlores93/cicd-terraform-jenkins.git")
                    }
                    branches("master")
                    scriptPath('Jenkinsfile.prod')
                }
            }
        }
    }
}

pipelineJob('Jobs/cicd-cron-job') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url("https://github.com/JCFlores93/cicd-terraform-jenkins.git")
                    }
                    branches("master")
                    scriptPath('Jenkinsfile.cron')
                }
            }
        }
    }
}