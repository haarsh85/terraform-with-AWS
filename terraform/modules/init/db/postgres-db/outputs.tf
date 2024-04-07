output "postgres_db_hostname" {
    value = aws_db_instance.tedhelper_postgres_db.address
  
}

output "postgres_db_name" {
    value = aws_db_instance.tedhelper_postgres_db.db_name
  
}

output "postgres_db_username" {
    value = aws_db_instance.tedhelper_postgres_db.username
  
}

output "postgres_db_port" {
    value = aws_db_instance.tedhelper_postgres_db.port
  
}