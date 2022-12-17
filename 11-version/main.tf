resource "aws_iam_user" "admin-user" {
  name = "andrew"
  tags = {
    Description = "team leader"
  }
}

provider "aws" {
  region = "ws-east-1"
}
