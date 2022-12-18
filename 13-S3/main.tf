resource "aws_s3_bucket" "finance" {
  bucket = "finance-123121"
  tags = {
    "description" = "finance and payroll"
  }
}

resource "local_file" "file" {
  filename = var.filename[0]
  content  = var.content.one
}

resource "aws_s3_bucket_object" "finance-2020" {
  content = "C:/Users/sjia4/OneDrive/Desktop/Terraform-learning/13-S3/pets.txt"
  key     = "pet.txt"
  bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "terraform-group"
  # path = "/"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
  
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource":"arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
            "Principal":{
                "AWS":[
                    "${data.aws_iam_group.finance-data.arn}"
                ]
            }
        }
    ]
  }

  
  EOF
}


provider "aws" {
  region = "us-east-1"
}

