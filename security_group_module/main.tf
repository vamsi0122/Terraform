resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = var.sg_description
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
        cidr_blocks = ingress.value.cidr_blocks
        from_port   = ingress.value.from_port
        protocol = ingress.value.protocol
        to_port  = ingress.value.to_port
    }
  }
  
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.env}"
    }
  )
}
