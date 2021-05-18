resource "aws_launch_configuration" "launch_config" {
  name = "webservers"
  image_id = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.webserver_sg.id}"]

  user_data =<<-EOF
  #!/bin/bash
  echo "Welcome to Terraform" >> /var/www/html/index.html
  EOF
}
