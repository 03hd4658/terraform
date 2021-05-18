provider "aws" {
  region = "us-east-1"
}

module "demomodule" {
  source = "git::https://github.com/03hd4658/tmp-repo.git?ref=development"
}
