resource "aws_instance" "my_ec2" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0132a903","sg-04b434a6202e38d10"]
  key_name               = "admin"
  subnet_id              = "subnet-d12a299c"

  tags = {
    Name = "manual"
  }
}


