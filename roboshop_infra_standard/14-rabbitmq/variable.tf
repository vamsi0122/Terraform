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
    component = "rabbitmq"
  }
}

variable "sg_description" {
  default = "This is created in rabbitmq"
}

variable "zone_name" {
  default = "bomma.store"
}