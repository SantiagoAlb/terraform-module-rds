output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "db_name" {
  value = var.db_name
}

output "db_user" {
  value = var.db_username
}

output "db_password" {
  value     = var.db_password
  # sensitive = true # en produccion seria encriptado
}
