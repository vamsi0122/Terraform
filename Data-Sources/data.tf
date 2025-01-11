data "aws_ami" "ami_name_local" {
    most_recent = true
    owners = [ "973714476881" ]

    filter {
      name = "name"
      values = [ "Centos-8-DevOps-Practice" ]
    }

}

output "local_ami_id"{
    value = data.aws_ami.ami_name_local.id
}

data "aws_vpc" "vpc_local"{
    default = "true"

}

output "vpc_local"{
    value = data.aws_vpc.vpc_local
}

resource "aws_security_group" "allow_all" {

  name  = "allow_PORT80_all"
  vpc_id = data.aws_vpc.vpc_local.id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }  

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}