
terraform {
  required_providers {
    aws = {
      version = "~> 3.35.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

