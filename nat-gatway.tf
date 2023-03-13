
# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "vpc-a-nat-gw1" {
  
  allocation_id = aws_eip.nat1.id
  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_subnet_a.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-a-nat-gw1"
  }
}

resource "aws_nat_gateway" "vpc-b-nat-gw2" {
  allocation_id = aws_eip.nat2.id
  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_subnet_b.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "vpc-b-nat-gw2"
  }
}