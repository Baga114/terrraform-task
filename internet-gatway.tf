# Resource: aws_internet_gateway

resource "aws_internet_gateway" "ig-vpc_a" {
  # The VPC ID to create in.
  vpc_id = aws_vpc.vpc_a.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "ig-vpc a"
  }
}
resource "aws_internet_gateway" "ig-vpc_b" {
  # The VPC ID to create in.
  vpc_id = aws_vpc.vpc_b.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "ig-vpc b"
  }
}