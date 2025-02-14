variable "env" {
  default = "Production"
}

variable "project_name" {
  default = "roboshop"
}


variable "common_tags" {
  default = {
    Project = "RoboShop"
    Environment = "Production"
    Terrform = "true"
    component = "mysql"
  }
}

variable "sg_description" {
  default = "This is created in mysql"
}

variable "zone_name" {
  default = "bomma.store"
}