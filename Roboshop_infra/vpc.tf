module "main" {   
  source = "../terraform_vpc_module"
  cidr_block = var.cidr_block
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
  gw_name = var.gw_name
  #public subnet creation
  public_cidr = var.public_cidr
  public_tags_name = var.public_tags_name
  awz = var.awz
  #private subnet creation
  private_cidr = var.private_cidr
  private_tags_name = var.private_tags_name

  #database subnet creation
  database_cidr = var.database_cidr
  database_tags_name = var.database_tags_name

  #routing
  private_route_table_tags = var.private_route_table_tags
  public_route_table_tags = var.public_route_table_tags
  database_route_table_tags = var.database_route_table_tags
}

