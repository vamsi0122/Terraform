data "aws_ami" "custom_ami_centos" {
  most_recent = true
  owners = [ "973714476881" ]
  filter {
    name = "name"
    values = [ "Centos-8-DevOps-Practice" ]
  }
}

# data "aws_ssm_parameter" "security_group_ids" {
#   name = "/${var.project_name}/${var.env}/security_group_ids"
# }

# data "aws_ssm_parameter" "public_subnet_ids" {
#   name = "/${var.project_name}/${var.env}/public_subnet_ids"
# }

# data "aws_ssm_parameter" "private_subnet_ids" {
#   name = "/${var.project_name}/${var.env}/private_subnet_ids"
# }

# data "aws_ssm_parameter" "database_subnet_ids" {
#   name = "/${var.project_name}/${var.env}/database_subnet_ids"
# }