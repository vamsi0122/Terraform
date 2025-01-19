variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  default = {
    Project = "RoboShop"
    Environment = "Production"
    Terrform = "true"
  }
}

variable "vpc_tags" {
    default = {
        Name = "roboshop"
    }
  
}
variable "gw_name" {
  default = {
    
    Name = "internet_gateway"
  }
}

variable "public_cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_tags_name" {
  default = ["public_subnet_1a","public_subnet_1b"]
}

variable "awz" {
  default = ["us-east-1a","us-east-1b"]
}

variable "private_cidr" {
  type = list
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "private_tags_name" {
  default = ["private_subnet_1a","private_subnet_1b"]
}


variable "database_cidr" {
  type = list
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "database_tags_name" {
  default = ["database_subnet_1a","database_subnet_1b"]
}

variable "public_route_table_tags" {
  default = {
    Name = "Roboshop_route_public"
  }
}

variable "private_route_table_tags" {
  default = {
    Name = "Roboshop_route_private"
  }
}

variable "database_route_table_tags" {
  default = {
    Name = "Roboshop_route_database"
  }
}

