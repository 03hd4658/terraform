provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    Owner   = "Ajay"
    Service = "Backend"
  }
}

resource "aws_instance" "dev" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "prod" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.large"
  tags          = local.common_tags
}
