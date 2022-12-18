resource "aws_iam_user" "admin-user" {
  name = "andrew"
  tags = {
    "Description" = "team leader"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "adminUsers"
  policy = file("admin-policy.json")
}
## this is file function which can access json file

resource "aws_iam_user_policy_attachment" "andrew" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}

provider "aws" {
  region = "us-east-1"
}
