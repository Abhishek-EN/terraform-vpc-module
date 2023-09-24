
variable "vpc_creation" {
  type = bool
}

variable "name" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_dns_support" {
  type = bool
}

variable "tags" {
  type = map(string)
}

variable "vpc_tags" {
  type = map(string)
}