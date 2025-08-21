output "private_subnet_1a_id" {
  value = aws_subnet.private-us-east-1a.id
}

output "private_subnet_1b_id" {
  value = aws_subnet.private-us-east-1b.id
}

output "public_subnet_1a_id" {
  value = aws_subnet.public-us-east-1a.id
}

output "public_subnet_1b_id" {
  value = aws_subnet.public-us-east-1b.id
}

output "database_subnet_1a_id" {
  value = aws_subnet.database-us-east-1a.id
}

output "database_subnet_1b_id" {
  value = aws_subnet.database-us-east-1b
}

