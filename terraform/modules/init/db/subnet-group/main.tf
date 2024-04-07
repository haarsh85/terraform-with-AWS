resource "aws_db_subnet_group" "dev_postgres_subnet_group" {
    name = var.db_subnet_grp_name
    subnet_ids = var.db_subnet_grp_subnet_ids

    tags = {
      Name = "tedhelper-postgres-db"
      Environment = var.environment
      ManagedBy = "terraform"
    }
}