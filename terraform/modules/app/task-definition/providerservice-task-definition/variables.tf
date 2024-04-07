variable "ecs_task_definition_family" {}

variable "cpu" {}

variable "memory" {}

# variable "container_definition_file_path" {}

variable "operating_system_family" {}

variable "cpu_architecture" {}

variable "fetch_sensitive_info_from_ssm" {}

variable "ssm_param_dev_provider_db_url" {
  description = "SSM parameter name for dev provider DB URL"
  type        = string
}

variable "ssm_param_dev_provider_secret" {
  description = "SSM parameter name for dev provider secret"
  type        = string
}

variable "ecs_provider_task_definition_tag_name" {}

variable "ecs_provider_task_definition_app_name" {}

