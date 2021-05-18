variable "ec2name" {
    type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"

  tags = {
    "Name" = var.ec2name
  }
}
