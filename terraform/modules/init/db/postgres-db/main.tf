resource "aws_db_instance" "tedhelper_postgres_db" {
    identifier = var.postgres_db_identifier
    instance_class = var.postgres_db_instance_class
    db_name = var.postgres_db_name
    engine = "postgres"
    engine_version = "16.1"
    apply_immediately = true
    multi_az = false
    username = var.postgres_db_username
    password = var.postgres_db_password
    db_subnet_group_name = var.postgres_db_subnet_grp_name
    publicly_accessible = true
    skip_final_snapshot = true
    storage_type = "gp2"
    vpc_security_group_ids = [var.postgres_security_group_ids]
    port = "5432"
    performance_insights_enabled = true
    performance_insights_retention_period = "7"
    backup_retention_period = "1"
    allocated_storage = "20"
    auto_minor_version_upgrade = false
    storage_encrypted = true

    tags = {
      Name = var.postgres_db_tag_name
      Application = var.postgres_db_tag_application
      ManagedBy = "terraform"
    }
}