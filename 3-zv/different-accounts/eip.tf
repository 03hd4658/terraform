resource "aws_eip" "myeip" {
  vpc = "true"
}

resource "aws_eip" "your_eip" {
  vpc      = "true"
  provider = aws.aws02
}
