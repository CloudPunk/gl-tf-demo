
terraform {
  required_providers {
    aws = {
      version = "~> 3.35.0"
    }
  }
  backend "s3" {
    region = "us-eeast-1"
    key = "gl-tf-demo.dev.state"
    bucket = "gl-demo-tfstate"
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


