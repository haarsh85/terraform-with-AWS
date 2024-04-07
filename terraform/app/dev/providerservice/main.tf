module "providerservice-dev-ecr-repo" {
    source = "../../../modules/app/ecr/ecr-providerservice"
    ecr_repo_name = var.ecr_repo_name
    environment = var.environment
    name = var.ecr_repo_name
}

module "providerservice-dev-ecs-cluster" {
    source = "../../../modules/app/ecs-cluster"
    ecs_cluster_name = var.ecs_cluster_name
    ecs_cluster_app_name = var.ecs_cluster_app_name
    ecs_cluster_tag_name = var.ecs_cluster_tag_name
}

module "providerservice-dev-ecs-task-definition" {
    source = "../../../modules/app/task-definition/providerservice-task-definition"
    ecs_task_definition_family = "providerservice-dev-task-def"
    #container_definition_file_path = var.providerservice-container_definition_file_path
    cpu = var.cpu
    memory = var.memory
    operating_system_family = var.operating_system_family
    cpu_architecture = var.cpu_architecture
    fetch_sensitive_info_from_ssm = true
    ssm_param_dev_provider_db_url = "/provider/dev_db_url"
    ssm_param_dev_provider_secret = "/provider/dev_secret"
    ecs_provider_task_definition_tag_name = "providerservice-dev-task-definition"
    ecs_provider_task_definition_app_name = "providerservice"
}

module "providerservice-mongodb-dev-ecs-task-definition" {
    source = "../../../modules/app/task-definition/provider-mongodb-task-definition"
    ecs_task_definition_family = "providerservice-mongodb-dev-task-def"
    #container_definition_file_path = var.providerservice-mongodb-container_definition_file_path
    cpu = var.cpu
    memory = var.memory
    operating_system_family = var.operating_system_family
    cpu_architecture = var.cpu_architecture
    fetch_sensitive_info_from_ssm = true
    ssm_param_dev_mongodb_username = "/provider/dev_mongodb_username"
    ssm_param_dev_mongodb_password = "/provider/dev_mongodb_password"
    ecs_provider_mongodb_task_definition_tag_name = "providerservice-mongodb-dev-task-definition"
    ecs_provider_mongodb_task_definition_app_name = "providerservice-mongodb"
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

module "providerservice-mongdb-dev-ecs-service" {
    source = "../../../modules/app/ecs-service"
    ecs_service_name = "providerservice-mongdb-dev-ecs-service"
    ecs_cluster_name = module.providerservice-dev-ecs-cluster.ecs_cluster_name
    ecs_task_def_family = module.providerservice-mongodb-dev-ecs-task-definition.ecs_provider_mongodb_task_def_family
    subnets_for_ecs_service = data.terraform_remote_state.remote.outputs.dev_public_subnet_ids
    sg_id_for_ecs_service = data.terraform_remote_state.remote.outputs.sg_id_for_ecs_service
    container_name = var.provider_mongodb_container_name
    container_port = var.provider_mongodb_container_port
    lb_for_ecs_service = data.terraform_remote_state.remote.outputs.provider_mongodb_alb_target_group_name
    ecs_service_app = "providersrevice-mongodb-dev"
}

module "providerservice-dev-ecs-service" {
    source = "../../../modules/app/ecs-service"
    ecs_service_name = "providerservice-dev-ecs-service"
    ecs_cluster_name = module.providerservice-dev-ecs-cluster.ecs_cluster_name
    ecs_task_def_family = module.providerservice-dev-ecs-task-definition.ecs_provider_task_def_family
    subnets_for_ecs_service = data.terraform_remote_state.remote.outputs.dev_public_subnet_ids
    sg_id_for_ecs_service = data.terraform_remote_state.remote.outputs.sg_id_for_ecs_service
    container_name = var.provider_container_name
    container_port = var.provider_container_port
    lb_for_ecs_service = data.terraform_remote_state.remote.outputs.provider_alb_target_group_name
    ecs_service_app = "providersrevice-dev"
}