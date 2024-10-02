terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }

  backend "s3" {
    bucket         = "expense-workspace-state-files"
    key            = "expense.tfstate"
    region         = "us-east-1"
    dynamodb_table = "expense-workspace-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}