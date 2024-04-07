output "prod_vpc_id" {
  value = module.prod_vpc.vpc_id
}

output "prod_public_subnet_ids" {
  value = module.prod_vpc.public_subnet_ids
}

output "prod_private_subnet_ids" {
  value = module.prod_vpc.private_subnet_ids
}

output "sg_id_for_ecs_service" {
  value = module.ecs_service_sg.sg_id_for_ecs_service
}