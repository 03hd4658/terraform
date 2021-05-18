provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test" {
    ami = "ami-042e8287309f5df03"
    instance_type = "t2.micro"
}

resource "aws_eip" "myeip" {
    instance = aws_instance.test.id
}

output "eip" {
    value = aws_eip.myeip.public_ip
}
