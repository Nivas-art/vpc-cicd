terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
  backend "s3" {
    bucket = "terraform-vpc-bktt"
    key    = "expense-jenkins"
    region = "us-east-1"
    dynamodb_table = "terraform-vpc-tablee"
  }
}

provider "aws" {
    region = "us-east-1"
}