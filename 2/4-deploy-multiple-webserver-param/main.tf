provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "myec2" {
  ami = "${var.ami}"
  count = 3
  instance_type = "t2.micro"

  user_data=<<-EOF
  #!/bin/bash
  sudo yum update
  sudo yum install -y httpd
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "Hello from Terraform" >> /var/www/html/index.html
  echo $public_ip >> /var/www/html/index.html
  EOF
  
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  
  tags = {
    "Name" = "Web-Server-${count.index}"
  }
}
