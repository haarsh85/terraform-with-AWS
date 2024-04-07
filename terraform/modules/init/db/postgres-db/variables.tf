variable "postgres_db_identifier" {}

variable "postgres_db_instance_class" {}

variable "postgres_db_username" {}

variable "postgres_db_password" {
    type = string
    sensitive = true
    description = "postgress password"
  
}

variable "postgres_db_name" {}

variable "postgres_security_group_ids" {}

variable "postgres_db_subnet_grp_name" {}

variable "postgres_db_tag_name" {}

variable "postgres_db_tag_application" {}