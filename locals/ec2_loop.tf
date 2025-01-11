############create a key pair#############
resource "aws_key_pair" "prod_key_pair" {
  key_name = "prod_key_pair"
  public_key = local.key_name_public
}

resource "aws_instance" "roboshop_servers" {
    count = 3
    ami = var.ami_id
    #instance_type = var.instance_names[count.index] == "DataBase" ? "t3.medium"  : "t3.micro"
    instance_type = local.instance_type
    security_groups  = [aws_security_group.allow_all.name]
    key_name = aws_key_pair.prod_key_pair.key_name
    tags = {
        Name  = var.instance_names[count.index]
    }
}

resource "aws_route53_record" "roboshop" {
  count = 3
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.bomma.store"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop_servers[count.index].private_ip]
}