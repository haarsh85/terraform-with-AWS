module "dev_vpc" {
    source = "../../modules/init/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    name = var.name
    environment = var.environment
    public_subnet_cidr_block = var.public_subnet_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block
    subnet_availability_zone = var.subnet_availability_zone
    public_subnet_name = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    public_rt_name = var.public_rt_name
    private_rt_name = var.private_rt_name

}

module "dev_postgres_db_sg" {
    source = "../../modules/init/security-group/postgres-db-security-group"
    postgres_db_sg_name = var.postgres_db_sg_name
    vpc_id = module.dev_vpc.vpc_id
    environment = var.environment  
}


module "dev_postgres_db_subnet_group" {
    source = "../../modules/init/db/subnet-group"
    db_subnet_grp_name = var.postgres_db_subnet_grp_name
    db_subnet_grp_subnet_ids = module.dev_vpc.public_subnet_ids
    environment = var.environment
  
}

data "aws_ssm_parameter" "dev_postgres_db_username" {
  name = "/tedhelper/dev_postgres_db_username"
}

data "aws_ssm_parameter" "dev_postgres_db_password" {
  name = "/tedhelper/dev_postgres_db_password"
}

module "dev_postgres_db" {
    source = "../../modules/init/db/postgres-db"
    postgres_db_identifier = var.postgres_db_identifier
    postgres_db_subnet_grp_name = module.dev_postgres_db_subnet_group.postgres_db_subnet_group_name
    postgres_db_name = var.postgres_db_name
    postgres_db_username = data.aws_ssm_parameter.dev_postgres_db_username.value
    postgres_db_password = data.aws_ssm_parameter.dev_postgres_db_password.value
    postgres_db_instance_class = var.postgres_db_instance_class
    postgres_security_group_ids = module.dev_postgres_db_sg.sg_id_for_postgres_db
    postgres_db_tag_name = var.postgres_db_tag_name
    postgres_db_tag_application = var.postgres_db_tag_application
}

module "dev_cleaner_api_gateway" {
    source = "../../modules/init/api-gateway"
    api_gw_name = var.api_gw_name
    environment = var.environment
    dev_alb_dns_name_for_create_break_time_post = "http://${module.dev_alb.alb_dns_name}:8050/api/v1/create-break-time"
    dev_alb_dns_name_for_create_travel_time_post = "http://${module.dev_alb.alb_dns_name}:8050/api/v1/create-travel-time"
    dev_alb_dns_name_for_create_work_time_post = "http://${module.dev_alb.alb_dns_name}:8050/api/v1/create-work-time"
    dev_alb_dns_name_for_api_projects_get = "http://${module.dev_alb.alb_dns_name}:3000/api/projects"
    dev_alb_dns_name_for_api_projects_post = "http://${module.dev_alb.alb_dns_name}:3000/api/projects"
    dev_alb_dns_name_for_api_projects_update_put = "http://${module.dev_alb.alb_dns_name}:3000/api/projects/update/{id}"
    dev_alb_dns_name_for_api_projects_id_get = "http://${module.dev_alb.alb_dns_name}:3000/api/projects/{id}"
    dev_alb_dns_name_for_api_v1_users_login_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/users/login"
    dev_alb_dns_name_for_api_v1_users_register_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/users/register"
    dev_alb_dns_name_for_api_v1_schedule_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/schedule"
    dev_alb_dns_name_for_api_v1_schedule_get = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/schedule"
    dev_alb_dns_name_for_api_v1_schedule_id_delete = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/schedule/{scheduleID}"
    dev_alb_dns_name_for_api_v1_schedules_delete = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/schedule"
    dev_alb_dns_name_for_api_v1_schedule_patch = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/schedule/{scheduleID}"
    dev_alb_dns_name_for_api_v1_user_get = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/user"
    dev_alb_dns_name_for_api_timesheets_post = "http://${module.dev_alb.alb_dns_name}:3000/api/timesheets"
    dev_alb_dns_name_for_api_activity_post = "http://${module.dev_alb.alb_dns_name}:3000/api/activity"
    dev_alb_dns_name_for_api_user_create_post = "http://${module.dev_alb.alb_dns_name}:3000/api/user/create"
    dev_alb_dns_name_for_api_user_id_get = "http://${module.dev_alb.alb_dns_name}:3000/api/user/{uuId}"
    dev_alb_dns_name_for_api_v1_vehicle_location_get = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/vehicleLocation"
    dev_alb_dns_name_for_api_v1_vehicle_location_get_id = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/vehicleLocation/{vehicleLocationID}"
    dev_alb_dns_name_for_api_v1_vehicle_location_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/vehicleLocation"
    dev_alb_dns_name_for_api_v1_vehicle_location_patch = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/vehicleLocation/{vehicleLocationID}"
    dev_alb_dns_name_for_api_v1_projects_get = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/projects"
    dev_alb_dns_name_for_api_v1_projects_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/projects"
    dev_alb_dns_name_for_api_v1_projects_patch = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/projects/{projectID}"
    dev_alb_dns_name_for_api_v1_tags_get = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/tags"
    dev_alb_dns_name_for_api_v1_tags_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/tags"
    dev_alb_dns_name_for_api_v1_tags_patch = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/tags/{tagID}"
    dev_alb_dns_name_for_api_v1_activity_get = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/activity"
    dev_alb_dns_name_for_api_v1_activity_post = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/activity"
    dev_alb_dns_name_for_api_v1_activity_patch = "http://${module.dev_alb.alb_dns_name}:5000/api/v1/activity/{activityID}"


}


module "dev_ecs_service_sg" {
    source = "../../modules/init/security-group/ecs-security-group"
    vpc_id = module.dev_vpc.vpc_id
    environment = var.environment
    ecs_service_sg_name = "dev-ecs-sg"
}

module "dev_tedhelper_cloudwatch_logs" {
    source = "../../modules/init/cloudwatch"
    cloudwatch_log_group_name = "/ecs/tedhelperservice-dev"
    cloudwatch_log_group_app = "tedhelper"
  
}

module "dev_tedsimulator_cloudwatch_logs" {
    source = "../../modules/init/cloudwatch"
    cloudwatch_log_group_name = "/ecs/ted-simulator-dev"
    cloudwatch_log_group_app = "tedsimulator"
  
}

module "dev_providerservice_cloudwatch_logs" {
    source = "../../modules/init/cloudwatch"
    cloudwatch_log_group_name = "/ecs/providerservice-dev"
    cloudwatch_log_group_app = "providerservice"
  
}

module "dev_providerservice_mongodb_cloudwatch_logs" {
    source = "../../modules/init/cloudwatch"
    cloudwatch_log_group_name = "/ecs/providerservice-mongodb-dev"
    cloudwatch_log_group_app = "providerservice-mongodb"
  
}


module "dev_alb_sg" {
    source = "../../modules/init/security-group/alb-security-group"
    alb_sg_name = var.alb_sg_name
    vpc_id = module.dev_vpc.vpc_id
    environment = var.environment

}

# module "dev_alb_access_log_s3_bucket" {
#     source = "../../modules/app/s3/alb-access-log-bucket"
#     alb_access_log_bucket_name = var.alb_access_log_bucket_name
# }

# module "dev_alb_connection_log_s3_bucket" {
#     source = "../../modules/app/s3/alb-connection-log-bucket"
#     alb_connection_log_bucket_name = var.alb_connection_log_bucket_name
# }

module "dev_alb" {
    source = "../../modules/init/alb"
    alb_name = var.alb_name
    alb_sg = module.dev_alb_sg.sg_id_for_alb
    subnets_for_alb = module.dev_vpc.public_subnet_ids
    # alb_dev_access_log_s3_bucket = module.dev_alb_access_log_s3_bucket.alb_access_s3_bucket_name
    # alb_dev_connection_log_s3_bucket = module.dev_alb_connection_log_s3_bucket.alb_connection_s3_bucket_name
    environment = var.environment

}

module "dev_tedhelper_target_group" {
    source = "../../modules/init/alb/tedhelper-alb-target-group"
    alb_arn = module.dev_alb.alb_arn
    vpc_for_lb_target_group = module.dev_vpc.vpc_id
    port_for_lb_target_group = var.tedhelper_port_for_lb_target_group
    health_check_path = var.tedhelper_health_check_path
    target_group_name = var.tedhelper_target_group_name 
    target_group_arn = module.dev_tedhelper_target_group.target_group_arn
    lb_target_group_app = "tedhelper"
    lb_target_group_name = "tedhelper-target-group-dev"
    lb_listener_app = "tedhelper"
    lb_listener_name = "tedhelper-listener-dev"
}

module "dev_tedsimulator_target_group" {
    source = "../../modules/init/alb/tedsimulator-alb-target-group"
    alb_arn = module.dev_alb.alb_arn
    vpc_for_lb_target_group = module.dev_vpc.vpc_id
    port_for_lb_target_group = var.tedsimulator_port_for_lb_target_group
    health_check_path = var.tedsimulator_health_check_path
    target_group_name = var.tedsimulator_target_group_name
    target_group_arn = module.dev_tedsimulator_target_group.target_group_arn
    lb_target_group_app = "tedsimulator"
    lb_target_group_name = "tedsimulator-target-group-dev"
    lb_listener_app = "tedsimulator"
    lb_listener_name = "tedsimulator-listener-dev"
}


module "dev_providerservice_target_group" {
    source = "../../modules/init/alb/provider-alb-target-group"
    alb_arn = module.dev_alb.alb_arn
    vpc_for_lb_target_group = module.dev_vpc.vpc_id
    port_for_lb_target_group = var.provider_port_for_lb_target_group
    health_check_path = var.provider_health_check_path
    target_group_name = var.provider_target_group_name
    target_group_arn = module.dev_providerservice_target_group.target_group_arn
    lb_target_group_app = "providerservice"
    lb_target_group_name = "providerservice-target-group-dev"
    lb_listener_app = "providerservice"
    lb_listener_name = "providerservice-listener-dev"
}

module "dev_providerservice_mongodb_target_group" {
    source = "../../modules/init/alb/provider-mongo-alb-target-group"
    alb_arn = module.dev_alb.alb_arn
    vpc_for_lb_target_group = module.dev_vpc.vpc_id
    port_for_lb_target_group = var.provider_mongodb_port_for_lb_target_group
    health_check_path = var.provider_mongodb_health_check_path
    target_group_name = var.provider_mongodb_target_group_name
    #target_group_arn = module.dev_providerservice_mongodb_target_group.target_group_arn
    lb_target_group_app = "providerservice-mongodb"
    lb_target_group_name = "providerservice-mongodb-target-group-dev"
    lb_listener_app = "providerservice-mongodb"
    lb_listener_name = "providerservice-mongodb-listener-dev"

}