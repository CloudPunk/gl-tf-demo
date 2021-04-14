pipeline {
  agent any
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
  }
  environment {
    //TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
  }
  stages {
    stage('Build') {
        steps {
                deleteDir()
                // Get some code from a GitHub repository
                sh 'git clone https://github.com/CloudPunk/gl-tf-demo.git'

            }
    }
    stage('Terraform Init') {
      steps {
        dir('gl-tf-demo/template') {
        sh "/usr/local/bin/terraform init -input=false"
        }    
        }
    }
    stage('Terraform Plan') {
      steps {
        dir('gl-tf-demo') {
        sh "ls"
        sh "/usr/local/bin/terraform plan -out=tfplan -input=false -var-file='terraform.tfvars'"
}
        
      }
    }
  }
}
