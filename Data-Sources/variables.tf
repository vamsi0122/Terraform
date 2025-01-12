variable "ami_id"{
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "sg_cidr"{
    type = list
    default = ["0.0.0.0/0"]

}

variable "instance_names"{
    type    =   map
    default = {
        Web =   "t3.micro"
        Application = "t3.micro"
        DataBase    =   "t3.medium"
    }
    
}

variable "zone_id"{
    type    = string
    default =   "Z029188032MG5FWK5IWMU"
}

variable "Domain_name" {
    type = string
    default = "bomma.store"
  
}

variable "ingress" {
  type =    list
  default = [
    {
      description   =   "Allow port 22"
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    },
    {
      description   =   "Allow port 22"
      from_port       = 443
      to_port         = 443
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    },
    {
      description   =   "Allow port 22"
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    },
  ]
}
