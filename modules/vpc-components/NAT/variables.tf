variable "nat_create" {
  type = bool
}

variable "public_subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}
variable "nat_tags" {
  type = map(string)
}

variable "name" {
  type = string
}