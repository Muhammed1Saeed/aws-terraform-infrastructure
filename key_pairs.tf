resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("/home/hamada/.ssh/id_ed25519.pub")
  tags = {
    Name= "saeed-bastion_key"
  }
}

resource "aws_key_pair" "private_key" {
  key_name   = "private-key"
  public_key = file("/home/hamada/.ssh/id_rsa.pub")
  tags = {
    Name= "saeed-private_key"
  }
}