resource "aws_security_group" "webserver_sg" {
  ingress {
    from_port = "${var.http_port}"
    to_port = "${var.http_port}"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port = "${var.http_port}"
    to_port = "${var.http_port}"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
