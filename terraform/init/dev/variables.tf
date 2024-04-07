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

variable "postgres_db_sg_name" {}

# variable "db_subnet_grp_subnet_ids" {}

variable "postgres_db_identifier" {}

variable "postgres_db_name" {}

variable "postgres_db_instance_class" {}

variable "postgres_db_subnet_grp_name" {}

variable "postgres_db_tag_name" {}

variable "postgres_db_tag_application" {}

variable "api_gw_name" {}

variable "alb_sg_name" {
  
}

# variable "alb_access_log_bucket_name" {
  
# }

# variable "alb_connection_log_bucket_name" {
  
# }

variable "alb_name" {}

variable "tedhelper_target_group_name" {}

variable "tedhelper_port_for_lb_target_group" {}

variable "tedhelper_health_check_path" {}

variable "tedsimulator_target_group_name" {}

variable "tedsimulator_port_for_lb_target_group" {}

variable "tedsimulator_health_check_path" {}

variable "provider_port_for_lb_target_group" {}

variable "provider_health_check_path" {}

variable "provider_target_group_name" {}

variable "provider_mongodb_port_for_lb_target_group" {}

variable "provider_mongodb_health_check_path" {}

variable "provider_mongodb_target_group_name" {}