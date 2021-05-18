provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "db" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  depends_on = [aws_instance.db]
}
