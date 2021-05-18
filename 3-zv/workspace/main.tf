provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.micro"
    dev     = "t2.medium"
    prod    = "t2.large"
  }
}
