data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "custom_ami_centos" {
  most_recent = true
  owners = [ "973714476881" ]
  filter {
    name = "name"
    values = [ "Centos-8-DevOps-Practice" ]
  }
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}