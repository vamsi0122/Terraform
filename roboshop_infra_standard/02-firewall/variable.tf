variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "Production"
}

variable "common_tags" {
  default = {
    Project = "RoboShop"
    Environment = "Production"
    Terrform = "true"
  }
}