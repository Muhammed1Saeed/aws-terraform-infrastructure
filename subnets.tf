resource "aws_subnet" "pub-sub-1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "saeed-pub-sub-1"
  }
}
resource "aws_subnet" "pub-sub-2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "192.168.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "saeed-pub-sub-2"
  }
}
resource "aws_subnet" "pvt-sub-1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "saeed-pvt-sub-1"
  }
}
resource "aws_subnet" "pvt-sub-2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "saeed-pvt-sub-2"
  }
}