variable "cidr_block" {
  default = {}
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}
variable "common_tags" {
  default = {}
}

variable "vpc_tags" {
  default = {}
}

variable "gw_name" {
  default = {}
}
variable "public_cidr" {
  default = {}
}

variable "public_tags_name" {
  default = {}
}

variable "awz" {
  
}

variable "private_cidr" {
  default = {}
}

variable "private_tags_name" {
  default = {}
}

variable "database_cidr" {
  default = {}
}

variable "database_tags_name" {
  default = {}
}

variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {
  default = {}
}

variable "database_route_table_tags" {
  default = {}
}