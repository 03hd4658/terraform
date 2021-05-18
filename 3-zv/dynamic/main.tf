provider "aws" {
  region = "us-east-1"
}

variable "ports" {
  type    = list(number)
  default = [8000, 8080, 4000, 5555, 4001, 2397]
}

resource "aws_instance" "server1" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
}

resource "aws_security_group" "sg" {
  name = "Test SG"
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
