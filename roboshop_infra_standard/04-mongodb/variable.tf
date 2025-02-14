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
    component = "mongodb"
  }
}

variable "sg_description" {
  default = "This is created in mongodb"
}

variable "zone_name" {
  default = "bomma.store"
}