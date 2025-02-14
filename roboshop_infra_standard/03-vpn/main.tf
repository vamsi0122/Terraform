module "vpn_instance" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  #subnet_id = local.public_subnet_ids[0] #default
  #user_data = file("roboshop-ansible.sh")
  tags = merge(
    {
      Name = "Roboshop_VPN"
    },
    var.common_tags
    
  )

}


