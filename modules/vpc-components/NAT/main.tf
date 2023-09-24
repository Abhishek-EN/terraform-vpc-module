resource "aws_eip" "EIP" {
  count = var.nat_create ? 1 : 0
  vpc   = true
}

resource "aws_nat_gateway" "NAT" {
  count             = var.nat_create ? 1 : 0
  connectivity_type = "public"
  allocation_id     = aws_eip.EIP[0].id
  subnet_id         = var.public_subnet_id
  tags = merge(
    {
      Name = "${var.name}-NAT"
    },
    var.tags,
    var.nat_tags
  )
}