provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "var-sg" {
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = [var.vpc_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = [var.vpc_ip]
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "TCP"
    cidr_blocks = [var.vpc_ip]
  }
}
