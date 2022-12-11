terraform {
  backend "s3" {
    bucket         = "longys3"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
    key            = "02-basics/remote backend/main.tf"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_s3_instance" "example" {
  # bucket        = "longys3"
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}
