module "redis_instance" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.custom_ami_centos.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
  subnet_id = local.db_subnet_id #default
  user_data = file("redis.sh")
  tags = merge(
    {
      Name = "redis"
    },
    var.common_tags
    
  )

}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name
  records = [
    {
      name = "redis"
      type = "A"
      ttl = 1
      records = [
        module.redis_instance.private_ip
      ]

    }
  ]
}