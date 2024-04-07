module "prod_vpc" {
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