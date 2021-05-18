provider "aws" {
  region = "us-east-1"
}

module "ec2module" {
  source = "./ec2"
  abc = "Name from Module"
}

output "module_output" {
  value = module.ec2module.instance-id
}
