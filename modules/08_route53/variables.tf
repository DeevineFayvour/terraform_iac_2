variable "domain" {
  description = "The domain name for Route 53"
  type        = string
}

variable "subdomain" {
  description = "Subdomain for the record (e.g., www)"
  type        = string
  default     = "www"
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "The ALB zone ID"
  type        = string
}