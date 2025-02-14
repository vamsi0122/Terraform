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
    component = "redis"
  }
}

variable "sg_description" {
  default = "This is created in redis"
}

variable "zone_name" {
  default = "bomma.store"
}