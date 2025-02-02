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
    component = "vpn"
  }
}

variable "sg_description" {
  default = "This is created for default vpc to allow only out asset ip"
}