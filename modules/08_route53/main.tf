#If i wanted to fetch my route53 hosted zone THAT HAS ALREADY BEEN CREATE

# data "aws_route53_zone" "main" {
#   name         = var.hosted_zone   # Example: "example.com"
#   private_zone = false             # Set to true if it's a private zone
# }



#TO CREATE A NEW RECORD

# resource "aws_route53_record" "www" {
#   zone_id = data.aws_route53_zone.main.zone_id
#   name    = "www.${data.aws_route53_zone.main.name}"
#   type    = "A"
#   ttl     = 300
#   records = [var.alb_dns_name]  # This should be your ALB or EC2 IP
# }

# resource "aws_route53_record" "www" {
#   zone_id = data.aws_route53_zone.main.zone_id
#   name    = "www.${data.aws_route53_zone.main.name}"
#   type    = "A"

#   alias {
#     name                   = var.alb_dns_name  # ALB's DNS name
#     zone_id                = var.alb_zone_id   # ALB's Hosted Zone ID
#     evaluate_target_health = true
#   }
# }


resource "aws_route53_zone" "main" {
  name = var.domain #var.hosted_zone  # Example: "example.com"
}

#TO CREATE RECORDS IN GENERAL
# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "www.${aws_route53_zone.main.name}"
#   type    = "A"
#   ttl     = 300
#   records = [var.alb_dns_name]  # This should be your ALB or EC2 IP
# }

# resource "aws_route53_record" "www" {
#   zone_id = data.aws_route53_zone.main.zone_id
#   name    = var.subdomain #"www.${data.aws_route53_zone.main.name}"
#   type    = "A"

#   alias {
#     name                   = var.alb_dns_name  # ALB's DNS name
#     zone_id                = var.alb_zone_id   # ALB's Hosted Zone ID
#     evaluate_target_health = true
#   }
# }

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.subdomain #var.hosted_zone  # Root domain (example.com)
  type    = "A"

  alias {
    name                   = var.alb_dns_name #aws_lb.alb.dns_name  # ALB DNS Name
    zone_id                = var.alb_zone_id #aws_lb.alb.zone_id   # ALB Hosted Zone ID
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.subdomain}" #"www.${var.hosted_zone}"  # www.example.com
  type    = "A"

  alias {
    name                   = var.alb_dns_name #aws_lb.alb.dns_name
    zone_id                = var.alb_zone_id #aws_lb.alb.zone_id
    evaluate_target_health = false
  }
}
