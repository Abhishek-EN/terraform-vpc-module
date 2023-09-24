#region
region = "ap-south-1"

#default tags
tags = {
  "owner" = "Abhishek"
}

#central availbilty zones
availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

#If you are creating VPC then the value here must be blank string "". if not creating `VPC` use this to pass vpc_id to all resources. values passed here will be used as vpc id.
vpc_id = "vpc-123456789"

#VPC
vpc_creation             = false
vpc_name                 = "changeme"
vpc_cidr_block           = "10.200.0.0/16"
vpc_enable_dns_hostnames = true
vpc_enable_dns_support   = true
vpc_tags = {
  "Managed by" = "Terraform"
}


#public subnets
create_public_subnets = true
igw_create            = false
public_subnet_name    = "Production"
public_subnets        = ["10.200.101.0/24", "10.200.102.0/24", "10.200.103.0/24"]
public_subnets_tags = {
  "Managed by" = "Terraform"
}


#private subnets
create_private_subnets = true
private_subnets_name   = "production"
private_subnet_nat = "" # ID of the NAT gateway in case you are not creating NAT from here. If creating leave it blank.
private_subnets        = ["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"]  #if you are not creating private subnets then empty the list to reduce conflicts "[]"
private_subnets_tags = {
  "Managed by" = "Terraform"
}

#NAT
nat_create           = true
nat_name             = "production"
nat_public_subnet_id = "" # Nat-1234567890" Optional. If you are not creating public subnets here then specify Public subnet id to create public nat gateway. If not creating NAT (false) then specify random value. If creating then leave it blank.
nat_tags = {
  "Managed by" = "Terraform"
}



#database subnets
create_database_subnets = false
database_subnet_nat     = "" # ID of the NAT gateway in case you are not creating NAT from here. If creating leave it blank.
database_subnets_name   = "production"
database_subnets        = []#["10.200.4.0/24", "10.200.5.0/24", "10.200.6.0/24"] #if you are not creating database subnets then empty the list to reduce conflicts "[]"
database_subnets_tags = {
  "Managed by" = "Terraform"
}

#eks subnets
create_eks_subnets = true
eks_subnets_name   = "production"
eks_subnet_nat = "" # ID of the NAT gateway in case you are not creating NAT from here. If creating leave it blank.
eks_subnets        = ["10.200.7.0/24", "10.200.8.0/24", "10.200.9.0/24"] #if you are not creating eks subnets then empty the list to reduce conflicts "[]"
eks_subnets_tags = {
  "Managed by" = "Terraform"
}

#flow logs cloudwatch
create_flow_logs_cloudwatch = false
flow_logs_cloudwatch_name   = "production"

#flow logs s3
create_flow_logs_s3 = false
flow_logs_s3_name   = "production"
