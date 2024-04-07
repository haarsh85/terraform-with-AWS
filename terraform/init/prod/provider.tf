terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  # profile = "AWSPowerUserAccess-656123244690"
  profile = "myprofile"
}

terraform {
  backend "s3" {
    bucket = "terraform-myacc-state-config-bucket"
    region = "eu-central-1"
    key    = "prod/init/terraform-init-prod.tfstate"
    profile = "myprofile"
  }
}