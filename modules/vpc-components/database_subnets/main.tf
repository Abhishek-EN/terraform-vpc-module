resource "aws_subnet" "database_subnets" {
  count                   = var.create_database_subnets && length(var.database_subnets) > 0 ? length(var.database_subnets) : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.database_subnets[count.index]
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = false
  tags = merge(
    {
      "Name" = "${var.name}-database-subnet-${count.index + 1}"
    },
    var.tags,
    var.database_subnets_tags
  )
}

resource "aws_route_table" "database_route_table" {
  count  = var.create_database_subnets && length(var.database_subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.database_subnet_nat
  }
  tags = {
    Name = "${var.name}-database-route-table"
  }
}

resource "aws_route_table_association" "database_rt_associate" {
  # count = var.availability_zones_count
  count          = length(var.database_subnets)
  subnet_id      = element(aws_subnet.database_subnets[*].id, count.index)
  route_table_id = aws_route_table.database_route_table[0].id
}