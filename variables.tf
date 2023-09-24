
#Region
variable "region" {
  type = string
}

#ALL DEFAULT TAGS

variable "tags" {
  type = map(string)
}

#VPC
variable "vpc_creation" {
  type = bool
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_enable_dns_hostnames" {
  type = bool
}

variable "vpc_enable_dns_support" {
  type = bool
}

variable "vpc_tags" {
  type = map(string)
}

#central vpc id
variable "vpc_id" {
  type = string
}

#central availablity zone
variable "availability_zone" {
  type = list(string)
}

#private subnets
variable "create_private_subnets" {
  type = bool
}

variable "private_subnets_name" {
  type = string
}

variable "private_subnet_nat" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "private_subnets_tags" {
  type = map(string)
}

#NAT
variable "nat_create" {
  type = bool
}

variable "nat_name" {
  type = string
}

variable "nat_public_subnet_id" {
  type = string
}

variable "nat_tags" {
  type = map(string)
}

#public subnets
variable "create_public_subnets" {
  type = bool
}

variable "igw_create" {
  type = bool
}

variable "public_subnet_name" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "public_subnets_tags" {
  type = map(string)
}

#database subnets

variable "database_subnet_nat" {
  type = string
}

variable "create_database_subnets" {
  type = bool
}

variable "database_subnets_name" {
  type = string
}

variable "database_subnets" {
  type = list(string)
}

variable "database_subnets_tags" {
  type = map(string)
}

#EKS subnets
variable "create_eks_subnets" {
  type = bool
}

variable "eks_subnets_name" {
  type = string
}

variable "eks_subnet_nat" {
  type = string
}

variable "eks_subnets" {
  type = list(string)
}

variable "eks_subnets_tags" {
  type = map(string)
}

# flow logs cloudwatch

variable "create_flow_logs_cloudwatch" {
  type = bool
}

variable "flow_logs_cloudwatch_name" {
  type = string
}


#flow logs S3
variable "create_flow_logs_s3" {
  type = bool
}

variable "flow_logs_s3_name" {
  type = string
}