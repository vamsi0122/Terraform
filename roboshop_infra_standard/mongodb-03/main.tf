module "mongoddb_sg" {
  source = "../../security_group_module"
  common_tags = var.common_tags
  sg_description = var.sg_description
  project_name = var.project_name
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mongodb_sg"
}

resource "aws_security_group_rule" "mongodb_via_vpn" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  #cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  security_group_id = module.mongoddb_sg.security_group_id
}

module "mongodb" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.mongoddb_sg.security_group_id]
  subnet_id = local.db_subnet_id #default
  user_data = file("mongodb.sh")
  tags = merge(
    {
      Name = "Mongodb"
    },
    var.common_tags
    
  )

}


