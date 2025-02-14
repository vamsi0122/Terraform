
data "aws_ami" "custom_ami_centos" {
  most_recent = true
  owners = [ "973714476881" ]
  filter {
    name = "name"
    values = [ "Centos-8-DevOps-Practice" ]
  }
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project_name}/${var.env}/database_subnet_ids"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project_name}/${var.env}/redis_sg_id"
}

