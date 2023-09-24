variable "create_database_subnets" {
  type = bool
}

variable "name" {
  type = string
}

variable "database_subnets" {
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

variable "database_subnets_tags" {
  type = map(string)
}

variable "database_subnet_nat" {
  type = string
}