resource "aws_instance" "web" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data = file("./web/script.sh")
  tags = {
  "Name" = "Web Server"
  }
}

output "PublicIP" {
  value = aws_instance.web.public_ip
}

module sg {
  source = "../sg"
}
