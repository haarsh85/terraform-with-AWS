variable "vpc_cidr_block" {
  description = "VPC cidr block"
}

variable "name" {
   description = "VPC name"
   type = string
}

variable "environment" {
    description = "VPC environment name"
    type = string
}

variable "public_subnet_name" {
  description = "public subnet name"
  
}

variable "public_subnet_cidr_block" {
  description = "public subnet cidr"
}

variable "private_subnet_name" {
  description = "private subnet name"

}

variable "private_subnet_cidr_block" {

}

variable "subnet_availability_zone" {
  description = "subnet availability zones"
  
}

variable "public_rt_name" {
  
}

variable "private_rt_name" {
  
}