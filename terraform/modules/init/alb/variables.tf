variable "alb_name" {}

variable "alb_sg" {}

variable "subnets_for_alb" {
    description = "List of subnet IDs for the ALB"
    type = list(string)
    default = [ ]

}

variable "environment" {}