provider "aws" {
  region = "us-east-1"
}

variable "vpcname" {
  type = string
  default = "zuzu_vpc"
}

variable "input" {
  type = string
  description = "Set the name for VPC:"
}

output "myoutput" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = var.input
  }
}
