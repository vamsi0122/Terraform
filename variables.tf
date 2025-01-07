variable "ami_id"{
    type = "string"
    default = "ami-0b4f379183e5706b9"
}

variable "sg_cidr"{
    type = "list"
    default = "["0.0.0.0/0"]"
}