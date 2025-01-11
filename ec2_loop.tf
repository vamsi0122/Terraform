resource "aws_instance" "roboshop_servers" {
    count = 3
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "DataBase" ? "t3.medium"  : "t3.micro"
    security_groups  = [aws_security_group.allow_all.name]
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