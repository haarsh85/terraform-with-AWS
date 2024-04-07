output "dev_vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "dev_public_subnet_ids" {
  value = module.dev_vpc.public_subnet_ids
}

output "dev_private_subnet_ids" {
  value = module.dev_vpc.private_subnet_ids
}

output "sg_id_for_ecs_service" {
  value = module.dev_ecs_service_sg.sg_id_for_ecs_service
}

output "postgres_db_subnet_group_name" {
    value = module.dev_postgres_db_subnet_group.postgres_db_subnet_group_name
  
}

output "postgres_db_subnet_group_vpc_id" {
    value = module.dev_postgres_db_subnet_group.postgres_db_subnet_group_vpc_id
  
}

output "cleaner_api_endpoint" {
    value = module.dev_cleaner_api_gateway.cleaner_api_endpoint
  
}

output "cleaner_api_identifier" {
    value = module.dev_cleaner_api_gateway.cleaner_api_identifier
  
}

output "tedhelper_alb_target_group_name" {
  value = module.dev_tedhelper_target_group.target_group_arn
  
}

output "tedsimulator_alb_target_group_name" {
  value = module.dev_tedsimulator_target_group.target_group_arn
  
}

output "provider_alb_target_group_name" {
  value = module.dev_providerservice_target_group.target_group_arn
  
}

output "provider_mongodb_alb_target_group_name" {
  value = module.dev_providerservice_mongodb_target_group.target_group_arn
  
}






