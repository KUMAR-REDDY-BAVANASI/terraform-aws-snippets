output "mysqldb_endpoint" {
  description = "The Endpoint for MySQL Database "
  value       = aws_db_instance.mysql.endpoint
}

