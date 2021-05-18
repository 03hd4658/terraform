provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
    ami = "ami-048f6ed62451373d9"
    instance_type = "t2.micro"
    tags = {
      Name = "MyDBServer"
    }
}
