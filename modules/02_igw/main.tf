resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

#only one igw for two subnets 