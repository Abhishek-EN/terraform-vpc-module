module "vpc" {
  source               = "./modules/vpc-components/vpc"
  vpc_creation         = var.vpc_creation
  name                 = var.vpc_name
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  vpc_tags             = var.vpc_tags
  tags = merge(
    var.tags
  )
}

module "nat" {
  source           = "./modules/vpc-components/NAT"
  nat_create       = var.nat_create && var.create_private_subnets && length(var.private_subnets) > 0 ? true : false
  name             = var.nat_name
  public_subnet_id = var.nat_public_subnet_id != "" ? var.nat_public_subnet_id : module.public_subnets.public_subnets[0]
  nat_tags         = var.nat_tags
  tags = merge(
    var.tags
  )
}

module "private_subnets" {
  source                 = "./modules/vpc-components/private_subnets"
  name                   = var.private_subnets_name
  create_private_subnets = var.create_private_subnets
  private_subnets        = var.private_subnets
  vpc_id                 = var.vpc_id != "" ? var.vpc_id : module.vpc.vpc_id[0]
  availability_zone      = var.availability_zone
  private_subnet_nat     = var.private_subnet_nat != "" ? var.private_subnet_nat : join(",", module.nat.nat_id)
  tags                   = var.tags
  private_subnets_tags   = var.private_subnets_tags
}

module "public_subnets" {
  source                = "./modules/vpc-components/public_subnets"
  create_public_subnets = var.create_public_subnets
  igw_create            = var.igw_create
  name                  = var.public_subnet_name
  public_subnets        = var.public_subnets
  vpc_id                = var.vpc_id != "" ? var.vpc_id : module.vpc.vpc_id[0]
  availability_zone     = var.availability_zone
  tags                  = var.tags
  public_subnets_tags   = var.public_subnets_tags
}

module "database_subnets" {
  source                  = "./modules/vpc-components/database_subnets"
  name                    = var.database_subnets_name
  create_database_subnets = var.create_database_subnets
  database_subnets        = var.database_subnets
  vpc_id                  = var.vpc_id != "" ? var.vpc_id : module.vpc.vpc_id[0]
  availability_zone       = var.availability_zone
  database_subnet_nat     = var.database_subnet_nat != "" ? var.database_subnet_nat : join(",", module.nat.nat_id)
  tags                    = var.tags
  database_subnets_tags   = var.database_subnets_tags
}

module "eks_subnets" {
  source             = "./modules/vpc-components/eks_subnets"
  name               = var.eks_subnets_name
  create_eks_subnets = var.create_eks_subnets
  eks_subnets        = var.eks_subnets
  vpc_id             = var.vpc_id != "" ? var.vpc_id : module.vpc.vpc_id[0]
  availability_zone  = var.availability_zone
  eks_subnet_nat     = var.eks_subnet_nat != "" ? var.eks_subnet_nat : join(",", module.nat.nat_id)
  tags               = var.tags
  eks_subnets_tags   = var.eks_subnets_tags
}

module "flow_logs_cloudwatch" {
  source                      = "./modules/vpc-components/flow_logs_cloudwatch"
  create_flow_logs_cloudwatch = var.create_flow_logs_cloudwatch
  vpc_id                      = var.vpc_id != "" ? var.vpc_id : module.vpc.vpc_id[0]
  name                        = var.flow_logs_cloudwatch_name
}

module "flow_logs_s3" {
  source              = "./modules/vpc-components/flow_logs_S3"
  create_flow_logs_s3 = var.create_flow_logs_s3
  vpc_id              = var.vpc_id != "" ? var.vpc_id : module.vpc.vpc_id[0]
  name                = var.flow_logs_s3_name
}