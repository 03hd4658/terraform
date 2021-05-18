provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  
  tags = {
    "Name" = "FinalDay"
  }
user_data = <<-EOF
               #!/bin/bash
               sudo su
               yum -y install httpd
               echo "<p> Hello from Terraform </p>" >> /var/www/html/index.html
               sudo systemctl enable httpd
               sudo systemctl start httpd
               EOF
}

