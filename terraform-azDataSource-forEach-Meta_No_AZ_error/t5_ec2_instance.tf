# Avaialbility zone data sources
/*
data "aws_availability_zones" "praful_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
*/
#Ec2 instance

resource "aws_instance" "Web-Server" {
  ami                         = data.aws_ami.amznlinux2.id
  instance_type               = var.instance_type_map["dev"]
  associate_public_ip_address = true
  key_name                    = var.instance_keypair
  vpc_security_group_ids      = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  #Create EC2 instance in each availability zones of VPC
  # for_each = toset(data.aws_availability_zones.praful_azones.names)
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.ec2-filters2 :
  az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key
  user_data         = file("${path.module}/user-data-apache.sh")

  tags = {
    "Name" = "Web-Server-${each.key}"
  }

}