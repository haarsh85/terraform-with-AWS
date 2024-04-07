terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "AWSPowerUserAccess-656123244690"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-config-bucket"
    region = "eu-central-1"
    key    = "dev/app/frontend/terraform-app-dev.tfstate"
    profile = "AWSPowerUserAccess-656123244690"
  }
}