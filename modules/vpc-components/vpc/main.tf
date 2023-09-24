data "aws_availability_zones" "available" {

}

resource "aws_vpc" "vpc" {
  count                = var.vpc_creation ? 1 : 0
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(
    {
      Name = "${var.name}"
    },
    var.tags,
    var.vpc_tags
  )
}