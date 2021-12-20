resource "aws_instance" "Web-Server" {
  ami                         = data.aws_ami.amznlinux2.id
  instance_type               = var.instance_type_map["dev"]
  associate_public_ip_address = true
  key_name                    = var.instance_keypair
  vpc_security_group_ids      = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  user_data                   = file("${path.module}/user-data-apache.sh")
  count                       = 2
  tags = {
    "Name" = "Web-Server-${count.index}"
  }

}