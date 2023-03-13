# Create Public Subnets in VPC A and VPC B
resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.vpc_a.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id = aws_vpc.vpc_b.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet B"
  }
}

# Create Private Subnets in VPC A and VPC B
resource "aws_subnet" "private_subnet_a_1" {
  vpc_id = aws_vpc.vpc_a.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private Subnet A 1"
  }
}

resource "aws_subnet" "private_subnet_a_2" {
  vpc_id = aws_vpc.vpc_a.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private Subnet A 2"
  }
}

resource "aws_subnet" "private_subnet_b_1" {
  vpc_id = aws_vpc.vpc_b.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private Subnet B 1"
  }
}

resource "aws_subnet" "private_subnet_b_2" {
  vpc_id = aws_vpc.vpc_b.id
  cidr_block = "10.1.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private Subnet B 2"
  }
}