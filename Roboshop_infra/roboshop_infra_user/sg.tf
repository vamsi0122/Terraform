module "sg_group" {
  source = "../security_group_module"
  common_tags = var.common_tags
  sg_description = var.sg_description
  project_name = var.project_name
  env = var.env
  sg_ingress_rules = var.sg_ingress_rules
  vpc_id = local.vpc_id
  security_group_name = "Allow_all"

}