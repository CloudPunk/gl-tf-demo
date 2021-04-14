
terraform {
  required_providers {
    aws = {
      version = "~> 3.35.0"
    }
  }
  backend "s3" {
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


