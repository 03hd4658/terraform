resource "aws_instance" "db" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  tags = {
    "Name" = "DB Server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
