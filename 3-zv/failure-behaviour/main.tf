provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami                    = "ami-048f6ed62451373d9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  key_name               = "admin"

  tags = {
    Name = "MyServer"
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo yum install tree -y"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum remove tree -y"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./admin.pem")
    host        = self.public_ip
  }
}

resource "aws_security_group" "test_sg" {
  name = "Test SG"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  /*  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } */
}
