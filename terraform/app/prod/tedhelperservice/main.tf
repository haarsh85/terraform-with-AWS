module "tedhelperservice-prod-ecr-repo" {
    source = "../../../modules/app/ecr"
    # ecr_repo_names = var.ecr_repo_names
    # environment = var.environment
    # name = var.ecr_repo_names
}

module "tedhelperservice-prod-ecs-cluster" {
    source = "../../../modules/app/ecs-cluster"
    ecs_cluster_name = var.ecs_cluster_name
    ecs_cluster_app_name = var.ecs_cluster_app_name
    ecs_cluster_tag_name = var.ecs_cluster_tag_name
}

module "tedhelperservice-prod-ecs-task-definition" {
    source = "../../../modules/app/task-definition"
    ecs_task_definition_family = "tedhelper-prod-task-def"
    container_definition_file_path = var.tedhelper-container_definition_file_path
    cpu = var.cpu
    memory = var.memory
    operating_system_family = var.operating_system_family
    cpu_architecture = var.cpu_architecture
    ecs_task_definition_tag_name = "tedhelperservice-prod-task-definition"
    ecs_task_definition_app_name = "tedhelperservice"
}

module "tedsimulator-prod-ecs-task-definition" {
    source = "../../../modules/app/task-definition"
    ecs_task_definition_family = "tedsimulator-prod-task-def"
    container_definition_file_path = var.tedsimulator-container_definition_file_path
    cpu = var.cpu
    memory = var.memory
    operating_system_family = var.operating_system_family
    cpu_architecture = var.cpu_architecture
    ecs_task_definition_tag_name = "tedsimulator-prod-task-definition"
    ecs_task_definition_app_name = "ted-simulator"
}

data "terraform_remote_state" "remote" {
    backend = "s3"

    config = {
      bucket = "terraform-myacc-state-config-bucket"
        region = "eu-central-1"
        key    = "prod/init/terraform-init-prod.tfstate"
        profile = "myprofile"
    }
  
}

module "tedhelperservice-prod-ecs-service" {
    source = "../../../modules/app/ecs-service"
    ecs_service_name = var.ecs_service_name
    ecs_cluster_name = module.tedhelperservice-prod-ecs-cluster.ecs_cluster_name
    ecs_task_def_family = module.tedhelperservice-prod-ecs-task-definition.ecs_task_def_family
    subnets_for_ecs_service = data.terraform_remote_state.remote.outputs.prod_private_subnet_ids
    sg_id_for_ecs_service = data.terraform_remote_state.remote.outputs.sg_id_for_ecs_service
}