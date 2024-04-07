output "postgres_db_subnet_group_name" {
    value = aws_db_subnet_group.dev_postgres_subnet_group.id
  
}

output "postgres_db_subnet_group_vpc_id" {
    value = aws_db_subnet_group.dev_postgres_subnet_group.vpc_id
  
}