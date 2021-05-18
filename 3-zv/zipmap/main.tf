provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name  = "myuser.${count.index}"
  path  = "/system/"
  count = 3
}

output "name" {
  value = aws_iam_user.user[*].name
}

output "arns" {
  value = aws_iam_user.user[*].arn
}

output "combined" {
  value = zipmap(aws_iam_user.user[*].name, aws_iam_user.user[*].arn)
}
