variable "ecs_cluster_name" {}

variable "cpu" {}

variable "memory" {}

variable "ecs_task_definition_family" {}

variable "ecr_repo_names" {
  type    = list(string)
}

variable "ecs_cluster_tag_name" {}

variable "ecs_cluster_app_name" {}

# variable "ecs_service_name" {}

variable "environment" {}

variable "tedhelper-container_definition_file_path" {}

variable "tedsimulator-container_definition_file_path" {}

variable "operating_system_family" {}

variable "cpu_architecture" {}

variable "subnets_for_ecs_service" {}

variable "tedhelper_container_name" {}

variable "tedhelper_container_port" {}

variable "tedsimulator_container_name" {}

variable "tedsimulator_container_port" {}