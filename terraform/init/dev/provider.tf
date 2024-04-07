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
  profile = "AWSPowerUserAccess-656123244690"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-config-bucket"
    region = "eu-central-1"
    key    = "dev/init/terraform-init-dev.tfstate"
    profile = "AWSPowerUserAccess-656123244690"
  }
}