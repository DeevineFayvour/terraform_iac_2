resource "aws_eip" "nat_eip1a" {
  domain = "vpc"

  tags = {
    Name = "${var.env_prefix}-nat_1"
  }
}


resource "aws_eip" "nat_eip1b" {
  domain = "vpc"

  tags = {
    Name = "${var.env_prefix}-nat_2"
  }
}

# NAT Gateway in Public Subnet 1
resource "aws_nat_gateway" "nat_1a" {
  allocation_id = aws_eip.nat_eip1a.id
  subnet_id     = var.public_subnet_1a_id  #aws_subnet.public.id

  tags = {
    Name = "${var.env_prefix}-nat_1a"
  }

# depends on is not necessary
}

# NAT Gateway in Public Subnet 2
resource "aws_nat_gateway" "nat_1b" {
  allocation_id = aws_eip.nat_eip1b.id
  subnet_id     = var.public_subnet_1b_id  # aws_subnet.public_2.id

  tags = {
    Name = "${var.env_prefix}-nat_1b"
  }
}
