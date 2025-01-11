variable "ami_id"{
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "sg_cidr"{
    type = list
    default = ["0.0.0.0/0"]

}

variable "instance_names"{
    type    =   list
    default    =["Web","App","DataBase"]
}

variable "zone_id"{
    type    = string
    default =   "Z029188032MG5FWK5IWMU"
}

