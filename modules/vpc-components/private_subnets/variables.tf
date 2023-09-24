variable "create_private_subnets" {
  type = bool
}

variable "name" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "availability_zone" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "private_subnets_tags" {
  type = map(string)
}

variable "private_subnet_nat" {
  type = string
}