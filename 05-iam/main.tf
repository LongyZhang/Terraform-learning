resource "aws_iam_user" "LongyIam" {
  name = "longy"
}
provider "aws" {
  region = "us-east-1"
}
