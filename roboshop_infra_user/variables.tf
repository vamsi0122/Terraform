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
variable "sg_description" {
  default = "Allow all ports and protocals"
}
variable "sg_ingress_rules" {
  type =    list
  default = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  ]
}

variable "instances" {
  default = {
    MongoDB = "t3.micro"
    MySQL = "t3.micro"
    Redis = "t3.micro"
    RabbitMQ = "t3.micro"
    Catalogue = "t3.micro"
    User = "t3.micro"
    Card = "t3.micro"
    Shipping = "t3.micro"
    Payment = "t3.micro"
    Web = "t3.micro"
    MongoDB = "t3.micro"
  }
}
