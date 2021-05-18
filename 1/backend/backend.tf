terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "s3s3s2s2"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}
