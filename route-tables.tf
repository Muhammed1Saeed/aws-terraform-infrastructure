resource "aws_route_table" "pub-RT" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
    Name = "saeed_pub_RT"
  }
}
  
resource "aws_route_table" "pvt_RT" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "saeed_pvt_RT"
  }
}
resource "aws_route_table_association" "assct-pub-1" {
  subnet_id = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.pub-RT.id
}
resource "aws_route_table_association" "assct-pub-2" {
  subnet_id = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.pub-RT.id
}
resource "aws_route_table_association" "assct-pvt-1" {
  subnet_id = aws_subnet.pvt-sub-1.id
  route_table_id = aws_route_table.pvt_RT.id
}
resource "aws_route_table_association" "assct-pvt-2" {
  subnet_id = aws_subnet.pvt-sub-2.id
  route_table_id = aws_route_table.pvt_RT.id
}