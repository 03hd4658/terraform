provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test" {
    ami = "ami-042e8287309f5df03"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.my_sg.name]
}

resource "aws_security_group" "my_sg" {
    name = "my_sg"
    description = "My new SG"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
