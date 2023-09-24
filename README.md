# Terraform VPC Module

Welcome to the Terraform VPC module repository. This module is designed to simplify the creation of a versatile Virtual Private Cloud (VPC) infrastructure on AWS. It streamlines the process of setting up essential network components for your AWS environment.

## Usage

To utilize this Terraform module, you only need to make adjustments to the `terraform.tfvars` file. This file allows you to tailor the VPC configuration to your specific needs.


## Features

Our Terraform VPC module provides the following features:

- **VPC Creation**: Easily create a VPC in AWS, with the option to select Availability Zones.

- **Public Subnets**: Automatically set up public subnets complete with an internet gateway, route table, and necessary routes.

- **Private Subnets**: Configure private subnets with NAT gateways, route tables, and essential routes for secure networking.

- **Database Subnets**: Create subnets optimized for database workloads with appropriate route tables and routes for NAT connectivity.

- **EKS Subnets**: Streamline the setup of subnets tailored for Amazon Elastic Kubernetes Service (EKS), including route tables and routes optimized for NAT connectivity.

This Terraform module is your go-to solution for building a robust and flexible AWS VPC infrastructure.

### Configuration in `terraform.tfvars`

Make sure to configure the following settings in your `terraform.tfvars` file:

```hcl
region = "ap-south-1"  # Set the region according to your use.

Default tags - All tags in this block will be applied to all resources.
tags = {
  "owner" = "Abhishek"
}

central availbilty zone - Set this list accoording to AZ's available in the region you have configured.
Note: Subnets will be created in the same order you are specifying AZ.
availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
```