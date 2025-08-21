resource "aws_db_subnet_group" "main" {
  name       = "${var.env_prefix}-db-subnet-group"
  subnet_ids = [aws_subnet.database-us-east-1a.id, aws_subnet.database-us-east-1b.id]

  tags = {
    Name = "${var.env_prefix}-db-subnet-group"
  }
}

# You need a subnet group because AWS RDS requires it to determine where to deploy your database instances.
# used for creating rds

