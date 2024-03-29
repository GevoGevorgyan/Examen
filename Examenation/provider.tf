provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "gg-s3-backend"
    key    = "terraform/state"
    region = "us-east-2"
  }
}
