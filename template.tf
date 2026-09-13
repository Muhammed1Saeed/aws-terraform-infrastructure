resource "aws_launch_template" "web" {
  name_prefix   = "web-"
  image_id      = "ami-0354c98ae10b02961"
  instance_type = "t3.micro"

  key_name = aws_key_pair.private_key.key_name

  vpc_security_group_ids = [
    aws_security_group.allow_https_ssh.id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    # Install Apache Web Server and PHP
    dnf install -y httpd wget php mariadb105-server
    # Download Lab files
    wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-ACCLFO-2/2-lab2-vpc/s3/lab-app.zip
    unzip lab-app.zip -d /var/www/html/
    # Turn on web server
    chkconfig httpd on
    service httpd start
 EOF
  )
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG-Web-Server"
    }
  }
}