module "mongodb_instance" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id = local.db_subnet_id #default
  user_data = file("mongodb.sh")
  tags = merge(
    {
      Name = "Mongodb"
    },
    var.common_tags
    
  )

}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name
  records = [
    {
      name = "mongodb"
      type = "A"
      ttl = 1
      records = [
        module.mongodb_instance.private_ip
      ]

    }
  ]
}