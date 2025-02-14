resource "aws_lb_target_group" "cart" {
  name     = "${var.project_name}-${var.common_tags.component}"
  port = 8080
  protocol = "HTTP"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  health_check {
    enabled = true
    healthy_threshold = 2
    interval = 15
    matcher = "200-299"
    path = "/health"
    port = 8080
    protocol = "HTTP"
    timeout = 5
    unhealthy_threshold = 3
  }
}

resource "aws_launch_template" "cart" {
    name = "${var.project_name}-${var.common_tags.component}"
    image_id = data.aws_ami.custom_ami_centos.id
    instance_initiated_shutdown_behavior = "terminate"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ data.aws_ssm_parameter.cart_sg_id.value ]
    tag_specifications {
      resource_type = "instance"
      tags = {
        Name = "cart"
      }
    }
    user_data = filebase64("${path.module}/cart.sh")
  
}

resource "aws_autoscaling_group" "cart" {
  name                      = "${var.project_name}-${var.common_tags.component}"
  max_size = 3
  min_size = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 2
  target_group_arns = [aws_lb_target_group.cart.arn]
  launch_template {
    id = aws_launch_template.cart.id
    version = "$Latest"
  }
  vpc_zone_identifier = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  tag {
    key = "Name"
    value = "cart"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

}


resource "aws_autoscaling_policy" "cart" {
    autoscaling_group_name = aws_autoscaling_group.cart.name
    name = "cpu"
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
      target_value = 50.0
    }

}

resource "aws_lb_listener_rule" "cart" {
  listener_arn = data.aws_ssm_parameter.app_alb_listener_arn.value
  priority = 50

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.cart.arn

  }
  condition {
    host_header {
      values = ["cart.app.bomma.store"]
    }
  }
}