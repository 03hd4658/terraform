provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "web_sg" {
  name = "SG for webserver"
   
  ingress {
    from_port = "${var.http_port}"
    to_port = "${var.http_port}"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = "${var.ssh_port}"
    to_port = "${var.ssh_port}"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "${var.ssh_port}"
    to_port = "${var.ssh_port}"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
    
  user_data=<<-EOF
  #!/bin/bash
  sudo yum update
  sudo yum install -y httpd
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "Hello from Terraform" >> /var/www/html/index.html
  EOF
  
#  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]
  
  tags = {
    "Name" = "JuJu"
  }
}
