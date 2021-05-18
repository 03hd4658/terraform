resource "aws_instance" "server" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = var.iam_user
  path = "/system/"
}
