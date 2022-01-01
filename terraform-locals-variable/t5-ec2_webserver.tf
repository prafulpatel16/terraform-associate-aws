resource "aws_instance" "app_server" {
  ami                         = "ami-04902260ca3d33422"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "aws-key"
  tags                        = local.common_tags
}



