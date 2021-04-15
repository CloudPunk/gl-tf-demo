pipeline
{
    agent any
    parameters {
        password (name: 'AWS_ACCESS_KEY_ID')
        password (name: 'AWS_SECRET_ACCESS_KEY')
    }
    environment {
        TF_IN_AUTOMATION = 'true'
        AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
    }
    stages {
        stage('Terraform Audit') {
            steps {
                ansiColor('xterm') {
                    sh 'curl -fSL https://gl-demo-binary.s3.amazonaws.com/intercept-linux_amd64 -o ../tools/intercept'
                    sh 'chmod +x ../tools/intercept'
                        dir('../tools') {
                            sh './intercept system --setup --update'
                            sh './intercept config -r'
                            sh './intercept config -a https://raw.githubusercontent.com/arkaprava-jana/gl-tf-demo-policy/main/policyv1.yaml'
                            sh './intercept audit -t ../gl-tf-demo'
                        }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('template') {
                    sh 'terraform init -input=false '
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('template') {
                    sh "terraform plan -out=tfplan -input=false -var-file='../dev/terraform.tfvars'"
                }
            }
        }

        stage('Approval') {
            steps {
                input 'Have you checked the plan output for destroys? If you want to proceed, let\'s continue the apply'
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('template') {
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }

        stage('Cleanup') {
            steps {
                deleteDir()
            }
        }
    }
}