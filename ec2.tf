resource "aws_instance" "NAme" {
    ami = var.ami_id
    instance_type = "t3.micro"
}

