provider "aws" {
  region = "us-east-1"
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = "my-cluster"
  ami                    = "ami-048f6ed62451373d9"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-d12a299c"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
