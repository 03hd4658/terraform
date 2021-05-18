provider "aws" {
  region = "us-east-1"
}

/*  resource "aws_instance" "my-server" {
  ami = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  count = 1
} */

 variable "elb_names" {
  type = list
  default = ["dev-lb","stage-lb","prod-lb"]
} 

resource "aws_iam_user" "lb" {
  name = "user-${var.elb_names[count.index]}"
  path = "/system/"
  count = 3
}
