variable "ecs_task_definition_family" {}

variable "cpu" {}

variable "memory" {}

# variable "container_definition_file_path" {}

variable "operating_system_family" {}

variable "cpu_architecture" {}

variable "fetch_sensitive_info_from_ssm" {
  
}

variable "ssm_param_dev_postgres_db_username" {
  description = "SSM parameter name for dev PostgreSQL DB username"
  type        = string
}

variable "ssm_param_dev_postgres_db_password" {
  description = "SSM parameter name for dev PostgreSQL DB password"
  type        = string
}

variable "ssm_param_dev_postgres_conn_string" {
  description = "SSM parameter name for dev PostgreSQL connection string"
  type        = string
}

variable "ecs_tedhelper_task_definition_tag_name" {}

variable "ecs_tedhelper_task_definition_app_name" {}