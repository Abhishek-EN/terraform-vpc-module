resource "aws_subnet" "private_subnets" {
  count                   = var.create_private_subnets && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = false
  tags = merge(
    {
      "Name" = "${var.name}-private-subnet-${count.index + 1}"
    },
    var.tags,
    var.private_subnets_tags
  )
}

resource "aws_route_table" "private_route_table" {
  count  = var.create_private_subnets && length(var.private_subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.private_subnet_nat
  }
  tags = {
    Name = "${var.name}-private-route-table"
  }
}

resource "aws_route_table_association" "private_rt_associate" {
  # count = var.availability_zones_count
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_route_table[0].id
}