variable "cidr_block" {
  
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

variable "env" {
  
}

variable "project_name" {
  
}

variable "common_tags" {

  
}
variable "vpc_tags" {
  default = {}
}

variable "internet_gateway_tags" {
  default = {}
}

variable "public_subnet_cidr" {
  type = list
  validation {
    condition = length(var.public_subnet_cidr) == 2
    error_message = "Please provide only 2 subnet id's"
  }  
}
variable "private_subnet_cidr" {
  type = list
  validation {
    condition = length(var.private_subnet_cidr) == 2
    error_message = "Please provide only 2 subnet id's"
  }
}
variable "database_subnet_cidr" {
  type = list
  validation {
    condition = length(var.database_subnet_cidr) == 2
    error_message = "Please provide only 2 subnet id's"
  }
}

variable "nat_gateway_tags" {
  default = {}
}