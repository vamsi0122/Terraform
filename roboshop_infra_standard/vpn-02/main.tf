module "vpn_sg" {
  source = "../../security_group_module"
  common_tags = var.common_tags
  sg_description = var.sg_description
  project_name = var.project_name
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_vpc.default.id
  sg_name = "vpn_sg"
}

resource "aws_security_group_rule" "vpn_sg" {
  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = module.vpn_sg.security_group_id
}

module "vpn_instance" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.vpn_sg.security_group_id]
  #subnet_id = local.public_subnet_ids[0] #default
  #user_data = file("roboshop-ansible.sh")
  tags = merge(
    {
      Name = "Roboshop_VPN"
    },
    var.common_tags
    
  )

}


