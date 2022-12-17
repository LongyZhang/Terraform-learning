resource "random_id" "server" {

  byte_length = 8
}

resource "aws_instance" "server" {
  # Read the AMI id "through" the random_id resource to ensure that
  # both will change together.
  ami           = "ami-${random_id.server.id}"
  instance_type = "t3.micro"
  # ... (other aws_instance arguments) ...
}
provider "aws" {
  region = "us-east-1"
}
