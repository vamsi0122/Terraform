locals {
  vpc_id = module.vpc.vpc_id
}

# locals {
#   public_subnet_ids = element(split(",", data.aws_ssm_parameter.public_subnet_ids.value),0)
# }

# locals {
#   private_subnet_ids = element(split(",", data.aws_ssm_parameter.private_subnet_ids.value),0)
# }

# locals {
#   database_subnet_ids = element(split(",", data.aws_ssm_parameter.database_subnet_ids.value),0)
# }

# locals {
#   ips = module.ec2_instances
# }


locals {
  public_subnet_ids = module.vpc.public_subnet_ids
}
locals {
  private_subnet_ids = module.vpc.private_subnet_ids
}

locals {
  database_subnet_ids = module.vpc.database_subnet_ids
}

locals {
  security_group_ids = module.sg_group.security_group_ids
}

locals {
  ips = module.ec2_instances
}

