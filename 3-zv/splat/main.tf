provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name  = "loadbalancer${count.index}"
  path  = "/system/"
  count = 3
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}

output "iam_names" {
  value = aws_iam_user.lb[*].name
}
