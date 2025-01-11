output "private_ips" {
  value = aws_instance.roboshop_servers[*].private_ip
}