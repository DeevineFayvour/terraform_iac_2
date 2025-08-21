resource "aws_lb" "alb" {
  name               = var.alb_name
  load_balancer_type = "application"
  internal           = false
  subnets            = [var.public_subnet_1a_id, var.public_subnet_1b_id]
  security_groups    = [var.alb_sg_id] #[aws_security_group.alb.id] output of sg
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "OK"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.acm_arn #module.acm.acm_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "OK"
      status_code  = "200"
    }
  }
}