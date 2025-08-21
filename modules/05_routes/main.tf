#a route table can be attached to one or more 
#subnets but if private subnets in different AZs use different NAT Gateways, each needs its own route table.

#PRIVATE ROUTE TABLE AND ASSOCIATION
# Private Route Table for AZ1 (Uses NAT Gateway 1)
resource "aws_route_table" "private_1a" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_id_1a
  }

  tags = {
    Name = "private-route-table-1"
  }
}

# Private Route Table for AZ2 (Uses NAT Gateway 2)
resource "aws_route_table" "private_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_id_1b
  }

  tags = {
    Name = "${var.env_prefix}-private-route-table-2"
  }

}


# Associate Private Subnet 1 with Route Table 1
resource "aws_route_table_association" "private_1a" {
  subnet_id      = var.private_subnet_1a_id
  route_table_id = aws_route_table.private_1a.id
}

# Associate Private Subnet 2 with Route Table 2
resource "aws_route_table_association" "private_2" {
  subnet_id      = var.private_subnet_1b_id
  route_table_id = aws_route_table.private_1b.id
}

#PUBLIC ROUTE TABLE AND ASSOCIATION
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "${var.env_prefix}-public-route-table"
  }

}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = var.public_subnet_1a_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = var.public_subnet_1b_id
  route_table_id = aws_route_table.public.id
}
