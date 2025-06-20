@Library('ystv-jenkins')

def pluginPlans = []
def volumes = []
def normalPlans = []

pipeline {
    agent {
        node 'nomad'
    }

    environment {
        CLOUDFLARE_API_TOKEN = credentials('cloudflare-api-token-roses-media-dns')
    }

    stages {
        // stage('Prepare') {
        //     when { not {triggeredBy cause: 'UserIdCause' } }
        //     steps { ciSkip action: 'check' }
        // }

        stage('Plan') {
            // when { changeRequest() }
            steps {
                script {
                    sh(script: "terraform plan", returnStdout: true).trim()
                }
            }
        }
    }
}