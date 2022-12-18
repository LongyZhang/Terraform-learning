resource "aws_instance" "webserver" {
  ami           = "ami-0211a07b0b6444501"
  instance_type = "t2.micro"
  tags = {
    name        = "webserver"
    description = "an gninx webserver on ubuntu"
  }
  user_data = <<-EOF
        sudo apt update
        sudo apt install nginx -y
        systemctlk enable gninx
        systemctl start gninx
  EOF
}
resource "aws_key_pair" "web" {
  public_key = "web"
}

provider "aws" {
  region = "us-east-1"
}


