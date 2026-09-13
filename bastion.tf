resource "aws_instance" "bastion" {
  ami           = "ami-0354c98ae10b02961"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.pub-sub-1.id
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]
  key_name = aws_key_pair.bastion_key.key_name

  tags = {
    Name = "saeed-jump-server"
  }
}