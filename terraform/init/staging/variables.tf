variable "region" {
    default = "eu-central-1"
  
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
}

variable "name" {
   description = "Name of VPC"
   type = string
}

variable "env" {
    description = "Name of VPC Env"
    type = string
}