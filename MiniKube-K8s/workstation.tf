module "docker-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "workstation"

  instance_type = "t2.micro"
  ami = "ami-0b4f379183e5706b9"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = "subnet-074d3cf15633a223a"
  #user_data = file("workernode.sh")
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_minkube"
  description = "Allow All traffic for minikube"

  ingress {
    description      = "All traffic from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_minkube"
  }
}