resource "aws_security_group" "elastic_sg" {
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = var.http_port
    to_port         = var.http_port
    protocol        = "TCP"
    security_groups = ["sg-0741e3200e60464bc"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
