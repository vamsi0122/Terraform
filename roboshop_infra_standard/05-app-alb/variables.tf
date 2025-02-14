variable "cidr_block" {
  default = "10.0.0.0/16"
}

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
    component = "app-alb"
  }
}

variable "vpc_tags" {
    default = {
        Name = "roboshop"
    }
  
}
variable "internet_gateway_tags" {
  default = {
    
    Name = "internet_gateway"
  }
}

variable "public_subnet_cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  type = list
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_subnet_cidr" {
  type = list
  default = ["10.0.21.0/24","10.0.22.0/24"]
}




