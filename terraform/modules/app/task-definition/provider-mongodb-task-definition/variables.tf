variable "ecs_task_definition_family" {}

variable "cpu" {}

variable "memory" {}

# variable "container_definition_file_path" {}

variable "operating_system_family" {}

variable "cpu_architecture" {}

variable "fetch_sensitive_info_from_ssm" {
  
}

variable "ssm_param_dev_mongodb_username" {
  description = "SSM parameter name for dev mongo DB username"
  type        = string
}

variable "ssm_param_dev_mongodb_password" {
  description = "SSM parameter name for dev mongo DB password"
  type        = string
}

variable "ecs_provider_mongodb_task_definition_tag_name" {}

variable "ecs_provider_mongodb_task_definition_app_name" {}

