# Resource: aws_route_table
resource "aws_route_table" "vpc-a-public" {
  # The VPC ID.
  vpc_id = aws_vpc.vpc_a.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC internet gateway or a virtual private gateway.
    gateway_id = aws_internet_gateway.ig-vpc_a.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-a-public"
  }
}

/* route table for private */
resource "aws_route_table" "vpc-a-1-private" {
  # The VPC ID.
  vpc_id = aws_vpc.vpc_a.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

  # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.vpc-a-nat-gw1.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-a-1-private"
  }
}
resource "aws_route_table" "vpc-a-2-private" {
  # The VPC ID.
  vpc_id = aws_vpc.vpc_a.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

  # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.vpc-a-nat-gw1.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-a-2-private"
  }
}


/* second vpc route-table */
resource "aws_route_table" "vpc-b-public" {
  # The VPC ID.
  vpc_id = aws_vpc.vpc_b.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC internet gateway or a virtual private gateway.
    gateway_id = aws_internet_gateway.ig-vpc_b.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-b-public"
  }
}

resource "aws_route_table" "vpc-b-1-private" {
  # The VPC ID.
  vpc_id = aws_vpc.vpc_b.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

  # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.vpc-b-nat-gw2.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-b-1-private"
  }
}

resource "aws_route_table" "vpc-b-2-private" {
  # The VPC ID.
  vpc_id = aws_vpc.vpc_a.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

  # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.vpc-b-nat-gw2.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-b-2-private"
  }
}