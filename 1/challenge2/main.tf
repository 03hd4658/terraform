provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "db" {
    ami = "ami-048f6ed62451373d9"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.newsg.name]
    user_data = file("script.sh")

    tags = {
        "Name" = "DB Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-048f6ed62451373d9"
    instance_type = "t2.micro"

    tags = {
        "Name" = "Web Server"
    }
}

variable "ingress" {
    type = list(number)
    default = [80,443]
}

variable "egress" {
    type = list(number)
    default = [80,443]
}

resource "aws_security_group" "newsg" {
    name = "Allow port 80 and 443"

    dynamic ingress {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic egress {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

output "Private-IP" {
    value = aws_instance.db.private_ip
}

output "Public-IP" {
    value = aws_instance.web.public_ip
}
