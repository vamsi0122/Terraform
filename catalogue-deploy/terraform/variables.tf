variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Component = "catalogue"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "domain_name" {
  default = "bomma.store"
}

variable "app_version" {
  # this is just to test variable is flowing from terraform to shell and then to ansible
  default = "100.100.100"
}