provider "aws" {
  region = "eu-central-1"
  # profile = "AWSPowerUserAccess-656123244690"
  profile = "myprofile"
}

terraform {
  backend "s3" {
    bucket = "terraform-myacc-state-config-bucket"
    region = "eu-central-1"
    key    = "prod/app/tedhelperservice/terraform-app-prod.tfstate"
    profile = "myprofile"
  }
}