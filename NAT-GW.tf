resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "saeed_eip"
  }
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.pub-sub-2.id
  tags = {
    Name = "saeed-NAT-GW"
  }
}
