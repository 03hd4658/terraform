# Using aws provider
provider "aws" {
  region = "us-east-1"
}

# Creating an ec2 Instance
resource "aws_instance" "test" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
}

# Creating an EIP and assiciating it with ec2 instance
resource "aws_eip" "my-eip" {
  vpc = true
}

# Associating the EIP with Instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.test.id
  allocation_id = aws_eip.my-eip.id
}

resource "aws_security_group" "terra-sg" {
  name = "allow traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_eip.my-eip.public_ip}/32"]
  }

  /*  egress {
    from_port = 
    to_port = 
    protocol = 
    cidr_blocks = 
  } */
}
