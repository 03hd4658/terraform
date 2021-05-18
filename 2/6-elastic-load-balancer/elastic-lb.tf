resource "aws_elb" "elastic_lb" {
  name               = "Terraform-ELB"
  availability_zones = ["us-east-1a"]

  security_groups = ["${aws_security_group.elastic_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = var.server_port
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:${var.server_port}/"
    interval            = 30
  }
}

