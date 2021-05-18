terraform {
  backend "s3" {
    bucket         = "jujulabs"
    key            = "remotedemo.tfstate" # This name would be allocated to the file
    region         = "us-east-1"
    dynamodb_table = "s3-state-lock"
  }
}
