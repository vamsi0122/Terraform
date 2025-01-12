resource "aws_security_group" "dynamic_tcp" {

  name  = "dynamic_tcp"
  dynamic ingress {
    for_each =  var.ingress
    content {
      from_port       = ingress.value.from_port
      description = ingress.value.description
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = ingress.value.cidr_blocks
    }
  }  

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.sg_cidr
  }
}