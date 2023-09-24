resource "aws_subnet" "public_subnets" {
  count                   = var.create_public_subnets && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true
  tags = merge(
    {
      "Name" = "${var.name}-public-subnet-${count.index + 1}"
    },
    var.tags,
    var.public_subnets_tags
  )
}


resource "aws_internet_gateway" "IGW" {
  count  = var.igw_create ? 1 : 0
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.name}-IGW"
  }
}

resource "aws_route_table" "public_route_table" {
  count  = var.create_public_subnets && length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW[0].id
  }
  tags = {
    Name = "${var.name}-public-route-table"
  }
}

resource "aws_route_table_association" "public_rt_associate" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table[0].id
}