resource "aws_security_group" "allow_https_ssh" {
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "saeed-https_ssh"
  }
}
resource "aws_security_group" "allow_https" {
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "saeed-https"
  }
}
resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "saeed-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_web" {
  security_group_id = aws_security_group.allow_https_ssh.id
  referenced_security_group_id = aws_security_group.allow_https.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_https_LB" {
  security_group_id = aws_security_group.allow_https.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_web" {
  security_group_id = aws_security_group.allow_https_ssh.id
  referenced_security_group_id = aws_security_group.allow_ssh.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_jump" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "allow_ssh_jump" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.allow_https_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
resource "aws_vpc_security_group_egress_rule" "alb_to_servers" {
  security_group_id = aws_security_group.allow_https.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
