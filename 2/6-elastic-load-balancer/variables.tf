variable "server_port" {
  default = 80
}

variable "region" {
  default = "us-east-1"
}

variable "http_port" {
  default = 80
}

variable "ssh_port" {
  default = 22
}

variable "ami" {
  default = "ami-048f6ed62451373d9"
}

variable "instance_type" {
  default = "t2.micro"
}
