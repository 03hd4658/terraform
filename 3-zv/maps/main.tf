provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-server" {
  ami = "ami-048f6ed62451373d9"
  instance_type = var.types["us-west-2"]
}

variable "list" {
  type = list
  default = ["t2.medium", "t2.micro", "t2.nano"]
}

variable "types" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.medium"
    ap-south-1 = "t2.nano"
  }
}
