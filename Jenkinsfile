pipeline {
    agent any
    parameters {
        string(
            name: 'BRANCH',
            defaultValue: 'main',
            description: 'Enter the branch name to checkout'
        )
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply'],
            description: 'Select the action to perform'
        )
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: "*/${params.BRANCH}"]],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/pranalpatil-pp17/Terraform-Automation-Project.git']]
                )
            }
        }

        stage("terraform init") {
            steps {
                sh("terraform init")
            }
        }

        stage("Action") {
            steps {
                script {
                    switch (params.ACTION) {
                        case 'plan':
                            echo 'Executing Plan...'
                            sh "terraform plan"
                            break
                        case 'apply':
                            echo 'Executing Apply...'
                            sh "terraform apply --auto-approve"
                            break
                        default:
                            error 'Unknown action'
                    }
                }
            }
        }
    }
}
