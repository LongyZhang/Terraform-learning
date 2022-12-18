terraform {
  backend "s3" {
    bucket = "finance-123121"
    key    = "D:/terraform2/Terraform-learning/13-S3/terraform.tfstate"
    region = "us-east-1"

  }
}
