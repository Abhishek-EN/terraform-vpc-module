#region
region = "ap-south-1"

#default tags
tags = {
  "owner" = "Abhishek"
}

#central availbilty zone
availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

#VPC
vpc_creation             = false
vpc_name                 = "changeme"
vpc_cidr_block           = "10.200.0.0/16"
vpc_enable_dns_hostnames = true
vpc_enable_dns_support   = true
vpc_tags = {
  "Managed by" = "Terraform"
}
#central vpc id if not creating vpc use this. if creating vpc then it must be black "". IF YOU ARE NOT CREATING VPC THEN ASSIGN SOME VALUE HERE
vpc_id = "vpc-123456789"



#private subnets
create_private_subnets = false
private_subnets_name   = "changeme"
private_subnet_nat = ""
private_subnets        = [] #["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"] #if you are not creating private subnets then empty the list to reduce conflicts "[]"
private_subnets_tags = {
  "Managed by" = "Terraform"
}

#NAT
nat_create           = false
nat_name             = "changeme"
nat_public_subnet_id = "sb-12456780" #"changeme-1234567890" ##if creating public subnet then it must be blank. IF YOU ARE NOT CREATING PUBLIC SUBNET THEN ASSIGN SOME VALUE HERE
nat_tags = {
  "Managed by" = "Terraform"
}

#public subnets
create_public_subnets = false
igw_create            = false
public_subnet_name    = "changeme"
public_subnets        = [] #["10.200.101.0/24", "10.200.102.0/24", "10.200.103.0/24"]
public_subnets_tags = {
  "Managed by" = "Terraform"
}

#database subnets
create_database_subnets = false
database_subnet_nat     = ""
database_subnets_name   = "changeme"
database_subnets        = []#["10.200.4.0/24", "10.200.5.0/24", "10.200.6.0/24"] #if you are not creating database subnets then empty the list to reduce conflicts "[]"
database_subnets_tags = {
  "Managed by" = "Terraform"
}

#eks subnets
create_eks_subnets = false
eks_subnets_name   = "changeme"
eks_subnet_nat = ""
eks_subnets        = [] #["10.200.7.0/24", "10.200.8.0/24", "10.200.9.0/24"] #if you are not creating eks subnets then empty the list to reduce conflicts "[]"
eks_subnets_tags = {
  "Managed by" = "Terraform"
}

#flow logs cloudwatch
create_flow_logs_cloudwatch = false
flow_logs_cloudwatch_name   = "changeme"

#flow logs s3
create_flow_logs_s3 = false
flow_logs_s3_name   = "changeme"
