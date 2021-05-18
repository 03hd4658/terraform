provider "aws" {
  region = "us-east-1"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/id_rsa.pub")
}

variable "tags" {
  type    = list(any)
  default = ["server-1", "server-2", "server-3"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1" = "ami-048f6ed62451373d9"
    "us-east-2" = "ami-096fda3c22c1c990a"
  }
}

resource "aws_instance" "server" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key           = aws_key_pair.aws_key_pair.key_name
  count         = length(var.tags)

  tags = {
    Name = element(var.tags, count.index)
  }
}

output "time" {
  value = local.time
}
