module "ec2_instances" {
  for_each = var.instances
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = each.value
  vpc_security_group_ids = [local.security_group_ids]
  subnet_id = each.key == "Web" ? local.public_subnet_ids[0] : local.private_subnet_ids[0]
  tags = merge(
    {
      Name =each.key
    },
    var.common_tags
    
  )

}


module "ansible" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.security_group_ids]
  subnet_id = local.public_subnet_ids[0]
  user_data = file("roboshop-ansible.sh")
  tags = merge(
    {
      Name = "Ansible"
    },
    var.common_tags
    
  )

}