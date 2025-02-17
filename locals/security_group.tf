resource "aws_security_group" "allow_all" {

  name  = "allow_all"
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.sg_cidr
  }  

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.sg_cidr
  }
}