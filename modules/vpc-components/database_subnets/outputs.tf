output "database_subnets" {
  value = aws_subnet.database_subnets[*].id
}