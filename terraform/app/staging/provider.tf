provider "aws" {
  region = "eu-central-1"
  profile = "AWSPowerUserAccess-656123244690"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-config-bucket"
    region = "eu-central-1"
    key    = "staging/app/terraform-app-stg.tfstate"
    profile = "AWSPowerUserAccess-656123244690"
  }
}