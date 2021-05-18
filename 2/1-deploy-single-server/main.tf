provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  key_name = "admin"
  tags = {
    "Name" = "Hello"
  }
}
