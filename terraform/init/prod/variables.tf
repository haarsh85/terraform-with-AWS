variable "region" {
    default = "eu-central-1"
}

variable "vpc_cidr_block" {}

variable "name" {}

variable "environment" {}

variable "public_subnet_cidr_block" {}

variable "private_subnet_cidr_block" {}

variable "subnet_availability_zone" {}

variable "public_subnet_name" {}

variable "private_subnet_name" {}

variable "public_rt_name" {}

variable "private_rt_name" {}

variable "ecs_service_sg_name" {}

variable "sg_name" {}