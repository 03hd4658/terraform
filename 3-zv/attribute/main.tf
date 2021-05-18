provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
    vpc = true
}

resource "aws_s3_bucket" "mys3" {
    bucket = "jujulabs"
}

output "eip" {
  value = aws_eip
}

output "mys3bucket" {
  value = aws_s3_bucket
