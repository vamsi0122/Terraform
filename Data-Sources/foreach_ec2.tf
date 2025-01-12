resource "aws_instance" "Roboshop" {
  
  for_each  =    var.instance_names
  ami = var.ami_id
  instance_type = each.value
  tags = {
    Name =  each.key
  }
}

output "resource_info" {
  value = aws_instance.Roboshop
}

resource "aws_route53_record" "allow_all" {
  for_each = aws_instance.Roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.Domain_name}"
  type    = "A"
  ttl     = 1
  records = [each.key   == "Web" ? each.value.public_ip : each.value.private_ip]
}