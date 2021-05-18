provider "aws" {
    region = "us-east-1"
}

variable "ingress_rule" {
    type = list(number)
    default = [80,443]
}

variable "egress_rule" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

resource "aws_instance" "test" {
    ami = "ami-042e8287309f5df03"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.my_sg.name]
}

resource "aws_security_group" "my_sg" {
    name = "my_sg"
    description = "My new SG"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_rule
        content {
        from_port = port.value
        to_port = port.value    
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress_rule
        content {
        from_port = port.value
        to_port = port.value    
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
