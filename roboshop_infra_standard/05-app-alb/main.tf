resource "aws_lb" "app_alb" {
     name = "${var.project_name}-${var.common_tags.component}"
     internal = true
     load_balancer_type = "application"
     security_groups = [data.aws_ssm_parameter.app_alb_sg_id.value]
     subnets = split(",",data.aws_ssm_parameter.private_subnet_ids.value)

     tags = var.common_tags
  
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This is the fixed response from APP ALB"
      status_code  = "200"
    }
  }

}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = "bomma.store"

  records = [
    {
      name    = "*.app"
      type    = "A"
      alias   = {
        name    = aws_lb.app_alb.dns_name
        zone_id = aws_lb.app_alb.zone_id
      }
    }
  ]
}