resource "aws_db_instance" "mysql" {
  identifier        = "mysql"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.db_instance_class
  allocated_storage = 25
  max_allocated_storage = 100

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.rds_sg_id]

  # Fault tolerance
  multi_az = true

  # Backups
  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:04:00-sun:05:00"

  # Security
  publicly_accessible       = false
  deletion_protection       = false # true si fuera de produccion
  skip_final_snapshot       = false
  final_snapshot_identifier = "mysql-final-snapshot"

  # # Performance Insights (No esta soportado)
  # performance_insights_enabled          = true
  # performance_insights_retention_period = 7


  tags = { Name = "obligatorio-mysql" }
}









