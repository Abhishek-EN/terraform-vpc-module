# Terraform VPC Module

Welcome to the Terraform VPC module repository. This module is designed to simplify the creation of a versatile Virtual Private Cloud (VPC) infrastructure on AWS. It streamlines the process of setting up essential network components for your AWS environment.

## Usage

To utilize this Terraform module, you only need to make adjustments to the `terraform.tfvars` file. This file allows you to tailor the VPC configuration to your specific needs.


## Features

Our Terraform VPC module provides the following features:

- **VPC Creation**: Easily create a VPC in AWS.

- **Public Subnets**: Automatically set up public subnets complete with an internet gateway, route table, and necessary routes with the option to select Availability Zones.

- **Private, Database, EKS Subnets**: Configure subnets with NAT gateways, route tables, and essential routes with the option to select Availability Zones.

- **VPC flow logs (Cloudwatch and S3)**: Set `create_flow_logs_s3` or `create_flow_logs_cloudwatch` to true and terraform will take care of IAM roles, policy or S3 buckets.

This Terraform module is your go-to solution for building a robust and flexible AWS VPC infrastructure.

### Configuration in `terraform.tfvars`

Make sure to configure the following settings in your `terraform.tfvars` file:

```hcl
region = "ap-south-1"  # Set the region according to your use.

```
```hcl

Default tags: All tags in this block will be applied to all resources.
tags = {
  "owner" = "Abhishek"
}

```

```hcl

central availbilty zone: Set this list accoording to AZ's available in the region you have configured.
Note: Subnets will be created in the same order you are specifying AZ.

availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

```

```hcl
central vpc id: If you are creating VPC then the value here must be blank string "". if not creating `VPC` use this to pass vpc_id to all resources. values passed here will be used as vpc id. 

vpc_id = "vpc-123456789"
``````

```hcl

vpc_creation             = false     # Set to true to create a VPC.
vpc_name                 = "Production" # Name of the VPC.
vpc_cidr_block           = "10.200.0.0/16"  # CIDR block for the VPC.
vpc_enable_dns_hostnames = true     # Enable DNS hostnames for instances in the VPC.
vpc_enable_dns_support   = true     # Enable DNS support for the VPC.

# Tags specific to the VPC resource.
vpc_tags = {
  "Managed by" = "Terraform"
}
```

```hcl

# Public Subnets Configuration
NOTE: Route table and routes will be created automatically.

create_public_subnets = true 
igw_create            = true  # Required when creating Public subnets
public_subnet_name    = "Production"  # Name for the public subnets. You just need to specify main name, it will add public-subnet-{count index} by default.
public_subnets        = ["10.200.101.0/24", "10.200.102.0/24", "10.200.103.0/24"]  # List of public subnet CIDR blocks.

# Tags specific to the public subnets.
public_subnets_tags = {
  "Managed by" = "Terraform"
}


```

```hcl

# Private Subnets Configuration
NOTE: Route table and routes will be created automatically.
create_private_subnets = true 
private_subnets_name   = "production"  #  # Name for the private subnets. You just need to specify main name, it will add private-subnet-{count index} by default.
private_subnet_nat     = ""  # ID of the NAT gateway in case you are not creating NAT from here. If creating leave it blank.


private_subnets = ["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"] # List of private subnet CIDR blocks. Empty the list to if not creating private subnets and make create_private_subnets = false

# Tags specific to the private subnets.
private_subnets_tags = {
  "Managed by" = "Terraform"
}

# NAT Configuration
nat_create           = true  # If not creating NAT set it to false.
nat_name             = "production"  # Name for the NAT gateway.
nat_public_subnet_id = ""  # Optional. If you are not creating public subnets here then specify Public subnet id to create public nat gateway. If not creating NAT (false) then specify random value. If creating then leave it blank and NAT gateway will be created in first (index) public subnet.

# Tags specific to the NAT gateway.
nat_tags = {
  "Managed by" = "Terraform"
}


```

```hcl

# Database subnets Configuration
NOTE: Route table and routes will be created automatically.

create_database_subnets = true
database_subnets_name   = "production"
database_subnet_nat     = "" # ID of the NAT gateway in case you are not creating NAT from here. If creating leave it blank.
database_subnets        = ["10.200.4.0/24", "10.200.5.0/24", "10.200.6.0/24"] #if you are not creating database subnets then empty the list to reduce conflicts "[]" and set create_database_subnets = false.

# Tags specific to the NAT gateway.
database_subnets_tags = {
  "Managed by" = "Terraform"
}

```

```hcl

# EKS subnets Configuration
NOTE: Route table and routes will be created automatically.

create_eks_subnets = true
eks_subnets_name   = "production"
eks_subnet_nat = "" # ID of the NAT gateway in case you are not creating NAT from here. If creating leave it blank.
eks_subnets        = ["10.200.7.0/24", "10.200.8.0/24", "10.200.9.0/24"] #if you are not creating eks subnets then empty the list to reduce conflicts "[]"  and set create_eks_subnets = false.
eks_subnets_tags = {
  "Managed by" = "Terraform"
}

```

```hcl

#flow logs cloudwatch configuration
NOTE: Cloudwatch logs group will be created with name = ${flow_logs_cloudwatch_name}-log-group by default along with the required IAM roles.

create_flow_logs_cloudwatch = false
flow_logs_cloudwatch_name   = "production"

```


```hcl

#flow logs s3 configuration
NOTE: S3 bucket will be created with name = ${var.flow_logs_s3_name}-flow-logs-bucket

create_flow_logs_s3 = true
flow_logs_s3_name   = "production"


```