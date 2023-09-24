resource "aws_subnet" "eks_subnets" {
  count                   = var.create_eks_subnets && length(var.eks_subnets) > 0 ? length(var.eks_subnets) : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.eks_subnets[count.index]
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = false
  tags = merge(
    {
      "Name" = "${var.name}-eks-subnet-${count.index + 1}"
    },
    var.tags,
    var.eks_subnets_tags
  )
}

resource "aws_route_table" "eks_route_table" {
  count  = var.create_eks_subnets && length(var.eks_subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.eks_subnet_nat
  }
  tags = {
    Name = "${var.name}-eks-route-table"
  }
}

resource "aws_route_table_association" "eks_rt_associate" {
  # count = var.availability_zones_count
  count          = length(var.eks_subnets)
  subnet_id      = element(aws_subnet.eks_subnets[*].id, count.index)
  route_table_id = aws_route_table.eks_route_table[0].id
}