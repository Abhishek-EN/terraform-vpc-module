variable "create_eks_subnets" {
  type = bool
}

variable "name" {
  type = string
}

variable "eks_subnets" {
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

variable "eks_subnets_tags" {
  type = map(string)
}

variable "eks_subnet_nat" {
  type = string
}