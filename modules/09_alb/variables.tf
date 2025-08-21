variable "alb_sg_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "public_subnet_1a_id" {
  type = string
}

variable "public_subnet_1b_id" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "acm_arn" {
  description = "the acm_certificate arn"
  type = string
}