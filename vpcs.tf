# Create VPC A
resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC A"
  }
}
# Create VPC B
resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "VPC B"
  }
}