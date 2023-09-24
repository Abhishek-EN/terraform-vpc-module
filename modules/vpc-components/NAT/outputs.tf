output "nat_id" {
  value = [for i in aws_nat_gateway.NAT : i.id]
}