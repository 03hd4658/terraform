provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami           = "ami-048f6ed62451373d9"
  instance_type = "t2.micro"
  key_name      = "admin"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx",
      "sudo echo Welldone Ajay !! > /usr/share/nginx/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./admin.pem")
      host        = self.public_ip
    }
  }
}
