# Resource: aws_route_table_association
resource "aws_route_table_association" "vpc_a_public" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_subnet_a.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.vpc-a-public.id
}
resource "aws_route_table_association" "vpc-a-private1" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnet_a_1.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.vpc-a-1-private.id
}
resource "aws_route_table_association" "vpc-a-private2" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnet_a_2.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.vpc-a-2-private.id
}


# second vpc route-table-association

# Resource: aws_route_table_association
resource "aws_route_table_association" "vpc_b_public" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_subnet_b.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.vpc-b-public.id
}
resource "aws_route_table_association" "vpc-b-private1" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnet_b_1.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.vpc-b-1-private.id
}
resource "aws_route_table_association" "vpc-b-private2" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnet_b_2.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.vpc-b-2-private.id
}