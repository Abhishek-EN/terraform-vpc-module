variable "create_public_subnets" {
  type = bool
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "availability_zone" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "public_subnets_tags" {
  type = map(string)
}

#IGW
variable "igw_create" {
  type = bool
}
