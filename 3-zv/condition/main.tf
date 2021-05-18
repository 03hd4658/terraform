provider "aws" {
  region = "us-east-1"
}

variable "test" {
  description = "Please type true or false"
}

resource "aws_instance" "dev" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  count         = var.test == true ? 1 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.large"
  count         = var.test == false ? 1 : 0
}
