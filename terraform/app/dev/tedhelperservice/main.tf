module "tedhelperservice-dev-ecr-repo" {
    source = "../../../modules/app/ecr/ecr-tedhelperservice"
    ecr_repo_names = var.ecr_repo_names
    environment = var.environment
    name = var.ecr_repo_names
}

module "tedhelperservice-dev-ecs-cluster" {
    source = "../../../modules/app/ecs-cluster"
    ecs_cluster_name = var.ecs_cluster_name
    ecs_cluster_app_name = var.ecs_cluster_app_name
    ecs_cluster_tag_name = var.ecs_cluster_tag_name
}

module "tedhelperservice-dev-ecs-task-definition" {
    source = "../../../modules/app/task-definition/tedhelper-task-definition"
    ecs_task_definition_family = "tedhelper-dev-task-def"
    # container_definition_file_path = var.tedhelper-container_definition_file_path
    cpu = var.cpu
    memory = var.memory
    operating_system_family = var.operating_system_family
    cpu_architecture = var.cpu_architecture
    fetch_sensitive_info_from_ssm = true
    ssm_param_dev_postgres_db_username  = "/tedhelper/dev_postgres_db_username"
    ssm_param_dev_postgres_db_password  = "/tedhelper/dev_postgres_db_password"
    ssm_param_dev_postgres_conn_string = "/tedhelper/dev_postgres_db_connection_string"
    ecs_tedhelper_task_definition_tag_name = "tedhelperservice-dev-task-definition"
    ecs_tedhelper_task_definition_app_name = "tedhelperservice"
}

module "tedsimulator-dev-ecs-task-definition" {
    source = "../../../modules/app/task-definition/tedsimulator-task-definition"
    ecs_task_definition_family = "tedsimulator-dev-task-def"
    container_definition_file_path = var.tedsimulator-container_definition_file_path
    cpu = var.cpu
    memory = var.memory
    operating_system_family = var.operating_system_family
    cpu_architecture = var.cpu_architecture
    ecs_tedsim_task_definition_tag_name = "tedsimulator-dev-task-definition"
    ecs_tedsim_task_definition_app_name = "ted-simulator"

}


data "terraform_remote_state" "remote" {
    backend = "s3"

    config = {
      bucket = "terraform-state-config-bucket"
        region = "eu-central-1"
        key    = "dev/init/terraform-init-dev.tfstate"
        profile = "AWSPowerUserAccess-656123244690"
    }
  
}

module "tedhelperservice-dev-ecs-service" {
    source = "../../../modules/app/ecs-service"
    ecs_service_name = "tedhelper-dev-ecs-service"
    ecs_cluster_name = module.tedhelperservice-dev-ecs-cluster.ecs_cluster_name
    ecs_task_def_family = module.tedhelperservice-dev-ecs-task-definition.ecs_tedhelper_task_def_family
    subnets_for_ecs_service = data.terraform_remote_state.remote.outputs.dev_public_subnet_ids
    sg_id_for_ecs_service = data.terraform_remote_state.remote.outputs.sg_id_for_ecs_service
    container_name = var.tedhelper_container_name
    lb_for_ecs_service = data.terraform_remote_state.remote.outputs.tedhelper_alb_target_group_name
    container_port = var.tedhelper_container_port
    ecs_service_app = "tedhelperservice-dev"
}

module "tedsimulator-dev-ecs-service" {
    source = "../../../modules/app/ecs-service"
    ecs_service_name = "tedsimulator-dev-ecs-service"
    ecs_cluster_name = module.tedhelperservice-dev-ecs-cluster.ecs_cluster_name
    ecs_task_def_family = module.tedsimulator-dev-ecs-task-definition.ecs_tedsim_task_def_family
    subnets_for_ecs_service = data.terraform_remote_state.remote.outputs.dev_public_subnet_ids
    sg_id_for_ecs_service = data.terraform_remote_state.remote.outputs.sg_id_for_ecs_service 
    container_name = var.tedsimulator_container_name
    lb_for_ecs_service = data.terraform_remote_state.remote.outputs.tedsimulator_alb_target_group_name
    container_port = var.tedsimulator_container_port
    ecs_service_app = "tedsimulator-dev"
}