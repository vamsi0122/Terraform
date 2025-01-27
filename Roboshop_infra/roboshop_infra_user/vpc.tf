module "vpc" {   
  source = "../terraform_vpc_advance"
  cidr_block = var.cidr_block
  database_subnet_cidr = var.database_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
  common_tags = var.common_tags
  env = var.env
  project_name = var.project_name
}

